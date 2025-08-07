// Copyright © 2025 JENTIS GmbH

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

import '../generated/l10n.dart';
import '../providers/jentis.dart';
import '../providers/settings.dart';

class WebViewScreen extends ConsumerStatefulWidget {
  const WebViewScreen({super.key});

  static const path = 'webview';

  @override
  ConsumerState<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends ConsumerState<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final WebViewController controller = WebViewController();

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            // Page finished loading

            // Get the domain from settings
            final settings = ref.read(settingsProvider);
            final domain = settings.domain;

            // Only inject JavaScript if the current URL matches the domain
            if (domain != null && !url.contains(domain)) {
              if (kDebugMode) {
                print('Skipping JavaScript injection for URL: $url');
              }

              return;
            }

            // Inject JavaScript to override the push method
            await _controller.runJavaScript("""
console.log('Injecting JavaScript to override push method');

// Helper function to determine if we need to submit
function shouldSubmit(args) {
    for (let i = 0; i < args.length; i++) {
        const arg = args[i];

        // Case 1: track == 'submit'
        if (arg && typeof arg === 'object' && arg.track === 'submit') {
            return true;
        }

        // Case 2: track == 'event'
        if (arg && typeof arg === 'object' && arg.track === 'event') {
            return true;
        }

        // Case 3: second argument is true
        if (args.length > 1 && args[1] === true) {
            return true;
        }
    }

    return false;
}

// If the _jts array is not empty, we need to push the existing items to the Flutter side in batches
if (window._jts && window._jts.length > 0) {
    let batch = [];
    for (let i = 0; i < window._jts.length; i++) {
        batch.push(window._jts[i]);

        if (shouldSubmit([window._jts[i]])) {
            // Send the batch (including the submit-triggering event)
            const response = JSON.stringify({
                events: JSON.stringify(batch),
                submit: true,
            });

            console.log('Sending initial JTS batch to Flutter: ', response);
            flutterMessageHandler.postMessage(response);

            batch = [];
        }
    }
    // Send any remaining events as a final batch (submit: false)
    if (batch.length > 0) {
        const response = JSON.stringify({
            events: JSON.stringify(batch),
            submit: false,
        });
        
        console.log('Sending initial JTS batch to Flutter: ', response);
        flutterMessageHandler.postMessage(response);
    }
}

window._jts.push = function(...args) {
    // Call the original push to add all new items to the array
    Array.prototype.push.apply(this, args);
    
    let submit = shouldSubmit(args);

    const response = JSON.stringify({
        events: JSON.stringify(args),
        submit: submit,
    });

    console.log('Sending JTS events to Flutter: ', response);

    flutterMessageHandler.postMessage(response);

    // Return the new length of the array (standard push behavior)
    return this.length;
};
""");
          },
        ),
      )
      ..addJavaScriptChannel(
        'flutterMessageHandler',
        onMessageReceived: (jsMessage) async {
          // Parse the message
          final message = jsonDecode(jsMessage.message);

          final events = message['events'];
          if (events != null) {
            final List<dynamic> eventList = jsonDecode(events);
            for (final Map<String, dynamic> event in eventList) {
              final jentisEventData = JentisEventData(
                boolAttributes: Map.fromEntries(
                  event.entries
                      .where((e) => e.value is bool)
                      .map<MapEntry<String, bool>>(
                        (e) => MapEntry(e.key, e.value as bool),
                      ),
                ),
                stringAttributes: Map.fromEntries(
                  event.entries
                      .where((e) => e.value is String)
                      .map<MapEntry<String, String>>(
                        (e) => MapEntry(e.key, e.value as String),
                      ),
                ),
                intAttributes: Map.fromEntries(
                  event.entries
                      .where((e) => e.value is int)
                      .map<MapEntry<String, int>>(
                        (e) => MapEntry(e.key, e.value as int),
                      ),
                ),
                doubleAttributes: Map.fromEntries(
                  event.entries
                      .where((e) => e.value is double)
                      .map<MapEntry<String, double>>(
                        (e) => MapEntry(e.key, e.value as double),
                      ),
                ),
              );

              if (kDebugMode) {
                print('Push event from JS: ${jsonEncode(jentisEventData)}');
                await ref.read(jentisProvider).push([jentisEventData]);
              }
            }
          }

          final submit = message['submit'];
          if (submit) {
            if (kDebugMode) {
              print('Submit from JS');
              await ref.read(jentisProvider).submit();
            }
          }
        },
      )
      ..loadHtmlString('''
<html>
    <head>
        <title>Web-View-Bridge</title>
        <script type="text/javascript">
            // Jentis data layer example
            window._jts = [
              { track: "pageview" },
              { track: "submit" },
              {
                track: "pageview",
                pagetitle: "Demo-APP Order Confirmed"
              },
              {
                track: "product",
                type: "order",
                id: "123",
                name: "Testproduct",
                brutto: 199.99
              },
              {
                track: "product",
                type: "order",
                id: "456",
                name: "Testproduct 2",
                brutto: 299.99
              },
              {
                track: "order",
                orderid: "12345666",
                paytype: "creditcard",
                brutto: 499.98
              }
            ];
        </script>
    </head>
    <body>
        <h1>Web-View-Bridge</h1>
        <p>This is a simple example of a web view that communicates with the Jentis SDK.</p>

        <!-- Test Buttons -->
        <button id="btn-pageview" type="button">Push pageview event</button>
        <button id="btn-submit" type="button">Push submit event</button>

        <script type="text/javascript">
            // Add event listeners for test buttons
            document.getElementById('btn-pageview').onclick = function() {
                window._jts.push({ track: 'pageview' });
            };
            document.getElementById('btn-submit').onclick = function() {
                window._jts.push({ track: 'submit' });
            };
        </script>
    </body>
</html>''');

    // Enable debugging on Android when in debug mode
    if (kDebugMode && controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.of(context).webViewExample)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}

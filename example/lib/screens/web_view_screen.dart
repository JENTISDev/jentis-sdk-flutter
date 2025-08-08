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
import '../utils.dart';

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
            await _controller.runJavaScript(dataLayerPushOverride);
          },
        ),
      )
      ..addJavaScriptChannel(
        'flutterMessageHandler',
        onMessageReceived: (jsMessage) async {},
      )
      ..loadHtmlString(jsBridgeExample);

    // Enable debugging on Android when in debug mode
    if (kDebugMode && controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
    }

    _controller = controller;
  }

  // Handle messages from the web view
  Future<void> onFlutterMessageReceived(JavaScriptMessage jsMessage) async {
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

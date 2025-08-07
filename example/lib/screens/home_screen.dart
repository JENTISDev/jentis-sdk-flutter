import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../generated/l10n.dart';
import '../widgets/consent_settings.dart';
import 'debug_screen.dart';
import 'settings_screen.dart';
import 'tracking_screen.dart';
import 'web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.version,
    required this.buildNumber,
  });

  final String version;
  final String buildNumber;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showConsentSettings = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed:
                () => GoRouter.of(context).push('./${SettingsScreen.path}'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 48.0,
                        horizontal: 24.0,
                      ),
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        semanticsLabel: Strings.of(context).jentis,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showConsentSettings = !_showConsentSettings;
                        });
                      },
                      child: Text(Strings.of(context).consents),
                    ),
                    if (_showConsentSettings)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ConsentSettings(),
                      ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed:
                          () => GoRouter.of(
                            context,
                          ).push('./${TrackingScreen.path}'),
                      child: Text(Strings.of(context).trackingExamples),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed:
                          () => GoRouter.of(
                            context,
                          ).push('./${DebugScreen.path}'),
                      child: Text(Strings.of(context).debugScreen),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed:
                          () => GoRouter.of(
                            context,
                          ).push('./${WebViewScreen.path}'),
                      child: Text(Strings.of(context).webViewExample),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                Strings.of(context).version(widget.version, widget.buildNumber),
              ),
            ),
            const SizedBox(height: 48.0),
          ],
        ),
      ),
    );
  }
}

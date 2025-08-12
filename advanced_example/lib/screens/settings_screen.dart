// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import '../generated/l10n.dart';
import '../providers/jentis.dart';
import '../providers/settings.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  static const path = 'settings';

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final TextEditingController _domainController = TextEditingController(
    text: ref.read(settingsProvider).domain,
  );
  late final TextEditingController _trackDomainController =
      TextEditingController(text: ref.read(settingsProvider).trackDomain);
  late final TextEditingController _containerController = TextEditingController(
    text: ref.read(settingsProvider).container,
  );
  late final TextEditingController _versionController = TextEditingController(
    text: ref.read(settingsProvider).version,
  );
  late final TextEditingController _debugCodeController = TextEditingController(
    text: ref.read(settingsProvider).debugCode,
  );
  late final TextEditingController _sessionTimeoutController =
      TextEditingController(
        text: ref.read(settingsProvider).sessionTimeoutInSeconds?.toString(),
      );
  late final TextEditingController _authorizationTokenController =
      TextEditingController(
        text: ref.read(settingsProvider).authorizationToken,
      );

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(Strings.of(context).configuration)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8.0,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.of(context).protocol),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<CustomProtocol>(
                                title: Text(Strings.of(context).httpsProtocol),
                                value: CustomProtocol.https,
                                groupValue: settings.customProtocol,
                                onChanged: (CustomProtocol? value) {
                                  ref
                                      .read(settingsProvider.notifier)
                                      .updateSettings(customProtocol: value);
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<CustomProtocol>(
                                title: Text(Strings.of(context).httpProtocol),
                                value: CustomProtocol.http,
                                groupValue: settings.customProtocol,
                                onChanged: (CustomProtocol? value) {
                                  ref
                                      .read(settingsProvider.notifier)
                                      .updateSettings(customProtocol: value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextField(
                      controller: _domainController,
                      decoration: InputDecoration(
                        labelText: 'Domain (for web view tracking)',
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(domain: value);
                      },
                    ),
                    TextField(
                      controller: _trackDomainController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).trackDomain,
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(trackDomain: value);
                      },
                    ),
                    TextField(
                      controller: _containerController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).container,
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(container: value);
                      },
                    ),
                    /*SwitchListTile(
                      title: Text(Strings.of(context).enableDebugging),
                      value: settings.enableDebugging,
                      onChanged: (bool value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(enableDebugging: value);
                      },
                    ),*/
                    TextField(
                      controller: _versionController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).versionCode,
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(version: value);
                      },
                    ),
                    TextField(
                      controller: _debugCodeController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).debugCode,
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(debugCode: value);
                      },
                    ),
                    TextField(
                      controller: _sessionTimeoutController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).sessionTimeoutSeconds,
                      ),
                      onChanged: (String value) {
                        final int? timeout = int.tryParse(value);
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(sessionTimeoutInSeconds: timeout);
                      },
                    ),
                    TextField(
                      controller: _authorizationTokenController,
                      decoration: InputDecoration(
                        labelText: Strings.of(context).authToken,
                      ),
                      onChanged: (String value) {
                        ref
                            .read(settingsProvider.notifier)
                            .updateSettings(authorizationToken: value);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.of(context).environment),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<JentisEnvironment>(
                                title: Text(
                                  Strings.of(context).liveEnvironment,
                                ),
                                value: JentisEnvironment.live,
                                groupValue: settings.environment,
                                onChanged: (JentisEnvironment? value) {
                                  ref
                                      .read(settingsProvider.notifier)
                                      .updateSettings(environment: value);
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<JentisEnvironment>(
                                title: Text(
                                  Strings.of(context).stageEnvironment,
                                ),
                                value: JentisEnvironment.stage,
                                groupValue: settings.environment,
                                onChanged: (JentisEnvironment? value) {
                                  ref
                                      .read(settingsProvider.notifier)
                                      .updateSettings(environment: value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  final settings = ref.read(settingsProvider);
                  ref
                      .read(jentisProvider)
                      .valueOrNull
                      ?.restartConfig(
                        TrackConfigData(
                          trackDomain: settings.trackDomain,
                          container: settings.container,
                          environment: settings.environment,
                          version: settings.version,
                          debugCode: settings.debugCode,
                          authorizationToken: settings.authorizationToken,
                          sessionTimeoutInSeconds:
                              settings.sessionTimeoutInSeconds,
                          customProtocol: settings.customProtocol,
                          enableOfflineTracking: settings.enableOfflineTracking,
                          offlineTimeout: settings.offlineTimeout,
                        ),
                      );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      showCloseIcon: true,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        Strings.of(context).restartedWithNewConfiguration,
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                },
                child: Text(Strings.of(context).restart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

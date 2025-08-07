// Copyright © 2025 JENTIS GmbH

import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/settings_state.dart';
import 'shared_preferences.dart';

part 'settings.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsState build() {
    // Load settings from shared preferences
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final settingsState = sharedPreferences.settingsState;

    return settingsState ?? SettingsState.initial();
  }

  void updateSettings({
    String? domain,
    CustomProtocol? customProtocol,
    String? trackDomain,
    String? container,
    //bool? enableDebugging,
    String? version,
    String? debugCode,
    int? sessionTimeoutInSeconds,
    String? authorizationToken,
    JentisEnvironment? environment,
    bool? enableOfflineTracking,
    int? offlineTimeout,
  }) {
    final newState = SettingsState(
      domain: domain ?? state.domain,
      customProtocol: customProtocol ?? state.customProtocol,
      trackDomain: trackDomain ?? state.trackDomain,
      container: container ?? state.container,
      //enableDebugging: enableDebugging ?? state.enableDebugging,
      version: version ?? state.version,
      debugCode: debugCode ?? state.debugCode,
      sessionTimeoutInSeconds:
          sessionTimeoutInSeconds ?? state.sessionTimeoutInSeconds,
      authorizationToken: authorizationToken ?? state.authorizationToken,
      environment: environment ?? state.environment,
      enableOfflineTracking:
          enableOfflineTracking ?? state.enableOfflineTracking,
      offlineTimeout: offlineTimeout ?? state.offlineTimeout,
    );

    // Save the updated settings to shared preferences
    ref.read(sharedPreferencesProvider).settingsState = newState;

    // Update the state
    state = newState;
  }
}

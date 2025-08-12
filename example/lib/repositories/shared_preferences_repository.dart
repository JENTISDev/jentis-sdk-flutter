// Copyright © 2025 JENTIS GmbH

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/consent.dart';
import '../models/settings_state.dart';

class SharedPreferencesRepository {
  const SharedPreferencesRepository(this.sharedPreferences);

  final SharedPreferencesWithCache sharedPreferences;

  static const String _consentsKey = 'consents';
  static const String _settingsStateKey = 'settings_state';

  List<Consent> get consents {
    final consents =
        sharedPreferences
            .getStringList(_consentsKey)
            ?.map((item) => Consent.fromJson(jsonDecode(item)))
            .toList();

    return consents ?? testConsents;
  }

  set consents(List<Consent> value) {
    final consents = value.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences.setStringList(_consentsKey, consents);
  }

  SettingsState? get settingsState {
    final settingsJson = sharedPreferences.getString(_settingsStateKey);

    if (settingsJson != null) {
      return SettingsState.fromJson(jsonDecode(settingsJson));
    }

    return null;
  }

  set settingsState(SettingsState? value) {
    if (value != null) {
      final settingsJson = jsonEncode(value.toJson());
      sharedPreferences.setString(_settingsStateKey, settingsJson);
    } else {
      sharedPreferences.remove(_settingsStateKey);
    }
  }
}

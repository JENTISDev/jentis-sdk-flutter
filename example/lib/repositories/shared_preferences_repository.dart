// Copyright © 2025 JENTIS GmbH

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../models/consent.dart';
import '../models/settings_state.dart';

class SharedPreferencesRepository {
  const SharedPreferencesRepository(this.sharedPreferences);

  final SharedPreferencesWithCache sharedPreferences;

  static const String _consents = 'consents';

  List<Consent> get consents {
    final stringList = sharedPreferences.getStringList(_consents);
    if (stringList != null) {
      return stringList
          .map((item) => Consent.fromJson(jsonDecode(item)))
          .toList();
    }
    return testConsents;
  }

  set consents(List<Consent> value) {
    final stringList = value.map((item) => jsonEncode(item.toJson())).toList();
    sharedPreferences.setStringList(_consents, stringList);
  }

  static const String _settingsState = 'settings_state';

  SettingsState? get settingsState {
    final jsonString = sharedPreferences.getString(_settingsState);

    if (jsonString != null) {
      return SettingsState.fromJson(jsonDecode(jsonString));
    }

    return null;
  }

  set settingsState(SettingsState? value) {
    if (value != null) {
      final jsonString = jsonEncode(value.toJson());
      sharedPreferences.setString(_settingsState, jsonString);
    } else {
      sharedPreferences.remove(_settingsState);
    }
  }
}

// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import '../constants.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    String? domain, // The tracked domain (important for web views)
    CustomProtocol? customProtocol,
    required String trackDomain,
    required String container,
    //@Default(false) bool enableDebugging,
    String? version,
    String? debugCode,
    int? sessionTimeoutInSeconds,
    required String authorizationToken,
    required JentisEnvironment environment,
    @Default(true) bool enableOfflineTracking,
    @Default(3600) int offlineTimeout,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  static SettingsState initial() {
    return initialSettings;
  }
}

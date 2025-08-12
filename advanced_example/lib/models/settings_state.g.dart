// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    _SettingsState(
      domain: json['domain'] as String?,
      customProtocol: $enumDecodeNullable(
        _$CustomProtocolEnumMap,
        json['customProtocol'],
      ),
      trackDomain: json['trackDomain'] as String,
      container: json['container'] as String,
      version: json['version'] as String?,
      debugCode: json['debugCode'] as String?,
      sessionTimeoutInSeconds:
          (json['sessionTimeoutInSeconds'] as num?)?.toInt(),
      authorizationToken: json['authorizationToken'] as String,
      environment: $enumDecode(_$JentisEnvironmentEnumMap, json['environment']),
      enableOfflineTracking: json['enableOfflineTracking'] as bool? ?? true,
      offlineTimeout: (json['offlineTimeout'] as num?)?.toInt() ?? 3600,
    );

Map<String, dynamic> _$SettingsStateToJson(_SettingsState instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'customProtocol': _$CustomProtocolEnumMap[instance.customProtocol],
      'trackDomain': instance.trackDomain,
      'container': instance.container,
      'version': instance.version,
      'debugCode': instance.debugCode,
      'sessionTimeoutInSeconds': instance.sessionTimeoutInSeconds,
      'authorizationToken': instance.authorizationToken,
      'environment': _$JentisEnvironmentEnumMap[instance.environment]!,
      'enableOfflineTracking': instance.enableOfflineTracking,
      'offlineTimeout': instance.offlineTimeout,
    };

const _$CustomProtocolEnumMap = {
  CustomProtocol.http: 'http',
  CustomProtocol.https: 'https',
};

const _$JentisEnvironmentEnumMap = {
  JentisEnvironment.live: 'live',
  JentisEnvironment.stage: 'stage',
};

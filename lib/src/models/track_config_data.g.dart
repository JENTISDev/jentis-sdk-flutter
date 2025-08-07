// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackConfigData _$TrackConfigDataFromJson(Map<String, dynamic> json) =>
    _TrackConfigData(
      trackDomain: json['trackDomain'] as String,
      container: json['container'] as String,
      environment: $enumDecode(_$JentisEnvironmentEnumMap, json['environment']),
      authorizationToken: json['authorizationToken'] as String,
      version: json['version'] as String?,
      debugCode: json['debugCode'] as String?,
      sessionTimeoutInSeconds:
          (json['sessionTimeoutInSeconds'] as num?)?.toInt(),
      customProtocol: $enumDecodeNullable(
        _$CustomProtocolEnumMap,
        json['customProtocol'],
      ),
      enableOfflineTracking: json['enableOfflineTracking'] as bool? ?? true,
      offlineTimeout: (json['offlineTimeout'] as num).toInt(),
    );

Map<String, dynamic> _$TrackConfigDataToJson(_TrackConfigData instance) =>
    <String, dynamic>{
      'trackDomain': instance.trackDomain,
      'container': instance.container,
      'environment': _$JentisEnvironmentEnumMap[instance.environment]!,
      'authorizationToken': instance.authorizationToken,
      'version': instance.version,
      'debugCode': instance.debugCode,
      'sessionTimeoutInSeconds': instance.sessionTimeoutInSeconds,
      'customProtocol': _$CustomProtocolEnumMap[instance.customProtocol],
      'enableOfflineTracking': instance.enableOfflineTracking,
      'offlineTimeout': instance.offlineTimeout,
    };

const _$JentisEnvironmentEnumMap = {
  JentisEnvironment.live: 'live',
  JentisEnvironment.stage: 'stage',
};

const _$CustomProtocolEnumMap = {
  CustomProtocol.http: 'http',
  CustomProtocol.https: 'https',
};

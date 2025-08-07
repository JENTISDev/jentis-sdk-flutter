// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jentis_event_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JentisEventData _$JentisEventDataFromJson(Map<String, dynamic> json) =>
    _JentisEventData(
      boolAttributes: (json['boolAttributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      stringAttributes: (json['stringAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      intAttributes: (json['intAttributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      doubleAttributes: (json['doubleAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, (e as num).toDouble())),
    );

Map<String, dynamic> _$JentisEventDataToJson(_JentisEventData instance) =>
    <String, dynamic>{
      'boolAttributes': instance.boolAttributes,
      'stringAttributes': instance.stringAttributes,
      'intAttributes': instance.intAttributes,
      'doubleAttributes': instance.doubleAttributes,
    };

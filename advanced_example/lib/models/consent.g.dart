// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Consent _$ConsentFromJson(Map<String, dynamic> json) => _Consent(
  vendorId: json['vendorId'] as String,
  value:
      $enumDecodeNullable(_$JentisConsentValueEnumMap, json['value']) ??
      JentisConsentValue.deny,
);

Map<String, dynamic> _$ConsentToJson(_Consent instance) => <String, dynamic>{
  'vendorId': instance.vendorId,
  'value': _$JentisConsentValueEnumMap[instance.value]!,
};

const _$JentisConsentValueEnumMap = {
  JentisConsentValue.allow: 'allow',
  JentisConsentValue.deny: 'deny',
  JentisConsentValue.ncm: 'ncm',
};

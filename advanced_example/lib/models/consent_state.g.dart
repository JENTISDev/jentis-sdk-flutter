// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsentState _$ConsentStateFromJson(Map<String, dynamic> json) =>
    _ConsentState(
      consents:
          (json['consents'] as List<dynamic>)
              .map((e) => Consent.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ConsentStateToJson(_ConsentState instance) =>
    <String, dynamic>{'consents': instance.consents};

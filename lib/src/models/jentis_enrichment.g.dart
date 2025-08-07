// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jentis_enrichment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JentisEnrichment _$JentisEnrichmentFromJson(Map<String, dynamic> json) =>
    _JentisEnrichment(
      pluginId: json['pluginId'] as String,
      arguments: json['arguments'] as Map<String, dynamic>?,
      variables:
          (json['variables'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$JentisEnrichmentToJson(_JentisEnrichment instance) =>
    <String, dynamic>{
      'pluginId': instance.pluginId,
      'arguments': instance.arguments,
      'variables': instance.variables,
    };

// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jentis_enrichment.freezed.dart';
part 'jentis_enrichment.g.dart';

/// Model representing enrichment data for Jentis tracking events.
/// Used to provide additional context or variables to the SDK for enhanced
/// tracking.
@freezed
sealed class JentisEnrichment with _$JentisEnrichment {
  /// Creates a new [JentisEnrichment] with the given plugin ID, arguments, and variables.
  const factory JentisEnrichment({
    /// The plugin ID used
    required String pluginId,

    /// Optional arguments
    Map<String, Object?>? arguments,

    /// Optional list of variable names to be enriched.
    List<String>? variables,
  }) = _JentisEnrichment;

  factory JentisEnrichment.fromJson(Map<String, dynamic> json) =>
      _$JentisEnrichmentFromJson(json);
}

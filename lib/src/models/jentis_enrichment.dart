// Copyright © 2025 JENTIS GmbH

/// Model representing enrichment data for Jentis tracking events.
/// Used to provide additional context or variables to the SDK for enhanced
/// tracking.
class JentisEnrichment {
  /// The plugin ID used
  String pluginId;

  /// Optional arguments
  Map<String, Object?>? arguments;

  /// Optional list of variable names to be enriched.
  List<String>? variables;

  /// Creates a new [JentisEnrichment] with the given plugin ID, arguments, and variables.
  JentisEnrichment({required this.pluginId, this.arguments, this.variables});
}

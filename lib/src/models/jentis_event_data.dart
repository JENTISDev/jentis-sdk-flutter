// Copyright © 2025 JENTIS GmbH

/// Model representing a single tracking event for the Jentis SDK.
/// Allows passing various attribute types for flexible event data.
class JentisEventData {
  /// Creates a new [JentisEventData] with optional attribute maps.
  JentisEventData({
    this.boolAttributes,
    this.stringAttributes,
    this.intAttributes,
    this.doubleAttributes,
  });

  /// Optional map of boolean attributes for the event.
  Map<String, bool>? boolAttributes;

  /// Optional map of string attributes for the event.
  Map<String, String>? stringAttributes;

  /// Optional map of integer attributes for the event.
  Map<String, int>? intAttributes;

  /// Optional map of double attributes for the event.
  Map<String, double>? doubleAttributes;
}

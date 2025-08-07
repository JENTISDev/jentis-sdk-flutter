// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';

part 'jentis_event_data.freezed.dart';
part 'jentis_event_data.g.dart';

/// Model representing a single tracking event for the Jentis SDK.
/// Allows passing various attribute types for flexible event data.
@freezed
sealed class JentisEventData with _$JentisEventData {
  /// Creates a new [JentisEventData] with optional attribute maps.
  const factory JentisEventData({
    /// Optional map of boolean attributes for the event.
    Map<String, bool>? boolAttributes,

    /// Optional map of string attributes for the event.
    Map<String, String>? stringAttributes,

    /// Optional map of integer attributes for the event.
    Map<String, int>? intAttributes,

    /// Optional map of double attributes for the event.
    Map<String, double>? doubleAttributes,
  }) = _JentisEventData;

  factory JentisEventData.fromJson(Map<String, dynamic> json) =>
      _$JentisEventDataFromJson(json);
}

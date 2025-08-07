// Copyright © 2025 JENTIS GmbH

import 'package:freezed_annotation/freezed_annotation.dart';

import 'custom_protocol.dart';
import 'jentis_environment.dart';

part 'track_config_data.freezed.dart';
part 'track_config_data.g.dart';

/// Model representing the configuration options for initializing the Jentis
/// SDK. Pass an instance of this class to configure tracking behavior and
/// session options.
@freezed
sealed class TrackConfigData with _$TrackConfigData {
  /// Creates a new [TrackConfigData] with the given configuration options.
  const factory TrackConfigData({
    /// The tracking domain used for sending events.
    required String trackDomain,

    /// The container ID for the Jentis SDK configuration.
    required String container,

    /// The environment (live or stage) for tracking.
    required JentisEnvironment environment,

    /// The authorization token for secure communication.
    required String authorizationToken,

    /// Optional version string
    String? version,

    /// Optional debug code
    String? debugCode,

    /// Optional session timeout in seconds.
    int? sessionTimeoutInSeconds,

    /// Optional protocol (http or https) for requests.
    CustomProtocol? customProtocol,

    /// Whether offline tracking is enabled (default: true).
    @Default(true) bool enableOfflineTracking,

    /// Timeout in seconds for offline event submission.
    required int offlineTimeout,
  }) = _TrackConfigData;

  factory TrackConfigData.fromJson(Map<String, dynamic> json) =>
      _$TrackConfigDataFromJson(json);
}

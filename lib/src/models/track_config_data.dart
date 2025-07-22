// Copyright © 2025 JENTIS GmbH

import 'custom_protocol.dart';
import 'jentis_environment.dart';

/// Model representing the configuration options for initializing the Jentis
/// SDK. Pass an instance of this class to configure tracking behavior and
/// session options.
class TrackConfigData {
  /// Creates a new [TrackConfigData] with the given configuration options.
  TrackConfigData({
    required this.trackDomain,
    required this.container,
    required this.environment,
    required this.authorizationToken,
    this.version,
    this.debugCode,
    this.sessionTimeoutInSeconds,
    this.customProtocol,
    this.enableOfflineTracking = true,
    required this.offlineTimeout,
  });

  /// The tracking domain used for sending events.
  String trackDomain;

  /// The container ID for the Jentis SDK configuration.
  String container;

  /// The environment (live or stage) for tracking.
  JentisEnvironment environment;

  /// The authorization token for secure communication.
  String authorizationToken;

  /// Optional version string
  String? version;

  /// Optional debug code
  String? debugCode;

  /// Optional session timeout in seconds.
  int? sessionTimeoutInSeconds;

  /// Optional protocol (http or https) for requests.
  CustomProtocol? customProtocol;

  /// Whether offline tracking is enabled (default: true).
  bool enableOfflineTracking;

  /// Timeout in seconds for offline event submission.
  int offlineTimeout;
}

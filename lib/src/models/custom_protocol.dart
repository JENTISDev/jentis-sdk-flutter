// Copyright © 2025 JENTIS GmbH

/// Enum representing supported protocols for tracking requests.
/// Used to specify whether HTTP or HTTPS should be used by the SDK.
enum CustomProtocol {
  http,
  https;

  /// Returns the protocol as a string (e.g. 'http://', 'https://').
  @override
  String toString() => '$name://';
}

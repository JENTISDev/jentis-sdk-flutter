// Copyright © 2025 JENTIS GmbH

import 'package:flutter/foundation.dart';
import 'package:jentis_flutter/jentis_flutter.dart';

import 'jentis_api.g.dart';

/// Implementation of the Jentis API for Flutter.
/// This class provides methods to interact with the Jentis SDK
/// via platform channels.
class Jentis {
  /// Internal API instance used for platform communication.
  final JentisApi _jentisApi;

  /// Creates a new [Jentis] instance with the default API implementation.
  Jentis() : _jentisApi = JentisApi();

  /// Creates a new [Jentis] instance with a custom API implementation.
  /// This constructor is only used for testing.
  @visibleForTesting
  Jentis.createWith(this._jentisApi);

  /// Initializes the Jentis SDK with the provided configuration and creates a
  /// new tracking session.
  Future<void> initialize(TrackConfigData config) {
    return _jentisApi.initialize(
      TrackConfig(
        trackDomain: config.trackDomain,
        container: config.container,
        environment: switch (config.environment) {
          JentisEnvironment.live => Environment.live,
          JentisEnvironment.stage => Environment.stage,
        },
        authorizationToken: config.authorizationToken,
        offlineTimeout: config.offlineTimeout,
      ),
    );
  }

  /// Restarts the Jentis SDK with a new configuration.
  /// Use this to reinitialize tracking with updated options during runtime.
  Future<void> restartConfig(TrackConfigData config) {
    return _jentisApi.restartConfig(
      TrackConfig(
        trackDomain: config.trackDomain,
        container: config.container,
        environment: switch (config.environment) {
          JentisEnvironment.live => Environment.live,
          JentisEnvironment.stage => Environment.stage,
        },
        authorizationToken: config.authorizationToken,
        offlineTimeout: config.offlineTimeout,
      ),
    );
  }

  /// Sets the consents for different providers (e.g. GA4, Facebook, AdWords).
  Future<void> setConsents(Map<String, JentisConsentValue> consents) {
    return _jentisApi.setConsents(
      consents.map(
        (key, value) => MapEntry(key, switch (value) {
          JentisConsentValue.allow => ConsentValue.allow,
          JentisConsentValue.deny => ConsentValue.deny,
          JentisConsentValue.ncm => ConsentValue.ncm,
        }),
      ),
    );
  }

  /// Pushes a list of tracking events to the DataLayer.
  /// Events are logically grouped until [submit] is called.
  Future<void> push(List<JentisEventData> events) {
    return _jentisApi.push(
      events
          .map(
            (event) => JentisEvent(
              boolAttributes: event.boolAttributes,
              stringAttributes: event.stringAttributes,
              intAttributes: event.intAttributes,
              doubleAttributes: event.doubleAttributes,
            ),
          )
          .toList(),
    );
  }

  /// Submits all pushed events as a group, applying default properties and
  /// logic. After submission, the DataLayer is reset.
  Future<void> submit([String customInitiator = 'JENTIS Datalayer SENT']) {
    return _jentisApi.submit(customInitiator);
  }

  /// Adds enrichment data to the current session.
  Future<void> addEnrichment(JentisEnrichment enrichment) {
    return _jentisApi.addEnrichment(
      Enrichment(
        pluginId: enrichment.pluginId,
        arguments: enrichment.arguments,
        variables: enrichment.variables,
      ),
    );
  }

  /// Adds custom enrichment data to the current session.
  Future<void> addCustomEnrichment(JentisEnrichment enrichment) {
    return _jentisApi.addCustomEnrichment(
      Enrichment(
        pluginId: enrichment.pluginId,
        arguments: enrichment.arguments,
        variables: enrichment.variables,
      ),
    );
  }
}

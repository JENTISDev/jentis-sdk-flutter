// Copyright © 2025 JENTIS GmbH

import 'dart:async';
import 'dart:collection';

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

  // Queue to await initialization before executing tasks.
  final Queue<Future<void> Function()> _taskQueue =
      Queue<Future<void> Function()>();
  bool _isProcessingQueue = false;

  // Completes when initialize() finishes successfully; other calls await this.
  final Completer<void> _initCompleter = Completer<void>();

  Future<void> _enqueueTask(
    Future<void> Function() action, {
    bool requireInit = true,
  }) {
    final completer = Completer<void>();

    _taskQueue.add(() async {
      try {
        // Await initialization if required.
        if (requireInit) {
          await _initCompleter.future;
        }

        // Execute the actual action.
        await action();
        completer.complete();
      } catch (e, st) {
        completer.completeError(e, st);
      }
    });

    // Start processing the queue if not already running.
    _processQueue();

    return completer.future;
  }

  Future<void> _processQueue() async {
    if (_isProcessingQueue) return;
    _isProcessingQueue = true;

    try {
      while (_taskQueue.isNotEmpty) {
        final task = _taskQueue.removeFirst();
        await task(); // await each task before proceeding to the next
      }
    } finally {
      _isProcessingQueue = false;
    }
  }

  /// Initializes the Jentis SDK with the provided configuration and creates a
  /// new tracking session.
  Future<void> initialize(TrackConfigData config) async {
    await _jentisApi.initialize(
      TrackConfig(
        trackDomain: config.trackDomain,
        container: config.container,
        environment: switch (config.environment) {
          JentisEnvironment.live => Environment.live,
          JentisEnvironment.stage => Environment.stage,
        },
        authorizationToken: config.authorizationToken,
        version: config.version,
        debugCode: config.debugCode,
        customProtocol: switch (config.customProtocol) {
          CustomProtocol.http => Protocol.http,
          CustomProtocol.https => Protocol.https,
          null => null,
        },
        sessionTimeoutInSeconds: config.sessionTimeoutInSeconds,
        enableOfflineTracking: config.enableOfflineTracking,
        offlineTimeout: config.offlineTimeout,
      ),
    );

    // Unblock queued calls after successful initialization.
    if (!_initCompleter.isCompleted) {
      _initCompleter.complete();
    }
  }

  /// Restarts the Jentis SDK with a new configuration.
  /// Use this to reinitialize tracking with updated options during runtime.
  Future<void> restartConfig(TrackConfigData config) {
    return _enqueueTask(() {
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
    });
  }

  /// Sets the consents for different providers (e.g. GA4, Facebook, AdWords).
  Future<void> setConsents(Map<String, JentisConsentValue> consents) {
    return _enqueueTask(() {
      return _jentisApi.setConsents(
        consents.map(
          (key, value) => MapEntry(key, switch (value) {
            JentisConsentValue.allow => ConsentValue.allow,
            JentisConsentValue.deny => ConsentValue.deny,
            JentisConsentValue.ncm => ConsentValue.ncm,
          }),
        ),
      );
    });
  }

  /// Pushes a list of tracking events to the DataLayer.
  /// Events are logically grouped until [submit] is called.
  Future<void> push(List<JentisEventData> events) {
    return _enqueueTask(() {
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
    });
  }

  /// Submits all pushed events as a group, applying default properties and
  /// logic. After submission, the DataLayer is reset.
  Future<void> submit([String customInitiator = 'jts_push_submit']) {
    return _enqueueTask(() {
      return _jentisApi.submit(customInitiator);
    });
  }

  /// Adds enrichment data to the current session.
  Future<void> addEnrichment(JentisEnrichment enrichment) {
    return _enqueueTask(() {
      return _jentisApi.addEnrichment(
        Enrichment(
          pluginId: enrichment.pluginId,
          arguments: enrichment.arguments,
          variables: enrichment.variables,
        ),
      );
    });
  }

  /// Adds custom enrichment data to the current session.
  Future<void> addCustomEnrichment(JentisEnrichment enrichment) {
    return _enqueueTask(() {
      return _jentisApi.addCustomEnrichment(
        Enrichment(
          pluginId: enrichment.pluginId,
          arguments: enrichment.arguments,
          variables: enrichment.variables,
        ),
      );
    });
  }
}

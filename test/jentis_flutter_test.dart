// Copyright © 2025 JENTIS GmbH

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:jentis_flutter/src/jentis_api.g.dart';

class MockJentisApi implements JentisApi {
  @override
  // ignore: non_constant_identifier_names
  BinaryMessenger? get pigeonVar_binaryMessenger => null;

  @override
  // ignore: non_constant_identifier_names
  String get pigeonVar_messageChannelSuffix => '';

  @override
  Future<void> initialize(TrackConfig config) {
    return Future.value();
  }

  @override
  Future<void> addCustomEnrichment(Enrichment enrichment) {
    return Future.value();
  }

  @override
  Future<void> addEnrichment(Enrichment enrichment) {
    return Future.value();
  }

  @override
  Future<void> push(List<JentisEvent> events) {
    return Future.value();
  }

  @override
  Future<void> setConsents(Map<String, ConsentValue> consents) {
    return Future.value();
  }

  @override
  Future<void> submit([String customInitiator = 'JENTIS Datalayer SENT']) {
    return Future.value();
  }

  @override
  Future<void> restartConfig(TrackConfig config) {
    return Future.value();
  }
}

void main() {
  group('Jentis Plugin Tests', () {
    late MockJentisApi mockApi;
    late Jentis jentis;

    setUp(() {
      mockApi = MockJentisApi();
      jentis = Jentis.createWith(mockApi);
    });

    test('initialize should complete without errors', () async {
      final config = TrackConfigData(
        customProtocol: CustomProtocol.https,
        trackDomain: 'kndmjh.nuuk.jtm-demo.com',
        container: 'nuuk',
        version: '1',
        debugCode: '05f60751-b478-4e78-b17b-8b3c70ce3d0e',
        sessionTimeoutInSeconds: 1800,
        authorizationToken: '1234',
        environment: JentisEnvironment.live,
        enableOfflineTracking: true,
        offlineTimeout: 3600,
      );

      await jentis.initialize(config);
    });

    test('setConsents should complete without errors', () async {
      final consents = {
        'google_analytics_4_server-side': JentisConsentValue.allow,
        'facebook': JentisConsentValue.deny,
        'adwords': JentisConsentValue.ncm,
      };

      await jentis.setConsents(consents);
    });

    test('push should complete without errors', () async {
      final events = [
        JentisEventData(
          stringAttributes: {
            'track': 'pageview',
            'pagetitle': 'Demo-APP Pagetitle',
            'url': 'https://www.demoapp.com',
          },
        ),
      ];

      await jentis.push(events);
    });

    test('submit should complete without errors', () async {
      await jentis.submit();
    });

    test('addEnrichment should complete without errors', () async {
      final enrichment = JentisEnrichment(
        pluginId: 'productEnrichmentService',
        arguments: {'productId': 'product_id'},
        variables: ['enrich_product_name', 'enrich_product_brutto'],
      );

      await jentis.addEnrichment(enrichment);
    });

    test('addCustomEnrichment should complete without errors', () async {
      final enrichment = JentisEnrichment(
        pluginId: 'productEnrichmentService',
        arguments: {'productId': 'product_id'},
        variables: ['enrich_product_name', 'enrich_product_brutto'],
      );

      await jentis.addCustomEnrichment(enrichment);
    });

    test('restartConfig should complete without errors', () async {
      final config = TrackConfigData(
        customProtocol: CustomProtocol.https,
        trackDomain: 'kndmjh.nuuk.jtm-demo.com',
        container: 'nuuk',
        version: '1',
        debugCode: '05f60751-b478-4e78-b17b-8b3c70ce3d0e',
        sessionTimeoutInSeconds: 1800,
        authorizationToken: '1234',
        environment: JentisEnvironment.live,
        enableOfflineTracking: true,
        offlineTimeout: 3600,
      );

      await jentis.restartConfig(config);
    });
  });
}

// Copyright © 2025 JENTIS GmbH

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/jentis_api.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/src/main/kotlin/com/jentis/flutter/JentisApi.g.kt',
    kotlinOptions: KotlinOptions(),
    swiftOut: 'ios/jentis_flutter/Sources/jentis_flutter/JentisApi.g.swift',
    swiftOptions: SwiftOptions(),
    copyrightHeader: 'pigeons/copyright.txt',
    dartPackageName: 'jentis_flutter',
  ),
)
enum Environment { live, stage }

enum Protocol {
  http,
  https;

  @override
  String toString() => '$name://';
}

class TrackConfig {
  TrackConfig({
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

  String trackDomain;
  String container;
  Environment environment;
  String authorizationToken;
  String? version;
  String? debugCode;
  int? sessionTimeoutInSeconds;
  Protocol? customProtocol;
  bool enableOfflineTracking;
  int offlineTimeout; // seconds
}

class JentisEvent {
  JentisEvent({
    this.boolAttributes,
    this.stringAttributes,
    this.intAttributes,
    this.doubleAttributes,
  });

  Map<String, bool>? boolAttributes;
  Map<String, String>? stringAttributes;
  Map<String, int>? intAttributes;
  Map<String, double>? doubleAttributes;
}

class Enrichment {
  String pluginId;
  Map<String, Object?>? arguments;
  List<String>? variables;

  Enrichment({required this.pluginId, this.arguments, this.variables});
}

enum ConsentValue { allow, deny, ncm }

@HostApi()
abstract class JentisApi {
  void initialize(TrackConfig config);
  void restartConfig(TrackConfig config);
  @async
  void setConsents(Map<String, ConsentValue> consents);
  void push(List<JentisEvent> events);
  @async
  void submit([String customInitiator = 'JENTIS Datalayer SENT']);
  void addEnrichment(Enrichment enrichment);
  void addCustomEnrichment(Enrichment enrichment);
}

// Copyright © 2025 JENTIS GmbH

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'settings.dart';

part 'jentis.g.dart';

@riverpod
Future<Jentis> jentis(Ref ref) async {
  // Initialize Jentis SDK
  final settings = ref.read(settingsProvider);
  final instance = Jentis();
  await instance.initialize(
    TrackConfigData(
      trackDomain: settings.trackDomain,
      container: settings.container,
      environment: settings.environment,
      version: settings.version,
      debugCode: settings.debugCode,
      authorizationToken: settings.authorizationToken,
      sessionTimeoutInSeconds: settings.sessionTimeoutInSeconds,
      customProtocol: settings.customProtocol,
      enableOfflineTracking: settings.enableOfflineTracking,
      offlineTimeout: settings.offlineTimeout,
    ),
  );

  return instance;
}

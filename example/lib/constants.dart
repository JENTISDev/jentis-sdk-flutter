// Copyright © 2025 JENTIS GmbH

import 'package:jentis_flutter/jentis_flutter.dart';

import 'models/consent.dart';
import 'models/settings_state.dart';

const testConsents = [
  Consent(vendorId: 'google_analytics_4_server-side'),
  Consent(vendorId: 'facebook'),
  Consent(vendorId: 'adwords'),
];

// Initial settings
const initialSettings = SettingsState(
  customProtocol: CustomProtocol.https,
  // cSpell:ignore kndmjh
  trackDomain: 'kndmjh.nuuk.jtm-demo.com',
  container: 'nuuk',
  //enableDebugging: false,
  version: '1',
  debugCode: '05f60751-b478-4e78-b17b-8b3c70ce3d0e',
  //sessionTimeoutInSeconds: 1800,
  authorizationToken: '1234',
  environment: JentisEnvironment.live,
  //enableOfflineTracking: true,
  //offlineTimeout: 3600,
);

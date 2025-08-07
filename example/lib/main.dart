// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:jentis_flutter_example/providers/settings.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/l10n.dart';
import 'providers/debug.dart';
import 'providers/jentis.dart';
import 'providers/package_info.dart';
import 'providers/shared_preferences.dart';
import 'repositories/shared_preferences_repository.dart';
import 'screens/debug_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tracking_screen.dart';
import 'screens/web_view_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();

  // GoRouter configuration
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) => MyApp(
              version: packageInfo.version,
              buildNumber: packageInfo.buildNumber,
            ),
        routes: [
          GoRoute(
            path: '/${SettingsScreen.path}',
            builder: (context, state) {
              return SettingsScreen();
            },
          ),
          GoRoute(
            path: '/${TrackingScreen.path}',
            builder: (context, state) {
              return TrackingScreen();
            },
          ),
          GoRoute(
            path: '/${DebugScreen.path}',
            builder: (context, state) {
              return DebugScreen();
            },
          ),
          GoRoute(
            path: '/${WebViewScreen.path}',
            builder: (context, state) {
              return WebViewScreen();
            },
          ),
        ],
      ),
    ],
  );

  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );
  await sharedPreferences.reloadCache();
  final sharedPreferencesRepository = SharedPreferencesRepository(
    sharedPreferences,
  );

  runApp(
    ProviderScope(
      overrides: [
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(
          sharedPreferencesRepository,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, required this.version, required this.buildNumber});

  final String version;
  final String buildNumber;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize Jentis SDK
      final settings = ref.read(settingsProvider);
      ref
          .read(jentisProvider)
          .initialize(
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
    });
  }

  @override
  Widget build(BuildContext context) {
    // Providers that are used globally
    ref.watch(settingsProvider);
    ref.watch(jentisProvider);
    ref.watch(debugProvider);

    return HomeScreen(version: widget.version, buildNumber: widget.buildNumber);
  }
}

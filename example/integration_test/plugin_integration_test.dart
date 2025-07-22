// Copyright © 2025 JENTIS GmbH

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jentis_flutter_example/generated/l10n.dart';
import 'package:jentis_flutter_example/main.dart';
import 'package:jentis_flutter_example/providers/package_info.dart';
import 'package:jentis_flutter_example/providers/shared_preferences.dart';
import 'package:jentis_flutter_example/repositories/shared_preferences_repository.dart';
import 'package:jentis_flutter_example/screens/debug_screen.dart';
import 'package:jentis_flutter_example/screens/settings_screen.dart';
import 'package:jentis_flutter_example/screens/tracking_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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

  final myApp = ProviderScope(
    overrides: [
      packageInfoProvider.overrideWithValue(packageInfo),
      sharedPreferencesProvider.overrideWithValue(sharedPreferencesRepository),
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
  );

  group('Example App Integration Tests', () {
    testWidgets('Change privacy settings', (WidgetTester tester) async {
      // Renders the UI from the given widget
      await tester.pumpWidget(myApp);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Ensure navigation is at root
      final context = tester.element(find.byType(Scaffold));
      GoRouter.of(context).go('/');
      await tester.pumpAndSettle();

      // Get the consents text and button
      final consentsText = Strings.of(context).consents;
      final consentsButton = find.widgetWithText(ElevatedButton, consentsText);

      // Tap the consents button
      await tester.tap(consentsButton);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Open the first consent dropdown by tapping its IconButton
      final dropdownIconFinder = find.descendant(
        of: find.byType(Column),
        matching: find.byType(IconButton),
      );
      expect(dropdownIconFinder, findsWidgets);
      await tester.tap(dropdownIconFinder.first);

      // Wait for the dropdown overlay to appear
      await tester.pumpAndSettle();

      // Now tap the "consentGiven" option in the dropdown
      final consentGivenText = Strings.of(context).consentGiven;
      final consentGivenOption = find.text(consentGivenText).hitTestable();
      expect(consentGivenOption, findsOneWidget);
      await tester.tap(consentGivenOption);
      await tester.pumpAndSettle();
    });

    testWidgets('Track events flow', (WidgetTester tester) async {
      // Renders the UI from the given widget
      await tester.pumpWidget(myApp);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Ensure navigation is at root
      var context = tester.element(find.byType(Scaffold));
      GoRouter.of(context).go('/');
      await tester.pumpAndSettle();

      // Get a new context after navigation
      context = tester.element(find.byType(Scaffold));

      // Tap on "Tracking Examples" button
      final trackingExamplesButton = find.widgetWithText(
        ElevatedButton,
        Strings.of(context).trackingExamples,
      );
      expect(trackingExamplesButton, findsOneWidget);
      await tester.tap(trackingExamplesButton);
      await tester.pumpAndSettle();

      // Toggle "Include Enrichment Data" to true
      final enrichmentSwitchLabel = Strings.of(context).includeEnrichmentData;
      final enrichmentSwitchFinder = find.widgetWithText(
        SwitchListTile,
        enrichmentSwitchLabel,
      );
      expect(enrichmentSwitchFinder, findsOneWidget);
      final switchWidget = tester.widget<SwitchListTile>(
        enrichmentSwitchFinder,
      );
      if (!switchWidget.value) {
        await tester.tap(enrichmentSwitchFinder);
        await tester.pumpAndSettle();
      }

      // Set custom initiator
      final customInitiatorLabel = Strings.of(context).customInitiatorLabel;
      final labelTextFinder = find.text(customInitiatorLabel);
      final customInitiatorField = find.ancestor(
        of: labelTextFinder,
        matching: find.byType(TextField),
      );
      expect(customInitiatorField, findsOneWidget);
      await tester.enterText(customInitiatorField, 'test-initiator');

      // Dismiss the keyboard
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Tap on PageView
      final pageViewButton = find.widgetWithText(
        ElevatedButton,
        Strings.of(context).pageViewAction,
      );
      expect(pageViewButton, findsOneWidget);
      await tester.tap(pageViewButton);
      await tester.pumpAndSettle();

      // Tap on ProductView
      final productViewButton = find.widgetWithText(
        ElevatedButton,
        Strings.of(context).productViewAction,
      );
      expect(productViewButton, findsOneWidget);
      await tester.tap(productViewButton);
      await tester.pumpAndSettle();

      // Tap on Add-To-Cart
      final addToCartButton = find.widgetWithText(
        ElevatedButton,
        Strings.of(context).addToCartAction,
      );
      expect(addToCartButton, findsOneWidget);
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      // Tap on Order
      final orderButton = find.widgetWithText(
        ElevatedButton,
        Strings.of(context).orderAction,
      );
      expect(orderButton, findsOneWidget);
      await tester.tap(orderButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Restart with new configuration', (WidgetTester tester) async {
      // Renders the UI from the given widget
      await tester.pumpWidget(myApp);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Ensure navigation is at root
      var context = tester.element(find.byType(Scaffold));
      GoRouter.of(context).go('/');
      await tester.pumpAndSettle();

      // Get a new context after navigation
      context = tester.element(find.byType(Scaffold));

      // Tap the settings icon
      final settingsIconFinder = find.byIcon(Icons.more_vert);
      expect(settingsIconFinder, findsOneWidget);
      await tester.tap(settingsIconFinder);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Get a new context after navigation (settings screen)
      context = tester.element(find.byType(Scaffold));

      // Select the http:// protocol radio button
      final httpProtocolText = Strings.of(context).httpProtocol;
      final httpRadioFinder = find.byWidgetPredicate(
        (widget) =>
            widget is RadioListTile &&
            widget.title is Text &&
            (widget.title as Text).data?.trim().toLowerCase() ==
                httpProtocolText.trim().toLowerCase(),
        description: 'RadioListTile with label $httpProtocolText',
      );
      expect(
        httpRadioFinder,
        findsOneWidget,
        reason: 'Could not find RadioListTile with label $httpProtocolText',
      );
      await tester.tap(httpRadioFinder);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Tap the restart button
      final restartText = Strings.of(context).restart;
      final restartButtonFinder = find.widgetWithText(
        ElevatedButton,
        restartText,
      );
      expect(restartButtonFinder, findsOneWidget);
      await tester.tap(restartButtonFinder);

      // Wait for all animations to have completed
      await tester.pumpAndSettle();

      // Check for the SnackBar
      final restartedSnackBarText =
          Strings.of(context).restartedWithNewConfiguration;
      expect(find.text(restartedSnackBarText), findsOneWidget);
    });
  });
}

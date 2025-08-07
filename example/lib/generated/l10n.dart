// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(
      _current != null,
      'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(
      instance != null,
      'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Jentis SDK Demo`
  String get appBarTitle {
    return Intl.message(
      'Jentis SDK Demo',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Jentis`
  String get jentis {
    return Intl.message('Jentis', name: 'jentis', desc: '', args: []);
  }

  /// `Consents`
  String get consents {
    return Intl.message('Consents', name: 'consents', desc: '', args: []);
  }

  /// `Tracking Examples`
  String get trackingExamples {
    return Intl.message(
      'Tracking Examples',
      name: 'trackingExamples',
      desc: '',
      args: [],
    );
  }

  /// `Version {version}({buildNumber})`
  String version(Object version, Object buildNumber) {
    return Intl.message(
      'Version $version($buildNumber)',
      name: 'version',
      desc: '',
      args: [version, buildNumber],
    );
  }

  /// `Configuration`
  String get configuration {
    return Intl.message(
      'Configuration',
      name: 'configuration',
      desc: '',
      args: [],
    );
  }

  /// `Tracking Actions`
  String get trackingActions {
    return Intl.message(
      'Tracking Actions',
      name: 'trackingActions',
      desc: '',
      args: [],
    );
  }

  /// `false`
  String get consentDenied {
    return Intl.message('false', name: 'consentDenied', desc: '', args: []);
  }

  /// `true`
  String get consentGiven {
    return Intl.message('true', name: 'consentGiven', desc: '', args: []);
  }

  /// `ncm`
  String get ncm {
    return Intl.message('ncm', name: 'ncm', desc: '', args: []);
  }

  /// `Include Enrichment Data`
  String get includeEnrichmentData {
    return Intl.message(
      'Include Enrichment Data',
      name: 'includeEnrichmentData',
      desc: '',
      args: [],
    );
  }

  /// `Custom initiator (Optional)`
  String get customInitiatorLabel {
    return Intl.message(
      'Custom initiator (Optional)',
      name: 'customInitiatorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter custom initiator`
  String get enterCustomInitiator {
    return Intl.message(
      'Enter custom initiator',
      name: 'enterCustomInitiator',
      desc: '',
      args: [],
    );
  }

  /// `General Initiators`
  String get generalInitiators {
    return Intl.message(
      'General Initiators',
      name: 'generalInitiators',
      desc: '',
      args: [],
    );
  }

  /// `PageView`
  String get pageViewAction {
    return Intl.message('PageView', name: 'pageViewAction', desc: '', args: []);
  }

  /// `ProductView`
  String get productViewAction {
    return Intl.message(
      'ProductView',
      name: 'productViewAction',
      desc: '',
      args: [],
    );
  }

  /// `Add-To-Cart`
  String get addToCartAction {
    return Intl.message(
      'Add-To-Cart',
      name: 'addToCartAction',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get orderAction {
    return Intl.message('Order', name: 'orderAction', desc: '', args: []);
  }

  /// `E-commerce Initiators`
  String get eCommerceInitiators {
    return Intl.message(
      'E-commerce Initiators',
      name: 'eCommerceInitiators',
      desc: '',
      args: [],
    );
  }

  /// `https://`
  String get httpsProtocol {
    return Intl.message('https://', name: 'httpsProtocol', desc: '', args: []);
  }

  /// `http://`
  String get httpProtocol {
    return Intl.message('http://', name: 'httpProtocol', desc: '', args: []);
  }

  /// `Enable Debugging`
  String get enableDebugging {
    return Intl.message(
      'Enable Debugging',
      name: 'enableDebugging',
      desc: '',
      args: [],
    );
  }

  /// `Protocol`
  String get protocol {
    return Intl.message('Protocol', name: 'protocol', desc: '', args: []);
  }

  /// `Environment`
  String get environment {
    return Intl.message('Environment', name: 'environment', desc: '', args: []);
  }

  /// `Live`
  String get liveEnvironment {
    return Intl.message('Live', name: 'liveEnvironment', desc: '', args: []);
  }

  /// `Stage`
  String get stageEnvironment {
    return Intl.message('Stage', name: 'stageEnvironment', desc: '', args: []);
  }

  /// `Track Domain`
  String get trackDomain {
    return Intl.message(
      'Track Domain',
      name: 'trackDomain',
      desc: '',
      args: [],
    );
  }

  /// `Container`
  String get container {
    return Intl.message('Container', name: 'container', desc: '', args: []);
  }

  /// `Debug Code`
  String get debugCode {
    return Intl.message('Debug Code', name: 'debugCode', desc: '', args: []);
  }

  /// `Session Timeout (seconds)`
  String get sessionTimeoutSeconds {
    return Intl.message(
      'Session Timeout (seconds)',
      name: 'sessionTimeoutSeconds',
      desc: '',
      args: [],
    );
  }

  /// `Auth Token`
  String get authToken {
    return Intl.message('Auth Token', name: 'authToken', desc: '', args: []);
  }

  /// `Version`
  String get versionCode {
    return Intl.message('Version', name: 'versionCode', desc: '', args: []);
  }

  /// `Debug Screen`
  String get debugScreen {
    return Intl.message(
      'Debug Screen',
      name: 'debugScreen',
      desc: '',
      args: [],
    );
  }

  /// `Clear Debug Info`
  String get clearDebugInfo {
    return Intl.message(
      'Clear Debug Info',
      name: 'clearDebugInfo',
      desc: '',
      args: [],
    );
  }

  /// `No requests yet.`
  String get noRequestsYet {
    return Intl.message(
      'No requests yet.',
      name: 'noRequestsYet',
      desc: '',
      args: [],
    );
  }

  /// `Restart`
  String get restart {
    return Intl.message('Restart', name: 'restart', desc: '', args: []);
  }

  /// `Restarted with new configuration`
  String get restartedWithNewConfiguration {
    return Intl.message(
      'Restarted with new configuration',
      name: 'restartedWithNewConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `Event sent`
  String get eventSent {
    return Intl.message('Event sent', name: 'eventSent', desc: '', args: []);
  }

  /// `Web-View Example`
  String get webViewExample {
    return Intl.message(
      'Web-View Example',
      name: 'webViewExample',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'de')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

# Jentis Flutter plugin

A Flutter plugin for the Jentis SDK.

## Example App: Riverpod & Freezed

The example app uses [Riverpod](https://riverpod.dev/) for state management and [Freezed](https://pub.dev/packages/freezed) for immutable data classes and union types. **Riverpod is optional** — you can use any state management solution you prefer. These plugins were selected because:

- **Riverpod** provides a robust, testable, and scalable way to manage app state, making it easy to share configuration and SDK state across widgets.
- **Freezed** simplifies the creation of immutable models and sealed classes, which helps with managing complex data structures like consent states and settings.

You do not need to use Riverpod or Freezed to integrate the Jentis Flutter plugin; they are used in the example for demonstration and maintainability purposes.

The included example app demonstrates how to use the Jentis Flutter plugin in practice. It features several screens to help you understand and test the SDK:

- **Settings Screen**: Configure all options used to initialize the SDK, such as domain, container, environment, and more. This allows you to experiment with different configurations and see their effects immediately.

- **Consents Section**: Change consents for different providers (e.g., GA4, Facebook, AdWords) using a simple UI. This section lets you manage privacy settings and see how consent changes are applied and persisted.

- **Tracking Examples Screen**: Test various tracking events, including PageView, ProductView, AddToCart, and Order events. This screen provides buttons and forms to trigger different event types and see how they are sent to the SDK.

- **Debug Screen**: View the requests made by the native SDK. This screen displays a log of tracking requests, making it easier to debug and verify integration.

Explore the example app to see best practices for integrating and using the Jentis Flutter plugin in your own project.

---

## Installation

Flutter version: 3.32.8

Add `jentis_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  jentis_flutter: 1.0.0
```

Run `flutter pub get` to install the package.

### Add repository to your project

/android/build.gradle.kts

```kotlin
allprojects {
    repositories {
        ...
        maven {
            url = uri("https://jitpack.io")
            credentials { username = "jp_gcs6hkvne2f97jdnosqm6mgnm3" }
        }
    }
}
```

### Support for cleartext traffic

If you need to support cleartext traffic you have to allow it first.

/ios/Runner/Info.plist

```plist
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <string>YES</string>
</dict>
```

/android/app/src/main/AndroidManifest.xml

```xml
<application
        ...
        android:usesCleartextTraffic="true">
```

---

## Initialization

Initialize the plugin at application startup to create a new session. Place the initialization in your app's startup logic (e.g., in `initState` or before your main widget runs):

```dart
final settings = ...; // Your configuration
ref.read(jentisProvider).initialize(
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
```

**Configuration options:**

- `trackDomain`
- `container`
- `environment` (live or stage)
- `version`
- `debugCode`
- `authorizationToken`
- `sessionTimeoutInSeconds`
- `customProtocol` (http/https)
- `enableOfflineTracking`
- `offlineTimeout`

More information: [Jentis SDK Initialization](https://docs.jentis.com/documentation/tracking-data-from-the-app-sdk-to-jentis-how-it-wo#AppTracking:GettingStarted-InitializetheJENTISAppSDK)

---

## Sending Tracking Events

You can send tracking events using the `jentisProvider`.

**Why are multiple events sent together?**

When you call `submit()`, all events that have been pushed are logically grouped together in the DataLayer. The SDK automatically adds default properties and applies additional logic as described in the [Jentis documentation](https://docs.jentis.com/documentation/jentis-app-tracking-how-to-use-app-sdk-data-in-jen#AppTracking:UsingyourappdataintheJENTISPlatform-JENTISSDKdefaultproperties). After submission, the DataLayer is reset. This means that events sent together with `submit()` are processed as a group, not as independent events.

This grouping ensures that related tracking information (such as product details and action types) is sent together, allowing the Jentis platform to correctly interpret and enrich the data.

Example:

```dart
final jentis = ref.read(jentisProvider);

// Optionally add enrichment data
if (includeEnrichmentData) {
  await jentis.addEnrichment(
    JentisEnrichment(
      pluginId: 'productEnrichmentService',
      arguments: {'productId': 'product_id'},
      variables: ['enrich_product_name', 'enrich_product_brutto'],
    ),
  );
}

// Push events (e.g., product view)
await jentis.push([
  JentisEventData(
    stringAttributes: {
      'track': 'pageview',
      'pagetitle': 'Demo-APP Productview',
    },
  ),
  JentisEventData(
    stringAttributes: {
      'track': 'product',
      'type': 'productview',
      'id': '123',
      'name': 'Testproduct',
    },
    doubleAttributes: {'brutto': 199.99},
  ),
  JentisEventData(stringAttributes: {'track': 'productview'}),
]);

// Submit event with custom initiator if provided
if (customInitiator != null) {
  await jentis.submit(customInitiator!);
} else {
  await jentis.submit();
}
```

See the example app for more details.

---

## Managing Privacy Settings

You can change the PrivacySettings of the currently active session:

```dart
ref.read(consentProvider.notifier).updateConsent(
  consent.copyWith(value: value ?? JentisConsentValue.deny),
);
```

Settings are applied immediately and persisted for later use.

---

## Tracking in WebViews

Tracking in WebViews is not yet implemented.

---

## Plugin Development

To contribute or extend the plugin:

- Enable Swift Package Manager for iOS:

  ```sh
  flutter config --enable-swift-package-manager
  ```

- Code generation:

  ```sh
  dart run build_runner build --delete-conflicting-outputs
  ```

- Generate Pigeon files:

  ```sh
  dart run pigeon --input ./pigeons/jentis_api.dart
  ```

---

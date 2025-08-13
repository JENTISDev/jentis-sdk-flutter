# Jentis Flutter plugin

A Flutter plugin for the Jentis SDK.

## Example apps

### Basic example

This basic example is easy to understand and does not use any optional dependencies.

### Advanced example

For a more advanced setup you can take a look at this example project.

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

### Enable Swift Package Manager for iOS

  ```sh
  flutter config --enable-swift-package-manager
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

Initialize the plugin at application startup to create a new session:

```dart
final jentis = Jentis();
await jentis.initialize(
  TrackConfigData(
    customProtocol: CustomProtocol.https,
    // cSpell:ignore kndmjh
    trackDomain: 'kndmjh.nuuk.jtm-demo.com',
    container: 'nuuk',
    version: '1',
    debugCode: '63832533-c83b-48f2-883d-74289329af7a',
    authorizationToken: '1234',
    environment: JentisEnvironment.live,
    offlineTimeout: 3600,
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

**Why are multiple events sent together?**

When you call `submit()`, all events that have been pushed are logically grouped together in the DataLayer. The SDK automatically adds default properties and applies additional logic as described in the [Jentis documentation](https://docs.jentis.com/documentation/jentis-app-tracking-how-to-use-app-sdk-data-in-jen#AppTracking:UsingyourappdataintheJENTISPlatform-JENTISSDKdefaultproperties). After submission, the DataLayer is reset. This means that events sent together with `submit()` are processed as a group, not as independent events.

This grouping ensures that related tracking information (such as product details and action types) is sent together, allowing the Jentis platform to correctly interpret and enrich the data.

Example:

```dart
// Include enrichment data in the event
await jentis.addEnrichment(
  JentisEnrichment(
    pluginId: 'productEnrichmentService',
    arguments: {'productId': 'product_id'},
    variables: [
      'enrich_product_name',
      'enrich_product_brutto',
    ],
  ),
);

// Push multiple events for add to cart action
await jentis.push([
  JentisEventData(
    stringAttributes: {
      'track': 'product',
      'type': 'addtocart',
      'id': '123',
      'name': 'Testproduct',
    },
    doubleAttributes: {'brutto': 199.99},
  ),
  JentisEventData(
    stringAttributes: {'track': 'addtocart'},
  ),
]);

// Submit event with optional custom initiator
await jentis.submit('customInitiator');
```

See the example apps for more details.

---

## Managing Privacy Settings

You can change the PrivacySettings of the currently active session:

```dart
jentis.setConsents({
  'facebook': JentisConsentValue.allow,
});
```

Settings are applied immediately and persisted for later use.

---

## Tracking in WebViews

Tracking in WebViews is not yet implemented.

---

## Plugin Development

To contribute or extend the plugin:

- Code generation:

  ```sh
  dart run build_runner build --delete-conflicting-outputs
  ```

- Generate Pigeon files:

  ```sh
  dart run pigeon --input ./pigeons/jentis_api.dart
  ```

---

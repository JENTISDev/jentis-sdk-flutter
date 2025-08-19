# Jentis Flutter plugin

A Flutter plugin for the Jentis SDK.

---

## Installation

Flutter version: *3.32.8*

Add `jentis_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  jentis_flutter: 1.0.2
```

Run `flutter pub get` to install the package.

### Add repository to your project

`/android/build.gradle.kts`

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

`/ios/Runner/Info.plist`

```plist
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <string>YES</string>
</dict>
```

`/android/app/src/main/AndroidManifest.xml`

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
    debugCode: '6fce27c5-6121-4974-b7be-9018abde551d',
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

Tracking in WebViews is supported via a JavaScript bridge. Events pushed to the Jentis data layer (`window._jts`) in the WebView are automatically sent to the Flutter side and tracked using the Jentis SDK.

**How it works:**

- The WebView injects JavaScript that overrides the `push` method of `window._jts`.
- When an event is pushed, the overridden method sends the event data to Flutter using a JavaScript channel.
- The Dart side receives the event, converts it to a `JentisEventData`, and pushes it to the SDK.
- If the event contains `track: 'submit'`, `track: 'event'`, or the second argument to `push` is `true`, a submit is triggered and all grouped events are sent. These triggers can be adjusted to meet your needs.

See the advanced example for a full implementation and details on how to customize the integration.

---

## Example apps

### Basic example

This basic example is easy to understand and does not use any optional dependencies.

### Advanced example

For a more advanced setup you can take a look at this example project.

## Testing

To test your app with the Jentis backend:

1. Go to **Publish > Preview** in the Jentis backend.
2. You will see a URL containing the parameters `jts_preview` and `jts_debug`.
3. Copy the values of these parameters from the URL:
   - Use the value of `jts_preview` for the `version` attribute in your SDK configuration.
   - Use the value of `jts_debug` for the `debugCode` attribute in your SDK configuration.
4. Start your app and begin sending events.
5. In the Jentis backend, make sure to enable **Logs** in the filter to see incoming data

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

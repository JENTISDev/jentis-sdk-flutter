# advanced_example

Demonstrates how to use the jentis_flutter plugin.

This more advanced example app uses [Riverpod](https://riverpod.dev/) for state management and [Freezed](https://pub.dev/packages/freezed) for immutable data classes and union types. **Riverpod is optional** — you can use any state management solution you prefer. These plugins were selected because:

- **Riverpod** provides a robust, testable, and scalable way to manage app state, making it easy to share configuration and SDK state across widgets.
- **Freezed** simplifies the creation of immutable models and sealed classes, which helps with managing complex data structures like consent states and settings.

You do not need to use Riverpod or Freezed to integrate the Jentis Flutter plugin; they are used in the example for demonstration and maintainability purposes.

The included example app demonstrates how to use the Jentis Flutter plugin in practice. It features several screens to help you understand and test the SDK:

- **Settings Screen**: Configure all options used to initialize the SDK, such as domain, container, environment, and more. This allows you to experiment with different configurations and see their effects immediately.

- **Consents Section**: Change consents for different providers (e.g., GA4, Facebook, AdWords) using a simple UI. This section lets you manage privacy settings and see how consent changes are applied and persisted.

- **Tracking Examples Screen**: Test various tracking events, including PageView, ProductView, AddToCart, and Order events. This screen provides buttons and forms to trigger different event types and see how they are sent to the SDK.

- **Debug Screen**: View the requests made by the native SDK. This screen displays a log of tracking requests, making it easier to debug and verify integration.

Explore the example app to see best practices for integrating and using the Jentis Flutter plugin in your own project.

## Configuration

In `/lib/constants.dart` you can find the projects default configuration.

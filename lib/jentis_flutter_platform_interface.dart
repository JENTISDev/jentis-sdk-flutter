import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'jentis_flutter_method_channel.dart';

abstract class JentisFlutterPlatform extends PlatformInterface {
  /// Constructs a JentisFlutterPlatform.
  JentisFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static JentisFlutterPlatform _instance = MethodChannelJentisFlutter();

  /// The default instance of [JentisFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelJentisFlutter].
  static JentisFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [JentisFlutterPlatform] when
  /// they register themselves.
  static set instance(JentisFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

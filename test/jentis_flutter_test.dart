import 'package:flutter_test/flutter_test.dart';
import 'package:jentis_flutter/jentis_flutter.dart';
import 'package:jentis_flutter/jentis_flutter_platform_interface.dart';
import 'package:jentis_flutter/jentis_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJentisFlutterPlatform
    with MockPlatformInterfaceMixin
    implements JentisFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JentisFlutterPlatform initialPlatform = JentisFlutterPlatform.instance;

  test('$MethodChannelJentisFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJentisFlutter>());
  });

  test('getPlatformVersion', () async {
    JentisFlutter jentisFlutterPlugin = JentisFlutter();
    MockJentisFlutterPlatform fakePlatform = MockJentisFlutterPlatform();
    JentisFlutterPlatform.instance = fakePlatform;

    expect(await jentisFlutterPlugin.getPlatformVersion(), '42');
  });
}

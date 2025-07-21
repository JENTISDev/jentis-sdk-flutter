
import 'jentis_flutter_platform_interface.dart';

class JentisFlutter {
  Future<String?> getPlatformVersion() {
    return JentisFlutterPlatform.instance.getPlatformVersion();
  }
}


import 'audiokit_platform_interface.dart';

class Audiokit {
  Future<String?> getPlatformVersion() {
    return AudiokitPlatform.instance.getPlatformVersion();
  }

  Future<String?> getAmplitude() {
    return AudiokitPlatform.instance.getAmplitude();
  }
}

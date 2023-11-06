import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audiokit_platform_interface.dart';

/// An implementation of [AudiokitPlatform] that uses method channels.
class MethodChannelAudiokit extends AudiokitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audiokit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  @override
  Future<String?> getAmplitude() async {
    final version = await methodChannel.invokeMethod<String>('getAmplitude');
    return version;
  }

}

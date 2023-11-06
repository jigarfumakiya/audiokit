import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audiokit_method_channel.dart';

abstract class AudiokitPlatform extends PlatformInterface {
  /// Constructs a AudiokitPlatform.
  AudiokitPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudiokitPlatform _instance = MethodChannelAudiokit();

  /// The default instance of [AudiokitPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudiokit].
  static AudiokitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudiokitPlatform] when
  /// they register themselves.
  static set instance(AudiokitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getAmplitude() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

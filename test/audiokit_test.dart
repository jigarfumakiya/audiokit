import 'package:flutter_test/flutter_test.dart';
import 'package:audiokit/audiokit.dart';
import 'package:audiokit/audiokit_platform_interface.dart';
import 'package:audiokit/audiokit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudiokitPlatform
    with MockPlatformInterfaceMixin
    implements AudiokitPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudiokitPlatform initialPlatform = AudiokitPlatform.instance;

  test('$MethodChannelAudiokit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudiokit>());
  });

  test('getPlatformVersion', () async {
    Audiokit audiokitPlugin = Audiokit();
    MockAudiokitPlatform fakePlatform = MockAudiokitPlatform();
    AudiokitPlatform.instance = fakePlatform;

    expect(await audiokitPlugin.getPlatformVersion(), '42');
  });
}

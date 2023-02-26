import 'package:flutter_test/flutter_test.dart';
import 'package:avkit/avkit.dart';
import 'package:avkit/avkit_platform_interface.dart';
import 'package:avkit/avkit_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAvkitPlatform
    with MockPlatformInterfaceMixin
    implements AvkitPlatform {
  @override
  Future<void> setURL(String uri) {
    return AvkitPlatform.instance.setURL(uri);
  }

  @override
  Future<void> play() {
    return AvkitPlatform.instance.play();
  }
}

void main() {
  final AvkitPlatform initialPlatform = AvkitPlatform.instance;

  test('$MethodChannelAvkit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAvkit>());
  });

  test('getPlatformVersion', () async {
    Avkit avkitPlugin = Avkit();
    MockAvkitPlatform fakePlatform = MockAvkitPlatform();
    AvkitPlatform.instance = fakePlatform;

    // expect(await avkitPlugin.getPlatformVersion(), '42');
  });
}

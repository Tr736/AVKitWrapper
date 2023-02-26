import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'avkit_method_channel.dart';

abstract class AvkitPlatform extends PlatformInterface {
  /// Constructs a AvkitPlatform.
  AvkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static AvkitPlatform _instance = MethodChannelAvkit();

  /// The default instance of [AvkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelAvkit].
  static AvkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AvkitPlatform] when
  /// they register themselves.
  static set instance(AvkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setURL(String uri) async {
    throw UnimplementedError('setURL has not been implemented.');
  }

  Future<void> play() async {
    throw UnimplementedError('play has not been implemented.');
  }
}

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'avkit_platform_interface.dart';

/// An implementation of [AvkitPlatform] that uses method channels.
class MethodChannelAvkit extends AvkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('avkit');

  @override
  Future<void> setURL(String uri) async {
    try {
      return await methodChannel.invokeMethod(
        'setURL',
        <String, dynamic>{
          'url': uri,
        },
      );
    } on PlatformException catch (err) {
      throw ArgumentError(err.message);
    }
  }

  @override
  Future<void> play() async {
    await methodChannel.invokeMethod('playAudio');
  }
}

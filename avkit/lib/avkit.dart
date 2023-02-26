import 'avkit_platform_interface.dart';

class Avkit {
  Future<void> setURL(String url) async {
    AvkitPlatform.instance.setURL(url);
  }

  Future<void> play() async {
    AvkitPlatform.instance.play();
  }
}

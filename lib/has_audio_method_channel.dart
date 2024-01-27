import 'package:flutter/services.dart';
import 'has_audio_platform_interface.dart';

class MethodChannelHasAudio extends HasAudioInterface {
  static const _channel = MethodChannel('com.falcon.has_audio');

  @override
  Future<bool> check(String videoPath) async {
    try {
      final bool hasAudio =
          await _channel.invokeMethod('hasAudio', {'videoPath': videoPath});
      return hasAudio;
    } on PlatformException catch (_) {
      return false;
    }
  }
}

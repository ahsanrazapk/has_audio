import 'package:has_audio/has_audio_method_channel.dart';

class HasAudio {
  static final _instance = MethodChannelHasAudio();

  static Future<bool> check(String videoPath) {
    return _instance.check(videoPath);
  }
}

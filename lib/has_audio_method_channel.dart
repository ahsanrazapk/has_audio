import 'package:flutter/services.dart';
import 'has_audio_platform_interface.dart';

/// A method channel implementation of the [HasAudio] plugin.
///
/// This class uses method channels to interact with the platform-specific
/// implementation for checking audio in a video file.
class MethodChannelHasAudio extends HasAudioInterface {
  static const _channel = MethodChannel('com.falcon.has_audio');

  /// Checks if the provided video file contains an audio track.
  ///
  /// This method uses platform channels to invoke native code for checking
  /// the presence of audio in the video file specified by [videoPath].
  @override
  Future<bool> check(String videoPath) async {
    try {
      final bool hasAudio = await _channel.invokeMethod('hasAudio', {'videoPath': videoPath});
      return hasAudio;
    } on PlatformException catch (_) {
      return false;
    }
  }
}

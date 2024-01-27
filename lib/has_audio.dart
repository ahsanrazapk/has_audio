import 'package:has_audio/has_audio_method_channel.dart';

/// A Flutter plugin for checking if a video file contains an audio track.
///
/// This plugin provides a simple method to quickly determine the presence of
/// audio in a video file on both Android and iOS platforms.
class HasAudio {
  static final _instance = MethodChannelHasAudio();



  /// Checks if the provided video file contains an audio track.
  ///
  /// This method takes the path to a video file and checks if the file
  /// contains an audio track. It returns `true` if audio is present,
  /// otherwise `false`.
  ///
  /// [videoPath] The path to the video file.
  ///
  /// Returns a [Future<bool>] indicating the presence of audio.
  static Future<bool> check(String videoPath) {
    return _instance.check(videoPath);
  }
}

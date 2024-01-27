# has_audio

A Flutter plugin for checking if a video file contains an audio track. This plugin provides a simple method to quickly determine the presence of audio in a video file on both Android and iOS platforms.

## Features

- Check if a video file has an audio track.
- Easy-to-use with a simple method call.
- Supports both Android and iOS.

## Installation

To use this plugin, add `has_audio` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  has_audio: ^0.0.1
 ``` 

To use the HasAudio plugin, first import it in your Dart code:

```dart
import 'package:has_audio/has_audio.dart';
```

Then, you can call the `HasAudio.hasAudio` method to check if a video file contains an audio track.

```dart
String videoPath = 'path/to/your/video/file.mp4';
bool hasAudio = await HasAudio.hasAudio(videoPath);
print(hasAudio ? 'The video has audio' : 'The video does not have audio');
```




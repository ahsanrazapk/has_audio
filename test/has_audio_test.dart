import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:has_audio/has_audio.dart';
import 'package:mockito/mockito.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HasAudio Tests', () {
    const String channelName = 'com.falcon.has_audio';
    const MethodChannel channel = MethodChannel(channelName);

    final mockMethodChannel = MockMethodChannel();

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return mockMethodChannel.invokeMethod(
            methodCall.method, methodCall.arguments);
      });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('hasAudio returns true', () async {
      when(mockMethodChannel.invokeMethod<bool>('hasAudio', any))
          .thenAnswer((_) async => true);

      expect(await HasAudio.check('path/to/video.mp4'), true);
    });

    test('hasAudio returns false', () async {
      when(mockMethodChannel.invokeMethod<bool>('hasAudio', any))
          .thenAnswer((_) async => false);

      expect(await HasAudio.check('path/to/video.mp4'), false);
    });
  });
}

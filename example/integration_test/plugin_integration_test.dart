import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:has_audio/has_audio.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('HasAudio Tests', (WidgetTester tester) async {
    final bool version = await HasAudio.check("");
    expect(version, true);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_ui_intent/adaptive_ui_intent.dart';

void main() {
  group('UIIntent enum', () {
    test('contains expected values', () {
      expect(UIIntent.reading, isNotNull);
      expect(UIIntent.input, isNotNull);
      expect(UIIntent.monitoring, isNotNull);
      expect(UIIntent.media, isNotNull);
      expect(UIIntent.navigation, isNotNull);
    });
  });

  group('IntentConfig', () {
    test('creates config with given values', () {
      const config = IntentConfig(
        columns: 2,
        maxWidth: 600,
        spacing: 16,
        aspectRatio: 1.2,
      );

      expect(config.columns, 2);
      expect(config.maxWidth, 600);
      expect(config.spacing, 16);
      expect(config.aspectRatio, 1.2);
    });
  });
}

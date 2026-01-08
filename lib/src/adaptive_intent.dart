import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'ui_intent.dart';
import 'intent_config.dart';

typedef AdaptiveBuilder = Widget Function(
  BuildContext context,
  IntentConfig config,
);

class AdaptiveIntent extends StatelessWidget {
  final UIIntent intent;
  final AdaptiveBuilder builder;

  const AdaptiveIntent({
    super.key,
    required this.intent,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;

    final bool isTablet = width >= 600;
    final bool isWeb = kIsWeb;
    final bool isIOS = !isWeb && Platform.isIOS;

    final config = _resolveConfig(
      intent: intent,
      isTablet: isTablet,
      isIOS: isIOS,
    );

    return builder(context, config);
  }

  IntentConfig _resolveConfig({
    required UIIntent intent,
    required bool isTablet,
    required bool isIOS,
  }) {
    switch (intent) {
      case UIIntent.reading:
        return IntentConfig(
          columns: isTablet ? 2 : 1,
          maxWidth: isTablet ? 720 : double.infinity,
          spacing: isIOS ? 20 : 16,
          aspectRatio: 0.75,
        );

      case UIIntent.monitoring:
        return IntentConfig(
          columns: isTablet ? 3 : 1,
          maxWidth: double.infinity,
          spacing: 12,
          aspectRatio: 1.2,
        );

      case UIIntent.input:
        return IntentConfig(
          columns: 1,
          maxWidth: isTablet ? 480 : double.infinity,
          spacing: 16,
          aspectRatio: 1,
        );

      case UIIntent.navigation:
        return IntentConfig(
          columns: isTablet ? 2 : 1,
          maxWidth: double.infinity,
          spacing: 8,
          aspectRatio: 1,
        );

      case UIIntent.media:
        return IntentConfig(
          columns: isTablet ? 2 : 1,
          maxWidth: double.infinity,
          spacing: 12,
          aspectRatio: 16 / 9,
        );
    }
  }
}

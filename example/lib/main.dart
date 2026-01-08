import 'package:flutter/material.dart';
import 'package:adaptive_ui_intent/adaptive_ui_intent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Adaptive UI Intent')),
        body: AdaptiveIntent(
          intent: UIIntent.monitoring,
          builder: (context, config) {
            return Padding(
              padding: EdgeInsets.all(config.spacing),
              child: GridView.count(
                crossAxisCount: config.columns,
                childAspectRatio: config.aspectRatio,
                children: List.generate(
                  6,
                  (index) => Card(
                    child: Center(
                      child: Text(
                        'Chart $index',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

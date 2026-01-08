# 📦 adaptive_ui_intent

> **Intent-based adaptive UI for Flutter**
> Design layouts based on *what the user is doing*, not *what device they are on*.

---

## ✨ Why adaptive_ui_intent?

Most Flutter apps adapt UI like this:

```dart
if (width > 600) ...
if (Platform.isIOS) ...
if (isTablet) ...
```

This package introduces a **new way of thinking**:

> 👉 Adapt UI based on **intent**
> (reading, input, monitoring, media, navigation)

---

## 🧠 Core Concept: UI Intent

Instead of device checks, you declare **intent**:

```dart
AdaptiveIntent(
  intent: UIIntent.monitoring,
  builder: (context, config) {
    return GridView(
      crossAxisCount: config.columns,
    );
  },
);
```

The package automatically decides:

* Columns
* Spacing
* Max width
* Aspect ratio
  based on **screen size + platform + intent**

---

## 🎯 Supported UI Intents

```dart
enum UIIntent {
  reading,
  navigation,
  input,
  monitoring,
  media,
}
```

| Intent       | Best for                            |
| ------------ | ----------------------------------- |
| `reading`    | Articles, blogs, text-heavy screens |
| `navigation` | Menus, dashboards, app navigation   |
| `input`      | Forms, login, data entry            |
| `monitoring` | Charts, analytics, stats            |
| `media`      | Video, images, galleries            |

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  adaptive_ui_intent: ^0.1.0
```

Then run:

```bash
flutter pub get
```

---

## 🧩 Basic Usage

```dart
AdaptiveIntent(
  intent: UIIntent.reading,
  builder: (context, config) {
    return Padding(
      padding: EdgeInsets.all(config.spacing),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: config.maxWidth),
        child: Text(
          longArticleText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  },
);
```

---

## ⚙️ IntentConfig Explained

The `builder` provides an `IntentConfig`:

```dart
class IntentConfig {
  final int columns;
  final double maxWidth;
  final double spacing;
  final double aspectRatio;
}
```

Use it to drive **layout decisions**, not widget logic.

---

## 📊 Example: Monitoring Dashboard

```dart
AdaptiveIntent(
  intent: UIIntent.monitoring,
  builder: (context, config) {
    return GridView.count(
      crossAxisCount: config.columns,
      childAspectRatio: config.aspectRatio,
      children: List.generate(
        6,
        (i) => Card(child: Center(child: Text('Chart $i'))),
      ),
    );
  },
);
```

✔ Phone → single column
✔ Tablet → grid layout
✔ Web → wide dashboard

---

## 🎨 Platform Awareness (Built-in)

The package automatically adapts for:

* 📱 Phone vs Tablet
* 🖥️ Web
* 🍎 iOS spacing
* 🤖 Android spacing

No platform checks needed.

---

## 🧪 Example App

```bash
cd example
flutter run
```

Resize the window or switch devices to see intent-based adaptation.

---

## 🛣️ Roadmap

Planned features:

* 🔄 Custom intent overrides
* ♿ Accessibility-aware intents
* ⌚ WearOS / small-screen presets
* 📐 Foldable device support

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests if possible
4. Submit a pull request

Small improvements are welcome 🙌

---

## 📄 License

MIT License
Free for personal and commercial use.

---


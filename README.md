# Animated Gradient Text with Border

[![demo1.gif](https://i.postimg.cc/26P7Ksrw/demo1.gif)](https://postimg.cc/LY3Pq0qY)
[![demo2.gif](https://i.postimg.cc/prHn8RPg/demo2.gif)](https://postimg.cc/TLtwv8L9)

A Flutter widget for creating stunning **animated gradient text** with an optional **animated gradient border**. Perfect for adding modern, eye-catching designs to your app!

---

## Features

- **Animated Gradient Text**: Smooth, seamless gradient transitions for text.
- **Optional Animated Border**: Add a gradient border with customizable padding.
- **Customizable Colors**: Define your own gradient colors (max 5 colors).
- **Dynamic Gradient Stops**: Automatically calculates stops for any number of colors.
- **Adjustable Animation Speed**: Control the speed of the gradient animation.
- **Linear Animation Curves**: Ensures smooth transitions without snapping.
- **Easy to Use**: Simple API with flexible customization options.

---

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  animated_gradient_text: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## Usage

### Basic Example

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gradient Text Example')),
      body: Center(
        child: AnimatedGradientText(
          text: 'Hello, Flutter!',
          showBorder: true,
          colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red],
          animationSpeed: 5,
          textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          borderPadding: 8.0,
        ),
      ),
    );
  }
}
```

### Parameters

| Parameter        | Type          | Description                                                                        |
|------------------|---------------|------------------------------------------------------------------------------------|
| `text`           | `String`      | The text to display.                                                               |
| `colors`         | `List<Color>` | List of colors for the gradient (max 5 colors). Defaults to a blue-green gradient. |
| `animationSpeed` | `double`      | Speed of the animation in seconds. Defaults to `8`.                                |
| `showBorder`     | `bool`        | Whether to show the animated border. Defaults to `false`.                          |
| `textStyle`      | `TextStyle?`  | Custom text style. Defaults to `fontSize: 24, fontWeight: FontWeight.w500`.        |
| `borderPadding`  | `double`      | Spacing between the text and border. Defaults to `4.0`.                            |

---

## Usage Limits

- **Maximum Gradient Colors**: The widget supports a maximum of **5 colors** for the gradient. If more than 5 colors are provided, the widget will throw an error during development.

  Example of invalid usage:
  ```dart
  AnimatedGradientText(
    text: 'Hello, Flutter!',
    colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.purple, Colors.orange], 
    showBorder: true,
  );
  ```

  Error:  
  `'Maximum 5 colors are allowed for the gradient.'`

---

## Dynamic Gradient Stops

The widget dynamically calculates the `stops` array for the `LinearGradient` based on the number of colors provided. This ensures compatibility with any number of colors (up to the maximum limit of 5).

Example:
```dart
AnimatedGradientText(
  text: 'Hello, Flutter!',
  colors: [Colors.blue, Colors.green, Colors.yellow],
  showBorder: true,
);
```

The `stops` array will be automatically calculated as `[0.0, 0.5, 1.0]`.

---

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you'd like to contribute code, fork the repository and submit a pull request.

---

## Author

[Penguin5681](https://github.com/Penguin5681)

---


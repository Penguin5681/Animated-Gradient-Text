import 'package:animated_gradient_text/animated_gradient_text.dart';
import 'package:flutter/material.dart';

/// The main function is the entry point of the Flutter application.
void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated Gradient Text Demo'),
    );
  }
}

/// The home page of the application.
class MyHomePage extends StatelessWidget {
  /// Creates an instance of [MyHomePage].
  const MyHomePage({super.key, required this.title});

  /// The title of the home page.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// An animated gradient text widget with a specified duration and colors.
            AnimatedGradientText(
              animationDuration: 20,
              colors: [
                Colors.pinkAccent,
                Colors.blueAccent,
                Colors.red,
              ],
              borderPadding: 10,
              showBorder: false,
              text: "Cool Gradient Text",
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            /// An animated gradient text widget with a border.
            AnimatedGradientText(
              animationDuration: 20,
              colors: [
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.red,
                Colors.teal,
              ],
              borderPadding: 10,
              showBorder: true,
              text: "With A Border Too!",
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

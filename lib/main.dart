import 'package:flutter/material.dart';
import 'utils/color_utils.dart';

/// The main entry point of the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application, setting up the MaterialApp.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ColorChanger(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// stateful widget that displays "Hello there" and changes the background color
class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

/// The state for [ColorChanger], managing background color and tap count.
class _ColorChangerState extends State<ColorChanger> {
  Color _backgroundColor = Colors.white;
  int _tapCount = 0;

  /// Duration for the background color transition animation.
  static const _animationDuration = Duration(milliseconds: 500);

  /// Changes the background color to a random color and increments the tap count.
  void _changeColor() {
    setState(() {
      _backgroundColor = generateRandomColor();
      _tapCount++;
    });
  }

  /// Resets the background color to white and the tap count to zero.
  void _reset() {
    setState(() {
      _backgroundColor = Colors.white;
      _tapCount = 0;
    });
  }

  /// Determines the text color based on background luminance for readability.
  Color _getTextColor() {
    const num = 0.5;
    final brightness = _backgroundColor.computeLuminance();

    return brightness > num ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: _animationDuration,
        color: _backgroundColor,
        child: Stack(
          children: [
            Center(
              child: Semantics(
                label: 'Greeting text',
                excludeSemantics: true,
                child: Text(
                  'Hello there',
                  style: TextStyle(
                    fontSize: 24,
                    color: _getTextColor(),
                    shadows: const [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Semantics(
                label: 'Tap counter',
                excludeSemantics: true,
                child: Text(
                  'Taps: $_tapCount',
                  style: TextStyle(
                    fontSize: 16,
                    color: _getTextColor(),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: _reset,
                  backgroundColor: _getTextColor(),
                  child: const Icon(Icons.refresh, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
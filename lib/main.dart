import 'dart:math';
import 'package:flutter/material.dart';
import 'utils/color_utils.dart';

void main() {
  runApp(const MyApp());
}

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

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color _backgroundColor = Colors.white;
  int _tapCount = 0;

  void _changeColor() {
    setState(() {
      _backgroundColor = generateRandomColor();
      _tapCount++;
    });
  }

  void _reset() {
    setState(() {
      _backgroundColor = Colors.white;
      _tapCount = 0;
    });
  }

  Color _getTextColor() {
    final brightnessLevel = _backgroundColor.computeLuminance();
    
    return brightnessLevel > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Stack(
          children: [
            Center(
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
            Positioned(
              top: 16,
              right: 16,
              child: Text(
                'Taps: $_tapCount',
                style: TextStyle(
                  fontSize: 16,
                  color: _getTextColor(),
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
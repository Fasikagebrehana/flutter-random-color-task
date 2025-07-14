import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ColorChanger(),
    debugShowCheckedModeBanner: false,    
    );
  
  }}
  class ColorChanger extends StatefulWidget {
    const ColorChanger({super.key});
  
    @override
    State<ColorChanger> createState() => _ColorChangerState();
  }
  
  class _ColorChangerState extends State<ColorChanger> {
    Color _backgroundColor = Colors.white;

    void _changeColor() {
      final random = Random();
      setState(() {
        _backgroundColor = Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
      });
    }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: _changeColor,
        child: Scaffold(
            backgroundColor: _backgroundColor,
            body: Center(
              child: const Text(
                'Hello There',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),
        
      );
    }
  }
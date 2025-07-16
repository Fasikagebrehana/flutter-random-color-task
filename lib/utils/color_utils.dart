import 'dart:math';
import 'package:flutter/material.dart';


// ignore: public_member_api_docs
Color generateRandomColor() {
  final random = Random();
  
  const alphaChannel = 255;
  const rgbColorRange = 256;

  return Color.fromARGB(
    alphaChannel,
    random.nextInt(rgbColorRange),
    random.nextInt(rgbColorRange),
    random.nextInt(rgbColorRange),
  );
}
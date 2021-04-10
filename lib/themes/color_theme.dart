import 'dart:math';

import 'package:flutter/material.dart';

const primaryColor = Color(0xffb000ff);

const pinkColor = Color(0xffb000ff);
const blackColor = Color(0xff0e0017);
const greenColor = Color(0xff00D05E);
const blueColor = Color(0xff17CAFF);
const redColor = Color(0xffFF4545);

Color getRandomColor() {
  var colors = [
    Colors.deepOrange,
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.grey,
    Colors.orangeAccent,
    Colors.orange,
    Colors.blue,
    Colors.cyanAccent,
    Colors.deepPurple
  ];
  return colors[Random().nextInt(10)];
}

Color getColor(int index) {
  var colors = [
    Colors.orangeAccent,
    Colors.deepOrange,
    Colors.yellow,
    Colors.green,
    Colors.lightGreen,
    Colors.grey,
    Colors.orange,
    Colors.blue,
    Colors.cyanAccent,
    Colors.deepPurple
  ];
  return colors[index];
}

LinearGradient getGradientColor({Color color = primaryColor}) {
  return LinearGradient(
      colors: [
        color.withOpacity(0.75),
        color.withOpacity(0.25),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
}
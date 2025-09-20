import 'package:flutter/material.dart';
import 'dart:math';

final _rnd = Random();

const List<Color> palette = [
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.cyan,
  Colors.amber,
  Colors.teal,
  Colors.pink,
  Colors.indigo,
  Colors.lime,
  Colors.brown,
];

Color randomColor() {
  return palette[_rnd.nextInt(palette.length)];
}

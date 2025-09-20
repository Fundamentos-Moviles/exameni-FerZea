import 'dart:math';
import 'package:flutter/material.dart';

final _rnd = Random();

Color randomColor() {
  const palette = <Color>[
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
  return palette[_rnd.nextInt(palette.length)];
}

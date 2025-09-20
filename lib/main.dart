import 'package:flutter/material.dart';
import 'seleccion_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Seleccion_menu(),
    );
  }
}

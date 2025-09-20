import 'dart:math';
import 'package:flutter/material.dart';

class MemoramaGame extends StatefulWidget {
  @override
  _MemoramaGameState createState() => _MemoramaGameState();
}

class _MemoramaGameState extends State<MemoramaGame> {
  List<Color> colors = [];
  List<bool> visibility = [];
  List<int> selectedIndexes = [];

  int gridWidth = 4;
  int gridHeight = 5;

  @override
  void initState() {
    super.initState();
    generateInitialGrid();

  }

  void generateInitialGrid() {
    colors = List.generate(gridWidth * gridHeight, (index)
        {
          return Colors.blue;
        });

    visibility = List.generate(gridWidth * gridHeight, (index)
        {
          return false; //Mando un false para que que ponga inicialmente las cuadriculas en gris
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Memorama")),
      body: Column(
        children: [
          Text("Nombre Completo: Fernando Escobar Jaramillo"),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridWidth,  // Número de columnas
                childAspectRatio: 1.0,  // Aspecto de cada celda (1:1)
              ),
              shrinkWrap: true,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    color: visibility[index] ? colors[index] : Colors.grey,
                    margin: EdgeInsets.all(4),
                    child: Center(child: Text("")),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'random_colors.dart';

class MemoramaGame extends StatefulWidget {
  @override
  _MemoramaGameState createState() => _MemoramaGameState();
}

class _MemoramaGameState extends State<MemoramaGame> {
  List<Color> colors = [];
  List<bool> visibility = [];
  List<int> selected = [];

  int gridWidth = 4;
  int gridHeight = 5;

  @override
  void initState() {
    super.initState();
    generateInitialGrid();

  }



  void generateInitialGrid() {
    Set<Color> uniqueColors = Set();  // usamos un Set para evitar dobles

    while (uniqueColors.length < (gridWidth * gridHeight) ~/ 2) {
      uniqueColors.add(randomColor());
    }

    List<Color> colorPairs = uniqueColors.toList(); //trasforma el set a lista
    colorPairs.addAll(uniqueColors);
    colorPairs.shuffle();

    colors = List.generate(gridWidth * gridHeight, (index) => colorPairs[index]);
    visibility = List.generate(gridWidth * gridHeight, (index) => false);
  }

  void restartGame() {
    setState(() {
      generateInitialGrid();
    });
  }


  void handleSelection(int index) {
    if (selected.length == 2) return;

    setState(() {
      visibility[index] = true;
      selected.add(index);

      if (selected.length == 2) {
        int firstIndex = selected[0];
        int secondIndex = selected[1];
        if (colors[firstIndex] == colors[secondIndex]) {
          selected.clear();
        } else {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              visibility[firstIndex] = false;
              visibility[secondIndex] = false;
              selected.clear();
            });
          });
        }
      }
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
                  onTap: () => handleSelection(index),
                  child: Container(
                    color: visibility[index] ? colors[index] : Colors.grey,
                    margin: EdgeInsets.all(4),
                    child: Center(child: Text("")),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: restartGame,
            child: Text("Reiniciar Juego"),
          ),
        ],
      ),
    );
  }
}

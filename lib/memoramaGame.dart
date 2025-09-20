import 'package:flutter/material.dart';
import 'random_colors.dart';

class MemoramaGame extends StatefulWidget {
  final int gridWidth;
  final int gridHeight;

  MemoramaGame({this.gridWidth = 4, this.gridHeight = 5}); // valores por defecto

  @override
  _MemoramaGameState createState() => _MemoramaGameState();
}

class _MemoramaGameState extends State<MemoramaGame> {
  List<Color> colors = [];
  List<bool> visibility = [];
  List<int> selected = [];

  @override
  void initState() {
    super.initState();
    generateInitialGrid();

  }



  void generateInitialGrid() {
    Set<Color> uniqueColors = Set();  // usamos un Set para evitar dobles

    while (uniqueColors.length < (widget.gridWidth * widget.gridHeight) ~/ 2) {
      uniqueColors.add(randomColor());
    }

    List<Color> colorPairs = uniqueColors.toList(); //trasforma el set a lista
    colorPairs.addAll(uniqueColors);
    colorPairs.shuffle();

    colors = List.generate(widget.gridWidth * widget.gridHeight, (index) => colorPairs[index]);
    visibility = List.generate(widget.gridWidth * widget.gridHeight, (index) => false);
  }

  void restartGame() {
    setState(() {
      generateInitialGrid();
    });
  }

  bool checkWin() {
    return visibility.every((v) => v == true);
  }


  void showWinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Felicidades"),
        content: Text("Has completado el memorama"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              restartGame();
            },
            child: Text("Reiniciar"),
          ),
        ],
      ),
    );
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

          if (checkWin()) {
            showWinDialog();
          }

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
                crossAxisCount: widget.gridWidth,  // Número de columnas
                childAspectRatio: 1.0,  // Aspecto de cada celda (1:1)
              ),
              shrinkWrap: true,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => handleSelection(index),
                  child: Container(
                    decoration: BoxDecoration( //para suavizar los cuadrados
                    color: visibility[index] ? colors[index] : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                    ),
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

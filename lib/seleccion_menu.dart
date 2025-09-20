import 'package:flutter/material.dart';
import 'memoramaGame.dart';

class Seleccion_menu extends StatefulWidget {
  const Seleccion_menu({super.key});

  @override
  State<Seleccion_menu> createState() => _Seleccion_menuState();
}

class _Seleccion_menuState extends State<Seleccion_menu> {
  TextEditingController widthController = TextEditingController(text: "4");
  TextEditingController heightController = TextEditingController(text: "5");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cuadricula Seleccion")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nombre Completo: Fernando Escobar Jaramillo"),
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Número de columnas",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Número de filas",
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                int columns = int.tryParse(widthController.text) ?? 4;
                int rows = int.tryParse(heightController.text) ?? 5;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MemoramaGame(gridWidth: columns, gridHeight: rows),
                  ),
                );
              },
              child: Text("Iniciar el juego"),
            ),
          ],
        ),
      ),
    );
  }
}

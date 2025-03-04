import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

List<List<int>> winningPositions = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  bool turn = true;

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  void checkWin() {
    // check for win
    for (int i = 0; i < winningPositions.length; i++) {
      List position = winningPositions[i];
      if (data[position[0]] == turn &&
          data[position[1]] == turn &&
          data[position[2]] == turn) {
        showMessage("Winner is ${turn ? "X" : "O"}");
        data = {};
        turn = true;
        setState(() {});
        return;
      }
    }

    // check for draw
    if (data.length == 9) {
      showMessage("Draw!");
      data = {};
      turn = true;
      setState(() {});
      return;
    }

    turn = !turn;
    setState(() {});
  }

  void reset() {
    data = {};
    turn = true;
    setState(() {});
    showMessage("Reset");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

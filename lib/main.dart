import 'dart:ffi';

import 'package:flutter/material.dart';

import 'game.dart';
import 'game_data.dart';

void main() {
  runApp(const SudokuApp());
}

class SudokuApp extends StatelessWidget {
  const SudokuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天天数独',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(title: '天天数独'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<TextButton> getLevels() {
    List<TextButton> btnArr = [];
    for (int i = 1; i <= 7; i++) {
      btnArr.add(TextButton(
          onPressed: () {
            GameData(i).read((data){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GameWidget(level: i, data: data)));
            });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20))),
          child: Text("第$i关")));
    }
    return btnArr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '选择',
              ),
              ...getLevels()
            ],
          ),
        ));
  }
}

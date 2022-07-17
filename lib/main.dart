import 'dart:ffi';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '天天数独',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: '天天数独'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<TextButton> getLevels() {
    List<TextButton> btnArr = [];
    for (int i = 1; i <= 6; i++) {
      btnArr.add(TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GameWidget(level: i)));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20))),
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

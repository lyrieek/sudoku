import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({required this.level, Key? key}) : super(key: key);
  final int level;

  List<Container> getBox() {
    const commonLine = BorderSide(color: Colors.orange, width: 1);
    const boldLine = BorderSide(color: Colors.orange, width: 2);
    List<Container> btnArr = [];
    for (int x = 1; x <= 9; x++) {
      for (int y = 1; y <= 9; y++) {
        btnArr.add(Container(
            decoration: BoxDecoration(
              border: Border(
                top: x == 1 ? boldLine : commonLine,
                left: y == 1 ? boldLine : commonLine,
                right: y == 9
                    ? boldLine
                    : (y % 3 == 0 ? commonLine : BorderSide.none),
                bottom: x == 9
                    ? boldLine
                    : (x % 3 == 0 ? commonLine : BorderSide.none),
              ),
            ),
            child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {},
                child: Text("${Random().nextInt(9) + 1}"))));
      }
    }
    return btnArr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第$level关'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            GridView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
              ),
              children: getBox(),
            ),
            ElevatedButton(
                child: const Text("返回"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ])),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sudoku/data_transient.dart';
import 'package:sudoku/number_button.dart';
import 'package:sudoku/select_num.dart';

import 'game_data.dart';

class GameWidget extends StatefulWidget {

  const GameWidget({Key? key, required this.level, required this.data}) : super(key: key);

  final int level;
  final GameData data;

  @override
  State<GameWidget> createState() => GameState();
}

class GameState extends State<GameWidget> {
  Map<String, int> workArea = {};
  bool initialized = false;

  List<Container> getBox(BuildContext context) {
    const commonLine = BorderSide(color: Colors.orange, width: 1);
    const boldLine = BorderSide(color: Colors.orange, width: 2);
    List<Container> btnArr = [];
    for (int y = 1; y <= 9; y++) {
      for (int x = 1; x <= 9; x++) {
        String pos = "$x,$y";
        int value = 0;
        if (workArea[pos] != null) {
          value = workArea[pos] ?? 0;
        } else if (widget.data.reservationArea[pos] != null) {
          value = widget.data.reservationArea[pos] ?? 0;
        // } else if (!initialized) {
        //   value = Random().nextInt(12) - 2;
        //   if (value > 0) {
        //     widget.data.reservationArea[pos] = value;
        //   } else {
        //     value = 0;
        //   }
        }
        btnArr.add(Container(
            decoration: BoxDecoration(
              border: Border(
                top: y == 1 ? boldLine : commonLine,
                left: x == 1 ? boldLine : commonLine,
                right: x == 9
                    ? boldLine
                    : (x % 3 == 0 ? commonLine : BorderSide.none),
                bottom: y == 9
                    ? boldLine
                    : (y % 3 == 0 ? commonLine : BorderSide.none),
              ),
            ),
            child: NumberButton(
                isReservation: widget.data.reservationArea.containsKey(pos),
                value: value,
                action: () {
                  DataTransient.storage("select.pos", pos);
                  DataTransient.watchOne("select.value", (newValue) {
                    DataTransient.record("select.value", int.parse(newValue));
                    setState(() => workArea[pos] = int.parse(newValue));
                  });
                  showDialog(
                    context: context,
                    builder: SelectNum.view(),
                  );
                })));
      }
    }
    initialized = true;
    DataTransient.move("select.pos", "select.old.pos");
    return btnArr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第${widget.level}关'),
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
              children: getBox(context),
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

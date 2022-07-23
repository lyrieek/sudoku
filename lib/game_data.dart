import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class GameData {
  late int no;
  final Map<String, int> reservationArea = {};

  GameData(int param) {
    no = param;
  }

  read(Function(GameData) callback) async {
    try {
      const splitter = LineSplitter();
      List<String> list =
          splitter.convert(await rootBundle.loadString('assets/sudoku.txt'));
      int queryCount = 0;
      int y = 0;
      for (var item in list) {
        if (item == "-") {
          queryCount++;
          if (queryCount > no) {
            break;
          }
        } else if (queryCount == no) {
          y++;
          List<String> xArr = item.split("");
          for (int x = 0; x < xArr.length; x++) {
            if (xArr[x] != "0") {
              reservationArea["${x + 1},$y"] = int.parse(xArr[x]);
            }
          }
        }
      }
    } catch (_) {}
    callback.call(this);
    return this;
  }
}

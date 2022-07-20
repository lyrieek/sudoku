import 'package:flutter/material.dart';

class NumberButton extends TextButton {
  NumberButton(
      {Key? key,
      required bool isReservation,
      required int value,
      required VoidCallback action})
      : super(
            key: key,
            onPressed: isReservation ? () {} : action,
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black)),
            child: Text("${value > 0 ? value : ""}",
                style: TextStyle(
                    color: isReservation ? Colors.black : Colors.black45,
                    fontWeight:
                        isReservation ? FontWeight.bold : FontWeight.normal,
                    fontSize: 26)));
}

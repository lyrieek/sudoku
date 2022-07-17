import 'package:flutter/material.dart';

import 'data_transient.dart';

class SelectNum {
  static List<TextButton> getNumItems(BuildContext context) {
    List<TextButton> btnArr = [];
    for (int i = 1; i <= 9; i++) {
      btnArr.add(TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            DataTransient.record("select.value", i);
            Navigator.pop(context);
          },
          child: Text("$i",
              style: const TextStyle(color: Colors.black, fontSize: 24))));
    }
    return btnArr;
  }

  static WidgetBuilder view() {
    return (_) => Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('选择数字',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.none)),
                    ),
                    GridView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: getNumItems(_),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextButton(
                          onPressed: () {
                            // 关闭 Dialog
                            Navigator.pop(_);
                          },
                          child: const Text('取消')),
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
}

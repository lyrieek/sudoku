import 'package:flutter/material.dart';

class SelectNum {
  static WidgetBuilder view() {
    return (_) => Padding(
          padding: const EdgeInsets.all(30),
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

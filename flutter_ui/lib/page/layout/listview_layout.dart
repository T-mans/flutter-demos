import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///show usage of ListView

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(children: <Widget>[
        Text("Hello World"),
        Text("你好"),
        Text("Hello World"),
        Text("你好"),
        Text("Hello World"),
        Text("你好"),
        Text("Hello World"),
        Text("你好"),
        Text("Hello World"),
        Text("你好"),
        Text("Hello World"),
        Text("你好"),
      ],),
    );
  }
}
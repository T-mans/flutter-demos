//demo for Table
//用于展示表格布局，不会滚动，高度自适应
//首先类似于column，这个嵌套滚动肯定有高度的问题
//这个也估计不太常用
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Table(
        children: [
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好",style: TextStyle(fontSize: 19),), Text("世界")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("你好",style: TextStyle(fontSize: 19),), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好"), Text("世界")]),
          TableRow(children: [Text("Hello"), Text("World")]),
          TableRow(children: [Text("你好",style: TextStyle(fontSize: 19),), Text("世界")]),
        ],
      ),
    );
  }
}

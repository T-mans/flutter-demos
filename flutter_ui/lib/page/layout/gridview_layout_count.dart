//演示gridview.count用法
//count写法只能绘制固定数量的widgets
//GridView.count构造函数是GrdiView使用SliverGridDelegateWithFixedCrossAxisCount的简写（语法糖），效果完全一致；

import 'package:flutter/material.dart';

class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GridView.count(
        //水平子Widget之间间距
        crossAxisSpacing: 10,
        //垂直子Widget之间间距
        mainAxisSpacing: 10.0,
        //GridView内边距
        padding: EdgeInsets.all(10),
        //一行的Widget数量
        crossAxisCount: 2,
        //子Widget宽高比例，其实在count写法里面，的确无法指定item的宽高
        childAspectRatio: 2.0,
        //子Widget列表
        children: getWidgetList(),
      ),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }
}

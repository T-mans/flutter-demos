//演示gridview.custom
//custom要求必须指定delegate和childrenDelegate
///GridView.custom相对于默认构造函数可以自己指定[SliverChildDelegate],这有两个子类，如果使用[SliverChildBuilderDelegate]，其实就是GridView.builder的语法糖，也就是懒加载
///其实GridView的默认构造函数之所以不能懒加载，就是因为使用了[SliverChildListDelegate],这个类接收List<Widget>，所以要求widget都是构造完成的
///类似的，使用count和extent也是不能懒加载的

import 'package:flutter/material.dart';

class GridViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = getDataList();
    return Material(
      child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          childrenDelegate: SliverChildBuilderDelegate((context, position) {
            return getItemContainer(items[position]);
          }, childCount: items.length)),
    );
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
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

//演示gridview.builder
//builder写法必须自己指定grid delegate,这个参数用来指定grid view的构建方式
//以下有几个常用的系统内置的delegate：
///[SliverGridDelegateWithMaxCrossAxisExtent]maxCrossAxisExtent指定交叉轴最大尺寸，具体的crossAxisCount由屏幕宽度和尺寸和padding来计算
///[SliverGridDelegateWithFixedCrossAxisCount]用来指定cross axis的数量
///GridView默认构造函数可以类比于ListView默认构造函数，适用于有限个数子元素的场景，因为GridView组件会一次性全部渲染children中的子元素组件；
///GridView.builder构造函数可以类比于ListView.builder构造函数，适用于长列表的场景，因为GridView组件会根据子元素是否出现在屏幕内而动态创建销毁，减少内存消耗，更高效渲染；

import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> items = getDataList();
    return Material(
      child: GridView.builder(
          itemCount: items.length,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 20.0,
              //横轴间距
              crossAxisSpacing: 10.0,
              //子组件宽高长度比例
              childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            //Widget Function(BuildContext context, int index)
            return getItemContainer(items[index]);
          }),
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

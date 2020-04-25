//演示流式布局
import 'package:flutter/material.dart';

class FlowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flow Example'),
        ),
        body: FlowLayoutPage(),
      ),
    );
  }
}

class FlowLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowLayoutDelegate(context),
      children: <Widget>[
        Text('我爱北京天安门我爱北京天安门我爱北京天安门我爱北京天安门我爱北京天安门😁'),
        Text('天行健，君子以自强不息'),
        Text(
          'Hello,World',
          style: TextStyle(fontSize: 30),
        ),
        Text('哈哈哈😂'),
        Text(
          'Nice to meet you.',
          style: TextStyle(fontSize: 25),
        ),
        Text(
          '水光潋滟晴方好，山色空蒙雨亦奇！！！',
          style: TextStyle(fontSize: 20),
        ),
        Text('我爱北京天安门'),
        Text(
          'Hello,World',
          style: TextStyle(fontSize: 30),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Text('天行健，君子以自强不息')),
        Text('哈哈哈😂'),
        Text('Nice to meet you'),
        Text('拜拜了啊，嘿嘿嘿'),
      ],
    );
  }
}

class FlowLayoutDelegate extends FlowDelegate {
  BuildContext buildContext;

  FlowLayoutDelegate(this.buildContext);

  double xTranslation = 0; //执行paintChildren之前的x偏移总量(当前行内,也代表这一行已经使用的x)
  double yTranslation = 0; //执行paintChildren之前的y偏移总量（整个流布局从顶部开始算）
  double rowHeightLargest = 0; //记录这一行中，最高的那个元素，当新起一行的时候，刷新yTranslation，并重置为0

  //流布局的核心:当前行x偏移多少，累计y偏移多少
  @override
  void paintChildren(FlowPaintingContext context) {
    double screenWidth = MediaQuery.of(buildContext).size.width;
    for (int i = 0; i < context.childCount; i++) {
      //如果当前元素宽度大于这一行剩余的宽度，放在新的一行
      if (context.getChildSize(i).width > screenWidth - xTranslation) {
        yTranslation += rowHeightLargest;
        xTranslation = 0;
        rowHeightLargest = context.getChildSize(i).height; //新一行第一个元素的高度
      } else {
        //当前行内，如果有更高的元素，刷新rowHeightLargest
        if (rowHeightLargest < context.getChildSize(i).height) {
          rowHeightLargest = context.getChildSize(i).height;
        }
      }
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          xTranslation,
          yTranslation,
          0,
        ),
      );
      xTranslation += context.getChildSize(i).width;
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;
  }
}

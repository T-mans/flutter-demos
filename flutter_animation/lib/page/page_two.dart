//展示使用AnimatedWidget来简化PageOne手动维护Animation，Tween，setState等操作
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation =
        Tween<double>(begin: 0, end: 300).animate(controller); //这里不再进行手动设置监听器
    // #enddocregion addListener
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedLogo(
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//这里把动画的部分继承AnimatedWidget进行封装，传递一个Animation，内部会执行添加监听器和setState
class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, @required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

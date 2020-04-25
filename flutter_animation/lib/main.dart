import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animation/page/page_five.dart';
import 'package:flutter_animation/page/page_four.dart';
import 'package:flutter_animation/page/page_one.dart';
import 'package:flutter_animation/page/page_three.dart';
import 'package:flutter_animation/page/page_two.dart';

void main() {
//  debugPaintLayerBordersEnabled = true;
//  debugPaintSizeEnabled = true;//开启绘制边界
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "使用Animation Controller",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => PageOne()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "使用AnimatedWidget包裹",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => PageTwo()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "使用AnimationStatusListener",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => PageThree()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "使用AnimatedBuilder",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => PageFour()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "使用并行动画",
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => PageFive()));
            },
          ),
        ],
      ),
    );
  }
}

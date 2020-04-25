import 'package:flutter/material.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

class FeatureBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feature B')),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('这里是B页面 \n 点击打开未知页面'),
                onPressed: () {
                  ConnectedNavigator.pushNamed(context, "hhh,随便写一个名字");
                },
              ),
              RaisedButton(
                child: Text('点击这个页面，向FeatureAPageA页面回传数据'),
                onPressed: () {
                  //这里展示了向上一个页面的传值，类似于Android的setResult
                  Navigator.pop<String>(context, "谢谢你的恢复，我是B页面");
                },
              ),
            ],
          )),
    );
  }
}

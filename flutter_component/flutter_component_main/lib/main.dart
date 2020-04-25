import 'package:flutter/material.dart';
import 'package:flutter_component_router/flutter_component_router.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      //配置routMap
      onGenerateRoute: routeFactory, //配置自定义的Route生成工具
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('启动页面'),
      onPressed: () {
        ConnectedNavigator.pushFeatureAPageA(context, "你好，Page A，我是HOME PAGE");
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

class FeatureAPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//receive args from route
    final String args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Feature A')),
      body: Builder(builder: (context) {
        return Center(
          child: RaisedButton(
            child: Text('Feature A页面，点击打开FeatureB页面 \n $args'),
            onPressed: () {
              //这里标注了打开一个页面，并且处理那个页面的返回值
              ConnectedNavigator.pushNamed(context, RouteName.FEATURE_B_PAGE_B)
                  .then((value) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('哈哈哈，我收到了B页面的回复，内容是：\n$value'),
                ));
              });
            },
          ),
        );
      }),
    );
  }
}

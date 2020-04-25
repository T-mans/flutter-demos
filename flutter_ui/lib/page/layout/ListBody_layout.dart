//demo to show usage of ListBody
//ListBody 必须用在有主轴的Widget内
//ListBody不支持滚动，如果超出parent的范围，会显示overflowed
import 'package:flutter/material.dart';

class ListBodyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          ListBody(
            mainAxis: Axis.vertical,
            children: <Widget>[
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,),
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,),
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,),
              Container(color: Colors.red, width: 50.0, height: 50.0,),
              Container(color: Colors.yellow, width: 50.0, height: 50.0,),
              Container(color: Colors.green, width: 50.0, height: 50.0,),
              Container(color: Colors.blue, width: 50.0, height: 50.0,),
              Container(color: Colors.black, width: 50.0, height: 50.0,),
            ],
          )],
      ),
    );
  }
}
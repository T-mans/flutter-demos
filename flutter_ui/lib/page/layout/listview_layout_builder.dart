import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///show usage of ListView

class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(itemBuilder: (context,index) {
        return Text("Text:$index");
      },
      itemCount: 100,),
    );
  }
}
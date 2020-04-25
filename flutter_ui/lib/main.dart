import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/page/layout/ListBody_layout.dart';
import 'package:flutter_ui/page/layout/gridview_layout_builder.dart';
import 'package:flutter_ui/page/layout/gridview_layout_count.dart';
import 'package:flutter_ui/page/layout/gridview_layout_custom.dart';
import 'package:flutter_ui/page/layout/gridview_layout_extent.dart';
import 'package:flutter_ui/page/layout/layout_flow.dart';
import 'package:flutter_ui/page/layout/layout_flow_animation.dart';
import 'package:flutter_ui/page/layout/listview_layout.dart';
import 'package:flutter_ui/page/layout/listview_layout_builder.dart';
import 'package:flutter_ui/page/layout/listview_layout_separated.dart';
import 'package:flutter_ui/page/layout/single_child_layout.dart';
import 'package:flutter_ui/page/layout/table_layout.dart';
import 'package:flutter_ui/page/page_one.dart';

void main(){
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeListItem(title: 'Page ONE', page: PageOne(),),
          HomeListItem(title: 'Layout SingleChild', page: SingleChildLayout(),),
          HomeListItem(title: 'Layout Flow Animation', page: LayoutFlowAnimation(),),
          HomeListItem(title: 'Flow Layout', page: FlowLayout(),),
          HomeListItem(title: 'GridView Layout Count', page: GridViewCount(),),
          HomeListItem(title: 'GridView Layout Builder', page: GridViewBuilder(),),
          HomeListItem(title: 'GridView Layout Custom', page: GridViewCustom(),),
          HomeListItem(title: 'GridView Layout Extent', page: GridViewExtent(),),
          HomeListItem(title: 'ListView Layout', page: ListViewDemo(),),
          HomeListItem(title: 'ListView Layout Builder', page: ListViewBuilder(),),
          HomeListItem(title: 'ListView Layout Separared', page: ListViewSeparated(),),
          HomeListItem(title: 'Table Layout', page: TableDemo(),),
          HomeListItem(title: 'ListBody Layout', page: ListBodyDemo(),),
        ],
      ),
    );
  }
}

class HomeListItem extends StatelessWidget {
  final String title;
  final Widget page;

  HomeListItem({@required this.title, @required this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.black, width: 1))),
          child: Center(
            child: Text(title),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (_) => page));
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///show usage of ListView
///convenient to add divider
///use refresh indicator to refresh ListView
///参照RefreshIndicator，我们可以自己实现自定义的下拉刷新
///同时实现了上拉加载更多

class ListViewSeparated extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewSeparatedState();
  }
}

class _ListViewSeparatedState extends State<ListViewSeparated> {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<String> list =["Hello","World","Hello","World","Hello","World","Hello","World","Hello","World","Hello","World","Hello","World","Hello","World","Hello","World","World","Hello","World","Hello","World","World","Hello","World","Hello","World","World","Hello","World","Hello","World","World","Hello","World","Hello","World","World","Hello","World","Hello","World",];
  List<String> newList =["水光潋滟晴方好","山色空蒙雨亦奇",];

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if (
      !this.isLoading &&
          this.scrollController.position.pixels >= this.scrollController.position.maxScrollExtent
      ) {
        // 开始加载数据
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    // 组件销毁时，释放资源（一定不能忘，否则可能会引起内存泄露）
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        this.list.addAll(newList);
      });
    });
  }

  Widget renderBottom() {
    if(this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (BuildContext context) {
        return SizedBox(
          height: 600,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.red,
            child: RefreshIndicator(
              onRefresh: () async {
                Future.delayed(Duration(seconds: 1)).then((value) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("刷新完毕"),
                  ));
                  setState(() {});
                });
              },
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                controller: scrollController,
                itemBuilder: (context, index) {
                  if (index < this.list.length) {
                    return Text(list[index]);
                  } else {
                    return this.renderBottom();
                  }
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 6,
                    color: Colors.yellowAccent,
                  );
                },
                itemCount: list.length + 1,
              ),
            ),
          ),
        );
      },
    ));
  }
}
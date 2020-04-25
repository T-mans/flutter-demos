import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_widgets/service_response.dart';

import 'm2_image.dart';

typedef void DiscoverBannerTapAction(DiscoverNewsItem item);

@immutable
class DiscoverBanner extends StatefulWidget {
  final List<DiscoverNewsItem> items;
  final DiscoverBannerTapAction onTap;

  DiscoverBanner({Key key, @required this.items, @required this.onTap})
      : super(key: key);

  @override
  _DiscoverBannerState createState() => _DiscoverBannerState();
}

//TODO: FIX number == 1
class _DiscoverBannerState extends State<DiscoverBanner> {
  DiscoverBannerTapAction get onTap => widget.onTap;

  List<DiscoverNewsItem> get items => widget.items;
  PageController pageController;
  Timer timer;
  int virtualIndex = 0;
  int realIndex = 1;
  static int AUTO_SCROLLER_PERIODIC = 5;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: realIndex);

    timer = Timer.periodic(Duration(seconds: AUTO_SCROLLER_PERIODIC), (_) {
      pageController.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });
    if (widget.items == 1) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratio = 8.47 / 22.58;
    return Container(
      height: MediaQuery.of(context).size.width * ratio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: pageController,
            onPageChanged: _onPageChanged,
            children: _buildItems(),
          ),
          //  _buildIndicator(),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: _numberIndicator(context, virtualIndex, this.items.length),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> items = [];
    if (this.items.isNotEmpty) {
      int lastItemIndex = this.items.length - 1;
      int firstItemIndex = 0;
      items.add(_buildItem(this.items[lastItemIndex]));
      items.addAll(
          this.items.map((item) => _buildItem(item)).toList(growable: false));
      items.add(_buildItem(this.items[firstItemIndex]));
    }
    return items;
  }

  Widget _buildItem(DiscoverNewsItem item) {
    return GestureDetector(
      onTap: () {
        if (this.onTap != null && item.serviceNewsUrl != null) {
          this.onTap(item);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          M2Image(
            key: Key(item.bannerImageUrl.toString()),
            imageUrl: item.bannerImageUrl,
          ),
//          Image.network(item.imageUrl, fit: BoxFit.fill, loadingBuilder: (context, child, progress){
//            if (progress == null) {
//              return child;
//            } else {
//              return Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                      fit: BoxFit.cover,
//                      image: AssetImage("images/promotion_news_default.png")),
//                ),
//                child: Center(
//                  child: M2LoadingIndicator(
//                    key: Key("discoverTab_banner_loadingIndicator_key"),
//                    size: 30.0,
//                    strokeWidth: 5.0,
//                  ),),
//              );
//            }
//          },
//          ),
          _buildTitle(item.serviceTitle),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment(0.0, -0.8),
        colors: [const Color(0xa000000), Colors.transparent],
      )),
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 26.0),
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                decoration: TextDecoration.none)),
      ),
    );
  }

  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (var i = 0; i < this.items.length; i++) {
      indicators.add(Container(
        width: 6.0,
        height: 6.0,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 1.5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == virtualIndex ? Colors.white : Colors.grey),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  Widget _numberIndicator(BuildContext context, int index, int itemCount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(top: 10.0, right: 5.0),
      padding: EdgeInsets.all(5.0),
      child: Text(
        '${++index / itemCount}',
        style: TextStyle(
            color: Colors.white70, fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = this.items.length;
    if (index == 0) {
      virtualIndex = count - 1;
      pageController.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      pageController.jumpToPage(1);
    }
    setState(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    timer.cancel();
  }
}

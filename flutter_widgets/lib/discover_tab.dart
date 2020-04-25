import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/service_json.dart';
import 'package:flutter_widgets/service_response.dart';

import 'discover_banner.dart';
import 'm2_image.dart';

ServiceResponse serviceResponse =
    ServiceResponse.fromJson(jsonDecode(serviceJson)); //这里使用了dynamic,可能有问题
List<DiscoverNewsItem> newsItems = [];
List<DiscoverServiceGroup> groups = [];

class DiscoverTab extends StatefulWidget {
  @override
  _DiscoverTabState createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    newsItems = serviceResponse.news;
    groups = serviceResponse.services.serviceConfigurations[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("discoverTab_scaffold_key"),
      appBar: AppBar(
        key: Key("discoverTab_appBar_m2AppBar"),
        title: Text("discover"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (newsItems.isEmpty || groups.isEmpty) {
      return Container();
    }
    int newsSectionCount = 1;
    int sectionsCount = groups.length + newsSectionCount;
    return ListView.separated(
      itemCount: sectionsCount,
      separatorBuilder: (context, index) => Divider(),
      primary: false,
      itemBuilder: (context, section) {
        if (0 == section) {
          return _buildBanner(context, newsItems);
        }
        if (section > 0 && section <= sectionsCount - 1) {
          return _buildGroup(context, groups[section - 1]);
        }
        if (section == sectionsCount) {
          return Container(); //add local third party services
        }
        return Container();
      },
      key: Key("discoverTab_listView"),
      scrollDirection: Axis.vertical,
    );
  }

  Widget _buildBanner(BuildContext context, List<DiscoverNewsItem> newsItems) {
    return DiscoverBanner(
      key: Key("discoverTab_banner_key"),
      items: newsItems,
      onTap: (item) {
//        Navigator.of(context).push(DiscoverRoute.fullscreenWebView(
//            title: item.title, url: item.actionUrl));
      },
    );
  }

  Widget _buildGroup(BuildContext context, DiscoverServiceGroup group) {
    //GridView和ListView同时使用时会有冲突,需要禁止其中某个的滚动。
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                child: Text(
                  group.groupName,
                  textAlign: TextAlign.start,
                ),
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0)),
          ),
          GridView.builder(
              itemCount: group.services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              //禁止滚动
              shrinkWrap: true,
              cacheExtent: 20.0,
              itemBuilder: (context, index) {
                return _buildServiceItem(context, group.services[index]);
              }),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, ServiceItem item) {
    double sizeRatio = 132 / 108;
    double width = MediaQuery.of(context).size.width / 3;
    return GestureDetector(
      child: SizedBox(
        width: width,
        height: width * sizeRatio,
        child: Card(
          color: Colors.black87,
          elevation: 2.0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 9.0),
                  child: SizedBox(
                    width: 52.0,
                    height: 52.0,
                    child: M2Image(
                      imageUrl: item.image,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
//        performSegue(item, context);
      },
    );
  }

//  void performSegue(DiscoverServiceItem item, BuildContext context) {
//    CoopersBloc coopersBloc = CoopersBloc(
//        coopersRepository:
//            RepositoryProvider.of<ConnectedCoopersRepository>(context));
//    Navigator.of(context)
//        .push(DiscoverRoute.coopersRoute(coopersBloc: coopersBloc));
//    coopersBloc.close();
//
//  }
}

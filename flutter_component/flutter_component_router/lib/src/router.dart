import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component_feature_a/page/feature_a_page.dart';
import 'package:flutter_component_feature_b/flutter_component_feature_b.dart';
import 'package:flutter_component_router/page/unknown_page.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

///store routes which has needs for arguments
final Map<String, WidgetBuilder> _routesNeedParameters = {
  RouteName.FEATURE_A_PAGE_A: (BuildContext context) => FeatureAPage(),
};

///store routes which has no needs for arguments
final Map<String, WidgetBuilder> _routesNotNeedParameters = {
  RouteName.FEATURE_B_PAGE_B: (BuildContext context) => FeatureBPage(),
};

///route factory to decide what type of route for specific page
Route routeFactory(RouteSettings settings) {
  Route route;
  //注意这里有一个坑，因为在具体的page里面，执行ConnectedNavigator的相关静态方法是可以标注泛型的，这个泛型也决定了需要使用的Route的泛型
  //但是如果强制指定泛型，只是约束页面的返回值，而且需要对特定的页面routeName全部做校验，所以我认为就用默认的dynamic，不要使用泛型
  //后续考虑去除ConnectedNavigator类方法的泛型。
  if (_routesNotNeedParameters.containsKey(
      settings.name)) { //不需要参数的路由，并且已经配置了对应的路由名字
    route = CupertinoPageRoute(
        builder: _routesNotNeedParameters[settings.name], settings: settings);
  } else
  if (_routesNeedParameters.containsKey(settings.name)) { //需要参数的路由，并且配置了对应的名字
    route = CupertinoPageRoute(
        builder: _routesNeedParameters[settings.name], settings: settings);
  } else { //没有配置的路由
    route = CupertinoPageRoute(
        builder: (context) => UnKnownPage(), settings: settings);
  }
  return route;
}

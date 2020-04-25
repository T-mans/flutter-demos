
import 'package:flutter/widgets.dart';

abstract class RouteName {
  static const String FEATURE_A_PAGE_A = "featurea/pagea";
  static const String FEATURE_B_PAGE_B = "featureb/pageb";
}

class ConnectedNavigator {
  ///@param routeName defined in [RouteName]
  static Future<T> pushNamed<T extends Object>(BuildContext context,
      String routeName) {
    return Navigator.of(context).pushNamed(routeName);
  }

  static Future<T> pushFeatureAPageA<T extends Object>(BuildContext context,
      String arguments) {
    return Navigator.of(context)
        .pushNamed(RouteName.FEATURE_A_PAGE_A, arguments: arguments);
  }
}

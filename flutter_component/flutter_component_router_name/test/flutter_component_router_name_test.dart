import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_component_router_name/flutter_component_router_name.dart';

void main() {
  group("RouteName", () {
    test("contain feature a page a and is not empty", () {
      RouteName.FEATURE_A_PAGE_A.isNotEmpty;
    });
  });
}

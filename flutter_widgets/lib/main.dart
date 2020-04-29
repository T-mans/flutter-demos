import 'package:flutter/material.dart';
import 'package:flutter_widgets/shopping_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColorBrightness: Brightness.light,
        brightness: Brightness.light,
        fontFamily: 'packages/connected_ui/bmw',
      ),
      home: Material(
        child: ShoppingListItem(
          product: Product(name: '卫龙辣条'),
          inCart: true,
          onCartChanged: (product, inCart) {
            print('Product:$product inCart:$inCart');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_timer/main.dart';

main() {
  testWidgets("test MyApp", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text("01:00"), findsOneWidget);

    await tester.tap(find.byIcon(Icons.play_arrow));

    await tester.pump(Duration(seconds: 1));

    expect(find.text("01:00"), findsNothing);
  });
}

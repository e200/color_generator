import 'package:color_generator/screens/home/widgets/color_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test ColorSlider', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ColorSlider(
          colorName: 'Red',
          color: Colors.red,
          value: 255,
          activeColor: Colors.blue,
          onChanged: (value) {},
        ),
      ),
    ));

    final titleFinder = find.text('R');
    expect(titleFinder, findsOneWidget);

    final _colorSlider = find.byType(CupertinoSlider);
    expect(_colorSlider, findsOneWidget);
  });
}

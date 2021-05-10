import 'dart:math';
import 'dart:ui';

import 'package:test/test.dart';

import '../lib/services/coolor.dart';

void main() {
  test('Test if random is generating random colors', () {
    final _coolor = Coolor(random: Random());

    final _color = _coolor.randomColor();

    expect(_color.red, isA<int>());
    expect(_color.green, isA<int>());
    expect(_color.blue, isA<int>());
  });

  test('test from RGB', () {
    final _coolor = Coolor();

    final _color = _coolor.fromRGB(255, 0, 125);

    expect(_color.red, 255);
    expect(_color.green, 0);
    expect(_color.blue, 125);
  });

  test('test complementary', () {
    final _coolor = Coolor();

    final _colorBlack = _coolor.complementary(Color(0x00000000));
    expect(_colorBlack, Color(0xFFFFFFFF));

    final _colorWhite = _coolor.complementary(Color(0x00FFFFFF));
    expect(_colorWhite, Color(0xFF000000));
  });

  test('test HSL', () {
    final _coolor = Coolor();

    final _colorBlack = _coolor.fromHSL(1, 0, 0, 0);
    expect(_colorBlack, Color(0xFF000000));

    final _colorWhite = _coolor.fromHSL(1, 1, 1, 1);
    expect(_colorWhite, Color(0xFFFFFFFF));
  });
}

import 'dart:ui';

import 'package:flutter/widgets.dart';

class Coolor implements ICoolor {
  @override
  Color complementary(Color color) {
    return Color.fromRGBO(
      255 - color.red,
      255 - color.green,
      255 - color.blue,
      1 - color.opacity,
    );
  }

  @override
  Color fromHSL(double alpha, double hue, double saturation, double lightness) {
    final _hslColor = HSLColor.fromAHSL(alpha, hue, saturation, lightness);

    return _hslColor.toColor();
  }

  @override
  Color fromHexadecimal(String hexadecimal) {
    String _hexadecimal = hexadecimal;

    if (_hexadecimal.startsWith('#')) {
      _hexadecimal = _hexadecimal.replaceAll('#', '');
    }

    final _intColor = int.parse('0xFF$_hexadecimal');

    final _color = Color(_intColor);

    return _color;
  }

  @override
  Color fromRGB(int red, int green, int blue) {
    throw UnimplementedError();
  }
}

abstract class ICoolor {
  Color complementary(Color color);
  Color fromHSL(double alpha, double hue, double saturation, double lightness);
  Color fromRGB(int red, int green, int blue);
  Color fromHexadecimal(String hexadecimal);
}

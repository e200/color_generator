import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coolorProvider = Provider((ref) => Coolor(random: Random()));

class Coolor implements ICoolor {
  final Random? random;

  Coolor({this.random});

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
    return Color.fromARGB(1, red, green, blue);
  }

  @override
  Color randomColor() {
    final _red = random!.nextInt(255);
    final _green = random!.nextInt(255);
    final _blue = random!.nextInt(255);

    return fromRGB(_red, _green, _blue);
  }
}

abstract class ICoolor {
  Color complementary(Color color);
  Color fromHSL(double alpha, double hue, double saturation, double lightness);
  Color fromRGB(int red, int green, int blue);
  Color fromHexadecimal(String hexadecimal);
  Color randomColor();
}

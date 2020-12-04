import 'package:color_generator/screens/home/widgets/color_text_field.dart';
import 'package:flutter/material.dart';

class Hexa extends StatelessWidget {
  final Color color;
  final Function(String hexadecimal) onChanged;

  const Hexa({
    Key key,
    this.color,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _hexa = getHexadecimalFromColor(color);

    return ColorTextField(
      color: color,
      fontSize: 32,
      value: _hexa,
      onChanged: onChanged,
    );
  }

  String getHexadecimalFromColor(Color color) {
    final _colorString = color.toString().substring(10, 16).toUpperCase();
    final _hexaColorString = '#' + _colorString;

    return _hexaColorString;
  }
}

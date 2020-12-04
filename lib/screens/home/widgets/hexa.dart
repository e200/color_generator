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

    return TextFormField(
      textAlign: TextAlign.center,
      initialValue: _hexa,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: idealColor,
      ),
      onChanged: onChanged,
    );
  }

  Color get idealColor =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;

  String getHexadecimalFromColor(Color color) {
    final _colorString = color.toString().substring(10, 16).toUpperCase();
    final _hexaColorString = '#' + _colorString;

    return _hexaColorString;
  }
}

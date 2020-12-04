import 'package:flutter/material.dart';

class ColorTextField extends StatelessWidget {
  final Color color;
  final String value;
  final double fontSize;
  final Function(String value) onChanged;

  const ColorTextField({
    Key key,
    this.color,
    this.value,
    this.fontSize,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      key: UniqueKey(),
      initialValue: value,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: idealColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
      onChanged: onChanged,
    );
  }

  Color get idealColor =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;
}

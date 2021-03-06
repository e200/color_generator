import 'package:flutter/material.dart';

class ColorTextField extends StatefulWidget {
  final Color color;
  final String value;
  final double? fontSize;
  final Function(String value)? onChanged;

  const ColorTextField({
    Key? key,
    required this.color,
    required this.value,
    this.fontSize,
    this.onChanged,
  }) : super(key: key);

  @override
  _ColorTextFieldState createState() => _ColorTextFieldState();
}

class _ColorTextFieldState extends State<ColorTextField> {
  final _textFieldFocusNode = FocusNode();

  Key _textFieldKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    _textFieldKey = _textFieldFocusNode.hasFocus ? _textFieldKey : UniqueKey();

    return TextFormField(
      key: _textFieldKey,
      textAlign: TextAlign.center,
      focusNode: _textFieldFocusNode,
      initialValue: widget.value,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: idealColor,
        fontWeight: FontWeight.bold,
        fontSize: widget.fontSize,
      ),
      onChanged: widget.onChanged,
    );
  }

  Color get idealColor =>
      widget.color.computeLuminance() > .5 ? Colors.black : Colors.white;
}

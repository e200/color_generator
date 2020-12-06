import 'dart:io';

import 'package:color_generator/widgets/color_picker.dart';
import 'package:flutter/material.dart';

class ImageColorPickerScreen extends StatefulWidget {
  final File image;

  const ImageColorPickerScreen({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  _ImageColorPickerScreenState createState() => _ImageColorPickerScreenState();
}

class _ImageColorPickerScreenState extends State<ImageColorPickerScreen> {
  Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.copy,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context, selectedColor);
        },
      ),
      body: ColorPicker(
        image: widget.image,
        onSelectColor: (color) {
          selectedColor = color;
        },
      ),
    );
  }
}

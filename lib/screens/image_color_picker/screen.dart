import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';

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
        backgroundColor: selectedColor ?? Colors.white,
        child: Icon(
          Icons.palette_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context, selectedColor);
        },
      ),
      body: PixelColorPicker(
        child: Image.file(
          widget.image,
          filterQuality: FilterQuality.low,
        ),
        onChanged: (color) {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  }
}

import 'package:color_generator/screens/home/widgets/color_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  final String colorName;
  final Color color;
  final int value;
  final Color activeColor;
  final Function(int value) onChanged;

  const ColorSlider({
    Key key,
    this.color,
    this.colorName,
    this.value,
    this.activeColor,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(.1),
          ),
          child: Text(
            colorName[0],
            style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ColorTextField(
          color: color,
          value: value.toString(),
          onChanged: (value) => onChanged(int.parse(value)),
        ),
        SizedBox(height: 15),
        RotatedBox(
          quarterTurns: 3,
          child: CupertinoSlider(
            min: 0,
            max: 255,
            thumbColor: activeColor,
            activeColor: activeColor.withOpacity(.5),
            value: value.toDouble(),
            onChanged: (value) => onChanged(value.toInt()),
          ),
        ),
      ],
    );
  }

  Color contrastColor(Color color) =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;
}

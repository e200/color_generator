import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_generator/cubit/color_cubit.dart';

class ColorSlider extends StatelessWidget {
  final String colorName;
  final int value;
  final Color activeColor;
  final Function(int value) onChange;
  final Function() onTapLabel;
  final Function(int value) onInputValue;
  final Function() onLongPressLabel;

  const ColorSlider({
    Key key,
    this.colorName,
    this.value,
    this.activeColor,
    this.onChange,
    this.onTapLabel,
    this.onInputValue,
    this.onLongPressLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          colorName[0],
          style: TextStyle(
            color: Colors.grey.withOpacity(.6),
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          highlightColor: contrastColor(_color).withOpacity(.1),
          splashColor: activeColor.withOpacity(.2),
          child: Text(
            value.toString(),
            style: TextStyle(
              color: contrastColor(_color),
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onTapLabel,
          onLongPress: onLongPressLabel,
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
            onChanged: (value) => onChange(value.toInt()),
          ),
        ),
      ],
    );
  }

  Color contrastColor(Color color) =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;
}

import 'package:color_generator/screens/home/widgets/color_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:color_generator/cubit/color_cubit.dart';

class ColorSliders extends StatelessWidget {
  final Color color;

  const ColorSliders({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColorSlider(
            colorName: 'Red',
            activeColor: Colors.red,
            value: color.red,
            onChange: (value) {
              context.read<ColorCubit>().updateRed(value);
            },
          ),
        ),
        Expanded(
          child: ColorSlider(
            colorName: 'Green',
            activeColor: Colors.green,
            value: color.green,
            onChange: (value) {
              context.read<ColorCubit>().updateGreen(value);
            },
          ),
        ),
        Expanded(
          child: ColorSlider(
            colorName: 'Blue',
            activeColor: Colors.blue,
            value: color.blue,
            onChange: (value) {
              context.read<ColorCubit>().updateBlue(value);
            },
          ),
        ),
      ],
    );
  }
}

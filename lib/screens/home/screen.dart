import 'package:color_generator/cubit/color_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ColorCubit, ColorState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(color: state.color),
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hexa(color: state.color),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              Expanded(
                                child: ColorSlider(
                                  activeColor: Colors.red,
                                  value: state.color.red,
                                  onChange: (value) {
                                    context.read<ColorCubit>().updateRed(value);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ColorSlider(
                                  activeColor: Colors.green,
                                  value: state.color.green,
                                  onChange: (value) {
                                    context
                                        .read<ColorCubit>()
                                        .updateGreen(value);
                                  },
                                ),
                              ),
                              Expanded(
                                child: ColorSlider(
                                  activeColor: Colors.blue,
                                  value: state.color.blue,
                                  onChange: (value) {
                                    context
                                        .read<ColorCubit>()
                                        .updateBlue(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Hexa extends StatelessWidget {
  final Color color;

  const Hexa({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '#' + color.toString().substring(10, 16).toUpperCase(),
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color.computeLuminance() > .5 ? Colors.black : Colors.white,
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final int value;
  final Color activeColor;
  final Function(int value) onChange;
  final Function(int value) onInputValue;

  const ColorSlider({
    Key key,
    this.value,
    this.activeColor,
    this.onChange,
    this.onInputValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: Text(
            value.toString(),
            style: TextStyle(
              color:
                  _color.computeLuminance() > .5 ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 30),
        RotatedBox(
          quarterTurns: 3,
          child: CupertinoSlider(
            min: 0,
            max: 255,
            activeColor: activeColor.withOpacity(.5),
            value: value.toDouble(),
            onChanged: (value) => onChange(value.toInt()),
          ),
        ),
      ],
    );
  }
}

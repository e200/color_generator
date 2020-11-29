import 'package:color_generator/cubit/color_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BlocBuilder<ColorCubit, ColorState>(
            builder: (context, state) {
              return Container(
                color: state.color,
              );
            },
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<ColorCubit, ColorState>(
                      builder: (context, state) {
                        return Hexa(color: state.color);
                      },
                    ),
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final _value = context.select<ColorCubit, int>(
                                (value) => value.state.color.red,
                              );

                              return ColorSlider(
                                activeColor: Colors.red,
                                value: _value,
                                onChange: (value) {
                                  context.read<ColorCubit>().updateRed(value);
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final _value = context.select<ColorCubit, int>(
                                (value) => value.state.color.green,
                              );

                              return ColorSlider(
                                activeColor: Colors.green,
                                value: _value,
                                onChange: (value) {
                                  context.read<ColorCubit>().updateGreen(value);
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final _value = context.select<ColorCubit, int>(
                                (value) => value.state.color.blue,
                              );

                              return ColorSlider(
                                activeColor: Colors.blue,
                                value: _value,
                                onChange: (value) {
                                  context.read<ColorCubit>().updateBlue(value);
                                },
                              );
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
        ],
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

  const ColorSlider({
    Key key,
    this.value,
    this.activeColor,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
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

import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/home/widgets/color_sliders.dart';
import 'package:color_generator/screens/home/widgets/hexa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: _color.withOpacity(1)),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hexa(
                        color: _color,
                        onChanged: (String hexadecimal) {
                          context
                              .read<ColorCubit>()
                              .updateHexadecimal(hexadecimal);
                        },
                      ),
                      SizedBox(height: 60),
                      ColorSliders(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

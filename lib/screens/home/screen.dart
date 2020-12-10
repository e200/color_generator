import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/home/widgets/color_preview.dart';
import 'package:color_generator/screens/home/widgets/color_sliders.dart';
import 'package:color_generator/screens/home/widgets/hexadecimal_color_text_field.dart';
import 'package:color_generator/screens/home/widgets/top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorPreview(),
          SafeArea(
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<ColorCubit, ColorState>(
                            builder: (context, state) {
                              return HexadecimalColorTextField(
                                color: state.color,
                                onChanged: (String hexadecimal) {
                                  context
                                      .read<ColorCubit>()
                                      .updateHexadecimal(hexadecimal);
                                },
                              );
                            },
                          ),
                          SizedBox(height: 60),
                          ColorSliders(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

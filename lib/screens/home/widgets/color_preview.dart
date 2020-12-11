import 'package:color_generator/cubit/color_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      color: _color.withOpacity(1),
    );
  }
}

import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/coolor.dart';
import 'color_state.dart';

final colorNotifier =
    StateNotifierProvider.autoDispose<ColorNotifier, ColorState>((ref) {
  return ColorNotifier(coolor: ref.watch(coolorProvider));
});

class ColorNotifier extends StateNotifier<ColorState> {
  final Coolor coolor;

  ColorNotifier({required this.coolor}) : super(ColorState.initial());

  updateRed(int red) {
    final _color = state.color.withRed(red);

    updateColor(_color);
  }

  updateGreen(int green) {
    final _color = state.color.withGreen(green);

    updateColor(_color);
  }

  updateBlue(int blue) {
    final _color = state.color.withBlue(blue);

    updateColor(_color);
  }

  updateHexadecimal(String hexadecimal) {
    final _color = coolor.fromHexadecimal(hexadecimal);

    updateColor(_color);
  }

  updateWithRandomColor() {
    final _color = coolor.randomColor();

    updateColor(_color);
  }

  updateColor(Color color) {
    state = ColorState.color(color);
  }
}

import 'package:bloc/bloc.dart';
import 'package:color_generator/services/coolor.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.dart';
part 'color_cubit.freezed.dart';

class ColorCubit extends Cubit<ColorState> {
  final ICoolor coolor;

  ColorCubit({required this.coolor}) : super(ColorState.initial());

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
    final _color = coolor.random();

    updateColor(_color);
  }

  updateColor(Color color) {
    emit(ColorState.color(color));
  }
}

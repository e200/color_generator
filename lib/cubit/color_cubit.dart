import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinycolor/tinycolor.dart';

part 'color_state.dart';
part 'color_cubit.freezed.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  updateRed(int red) {
    final _color = TinyColor.fromRGB(
      r: red,
      g: state.color.green,
      b: state.color.blue,
    ).color;

    print(red);

    emit(ColorState.color(_color));
  }

  updateGreen(int green) {
    final _color = TinyColor.fromRGB(
      r: state.color.red,
      g: green,
      b: state.color.blue,
    ).color;

    emit(ColorState.color(_color));
  }

  updateBlue(int blue) {
    final _color = TinyColor.fromRGB(
      r: state.color.red,
      g: state.color.green,
      b: blue,
    ).color;

    emit(ColorState.color(_color));
  }

  fromHexa(String hex) {
    final _color = TinyColor.fromString(hex).color;

    emit(ColorState.color(_color));
  }
}

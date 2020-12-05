import 'package:bloc/bloc.dart';
import 'package:color_generator/services/coolor.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.dart';
part 'color_cubit.freezed.dart';

class ColorCubit extends Cubit<ColorState> {
  final ICoolor coolor;

  ColorCubit({this.coolor}) : super(ColorState.initial());

  updateRed(int red) {
    final _newColor = state.color.withRed(red);

    _updateColor(_newColor);
  }

  updateGreen(int green) {
    final _newColor = state.color.withGreen(green);

    _updateColor(_newColor);
  }

  updateBlue(int blue) {
    final _newColor = state.color.withBlue(blue);

    _updateColor(_newColor);
  }

  updateHexadecimal(String hexadecimal) {
    final _color = coolor.fromHexadecimal(hexadecimal);

    _updateColor(_color);
  }

  _updateColor(Color color) {
    emit(ColorState.color(color));
  }
}

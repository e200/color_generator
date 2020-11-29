import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.dart';
part 'color_cubit.freezed.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState.initial());

  updateRed(int red) {
    final _previousColor = state.color;

    final _newColor = _getColor(
      red,
      _previousColor.green,
      _previousColor.blue,
    );

    _updateColor(_newColor);
  }

  updateGreen(int green) {
    final _previousColor = state.color;

    final _newColor = _getColor(
      _previousColor.red,
      green,
      _previousColor.blue,
    );

    _updateColor(_newColor);
  }

  updateBlue(int blue) {
    final _previousColor = state.color;

    final _newColor = _getColor(
      _previousColor.red,
      _previousColor.green,
      blue,
    );

    _updateColor(_newColor);
  }

  /* fromHexa(String hex) {
    final _color = fromString(hex).color;

    emit(ColorState.color(_color));
  } */

  _updateColor(Color color) {
    emit(ColorState.color(color));
  }

  Color _getColor(int red, int green, int blue) {
    return Color.fromRGBO(red, green, blue, 1);
  }
}

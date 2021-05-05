import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.freezed.dart';

@freezed
abstract class ColorState with _$ColorState {
  const factory ColorState.initial([@Default(Color(0xFFFFFFFF)) Color color]) =
      _Initial;
  const factory ColorState.color(Color color) = _Changed;
}

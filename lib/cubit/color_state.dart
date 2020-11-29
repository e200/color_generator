part of 'color_cubit.dart';

@freezed
abstract class ColorState with _$ColorState {
  const factory ColorState.initial([@Default(Color(0x00FFFFFF)) Color color]) =
      _Initial;
  const factory ColorState.color(Color color) = _Changed;
}

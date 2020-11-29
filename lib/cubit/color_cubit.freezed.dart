// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'color_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ColorStateTearOff {
  const _$ColorStateTearOff();

// ignore: unused_element
  _Initial initial([Color color = const Color(0x00FFFFFF)]) {
    return _Initial(
      color,
    );
  }

// ignore: unused_element
  _Changed color(Color color) {
    return _Changed(
      color,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ColorState = _$ColorStateTearOff();

/// @nodoc
mixin _$ColorState {
  Color get color;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(Color color),
    @required TResult color(Color color),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(Color color),
    TResult color(Color color),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult color(_Changed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult color(_Changed value),
    @required TResult orElse(),
  });

  $ColorStateCopyWith<ColorState> get copyWith;
}

/// @nodoc
abstract class $ColorStateCopyWith<$Res> {
  factory $ColorStateCopyWith(
          ColorState value, $Res Function(ColorState) then) =
      _$ColorStateCopyWithImpl<$Res>;
  $Res call({Color color});
}

/// @nodoc
class _$ColorStateCopyWithImpl<$Res> implements $ColorStateCopyWith<$Res> {
  _$ColorStateCopyWithImpl(this._value, this._then);

  final ColorState _value;
  // ignore: unused_field
  final $Res Function(ColorState) _then;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_value.copyWith(
      color: color == freezed ? _value.color : color as Color,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$ColorStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_Initial(
      color == freezed ? _value.color : color as Color,
    ));
  }
}

/// @nodoc
class _$_Initial implements _Initial {
  const _$_Initial([this.color = const Color(0x00FFFFFF)])
      : assert(color != null);

  @JsonKey(defaultValue: const Color(0x00FFFFFF))
  @override
  final Color color;

  @override
  String toString() {
    return 'ColorState.initial(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(Color color),
    @required TResult color(Color color),
  }) {
    assert(initial != null);
    assert(color != null);
    return initial(this.color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(Color color),
    TResult color(Color color),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this.color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult color(_Changed value),
  }) {
    assert(initial != null);
    assert(color != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult color(_Changed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ColorState {
  const factory _Initial([Color color]) = _$_Initial;

  @override
  Color get color;
  @override
  _$InitialCopyWith<_Initial> get copyWith;
}

/// @nodoc
abstract class _$ChangedCopyWith<$Res> implements $ColorStateCopyWith<$Res> {
  factory _$ChangedCopyWith(_Changed value, $Res Function(_Changed) then) =
      __$ChangedCopyWithImpl<$Res>;
  @override
  $Res call({Color color});
}

/// @nodoc
class __$ChangedCopyWithImpl<$Res> extends _$ColorStateCopyWithImpl<$Res>
    implements _$ChangedCopyWith<$Res> {
  __$ChangedCopyWithImpl(_Changed _value, $Res Function(_Changed) _then)
      : super(_value, (v) => _then(v as _Changed));

  @override
  _Changed get _value => super._value as _Changed;

  @override
  $Res call({
    Object color = freezed,
  }) {
    return _then(_Changed(
      color == freezed ? _value.color : color as Color,
    ));
  }
}

/// @nodoc
class _$_Changed implements _Changed {
  const _$_Changed(this.color) : assert(color != null);

  @override
  final Color color;

  @override
  String toString() {
    return 'ColorState.color(color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Changed &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(color);

  @override
  _$ChangedCopyWith<_Changed> get copyWith =>
      __$ChangedCopyWithImpl<_Changed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(Color color),
    @required TResult color(Color color),
  }) {
    assert(initial != null);
    assert(color != null);
    return color(this.color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(Color color),
    TResult color(Color color),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (color != null) {
      return color(this.color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(_Initial value),
    @required TResult color(_Changed value),
  }) {
    assert(initial != null);
    assert(color != null);
    return color(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(_Initial value),
    TResult color(_Changed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (color != null) {
      return color(this);
    }
    return orElse();
  }
}

abstract class _Changed implements ColorState {
  const factory _Changed(Color color) = _$_Changed;

  @override
  Color get color;
  @override
  _$ChangedCopyWith<_Changed> get copyWith;
}

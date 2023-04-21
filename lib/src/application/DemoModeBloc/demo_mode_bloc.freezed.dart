// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_mode_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DemoModeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) valueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? valueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? valueChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueChanged value) valueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ValueChanged value)? valueChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueChanged value)? valueChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoModeEventCopyWith<$Res> {
  factory $DemoModeEventCopyWith(
          DemoModeEvent value, $Res Function(DemoModeEvent) then) =
      _$DemoModeEventCopyWithImpl<$Res, DemoModeEvent>;
}

/// @nodoc
class _$DemoModeEventCopyWithImpl<$Res, $Val extends DemoModeEvent>
    implements $DemoModeEventCopyWith<$Res> {
  _$DemoModeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$DemoModeEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'DemoModeEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) valueChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? valueChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? valueChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueChanged value) valueChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ValueChanged value)? valueChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueChanged value)? valueChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DemoModeEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_ValueChangedCopyWith<$Res> {
  factory _$$_ValueChangedCopyWith(
          _$_ValueChanged value, $Res Function(_$_ValueChanged) then) =
      __$$_ValueChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$_ValueChangedCopyWithImpl<$Res>
    extends _$DemoModeEventCopyWithImpl<$Res, _$_ValueChanged>
    implements _$$_ValueChangedCopyWith<$Res> {
  __$$_ValueChangedCopyWithImpl(
      _$_ValueChanged _value, $Res Function(_$_ValueChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$_ValueChanged(
      null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ValueChanged implements _ValueChanged {
  const _$_ValueChanged(this.newValue);

  @override
  final bool newValue;

  @override
  String toString() {
    return 'DemoModeEvent.valueChanged(newValue: $newValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueChanged &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValueChangedCopyWith<_$_ValueChanged> get copyWith =>
      __$$_ValueChangedCopyWithImpl<_$_ValueChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool newValue) valueChanged,
  }) {
    return valueChanged(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool newValue)? valueChanged,
  }) {
    return valueChanged?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool newValue)? valueChanged,
    required TResult orElse(),
  }) {
    if (valueChanged != null) {
      return valueChanged(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ValueChanged value) valueChanged,
  }) {
    return valueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_ValueChanged value)? valueChanged,
  }) {
    return valueChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ValueChanged value)? valueChanged,
    required TResult orElse(),
  }) {
    if (valueChanged != null) {
      return valueChanged(this);
    }
    return orElse();
  }
}

abstract class _ValueChanged implements DemoModeEvent {
  const factory _ValueChanged(final bool newValue) = _$_ValueChanged;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$_ValueChangedCopyWith<_$_ValueChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DemoModeState {
  bool get isDemo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DemoModeStateCopyWith<DemoModeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DemoModeStateCopyWith<$Res> {
  factory $DemoModeStateCopyWith(
          DemoModeState value, $Res Function(DemoModeState) then) =
      _$DemoModeStateCopyWithImpl<$Res, DemoModeState>;
  @useResult
  $Res call({bool isDemo});
}

/// @nodoc
class _$DemoModeStateCopyWithImpl<$Res, $Val extends DemoModeState>
    implements $DemoModeStateCopyWith<$Res> {
  _$DemoModeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDemo = null,
  }) {
    return _then(_value.copyWith(
      isDemo: null == isDemo
          ? _value.isDemo
          : isDemo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DemoModeStateCopyWith<$Res>
    implements $DemoModeStateCopyWith<$Res> {
  factory _$$_DemoModeStateCopyWith(
          _$_DemoModeState value, $Res Function(_$_DemoModeState) then) =
      __$$_DemoModeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDemo});
}

/// @nodoc
class __$$_DemoModeStateCopyWithImpl<$Res>
    extends _$DemoModeStateCopyWithImpl<$Res, _$_DemoModeState>
    implements _$$_DemoModeStateCopyWith<$Res> {
  __$$_DemoModeStateCopyWithImpl(
      _$_DemoModeState _value, $Res Function(_$_DemoModeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDemo = null,
  }) {
    return _then(_$_DemoModeState(
      isDemo: null == isDemo
          ? _value.isDemo
          : isDemo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DemoModeState implements _DemoModeState {
  const _$_DemoModeState({required this.isDemo});

  @override
  final bool isDemo;

  @override
  String toString() {
    return 'DemoModeState(isDemo: $isDemo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DemoModeState &&
            (identical(other.isDemo, isDemo) || other.isDemo == isDemo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDemo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DemoModeStateCopyWith<_$_DemoModeState> get copyWith =>
      __$$_DemoModeStateCopyWithImpl<_$_DemoModeState>(this, _$identity);
}

abstract class _DemoModeState implements DemoModeState {
  const factory _DemoModeState({required final bool isDemo}) = _$_DemoModeState;

  @override
  bool get isDemo;
  @override
  @JsonKey(ignore: true)
  _$$_DemoModeStateCopyWith<_$_DemoModeState> get copyWith =>
      throw _privateConstructorUsedError;
}

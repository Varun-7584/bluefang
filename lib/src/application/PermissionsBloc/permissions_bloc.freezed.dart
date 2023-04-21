// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PermissionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? permissionsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionsRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PermissionsRequested value) permissionsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PermissionsRequested value)? permissionsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PermissionsRequested value)? permissionsRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsEventCopyWith<$Res> {
  factory $PermissionsEventCopyWith(
          PermissionsEvent value, $Res Function(PermissionsEvent) then) =
      _$PermissionsEventCopyWithImpl<$Res, PermissionsEvent>;
}

/// @nodoc
class _$PermissionsEventCopyWithImpl<$Res, $Val extends PermissionsEvent>
    implements $PermissionsEventCopyWith<$Res> {
  _$PermissionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PermissionsRequestedCopyWith<$Res> {
  factory _$$_PermissionsRequestedCopyWith(_$_PermissionsRequested value,
          $Res Function(_$_PermissionsRequested) then) =
      __$$_PermissionsRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PermissionsRequestedCopyWithImpl<$Res>
    extends _$PermissionsEventCopyWithImpl<$Res, _$_PermissionsRequested>
    implements _$$_PermissionsRequestedCopyWith<$Res> {
  __$$_PermissionsRequestedCopyWithImpl(_$_PermissionsRequested _value,
      $Res Function(_$_PermissionsRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PermissionsRequested implements _PermissionsRequested {
  const _$_PermissionsRequested();

  @override
  String toString() {
    return 'PermissionsEvent.permissionsRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PermissionsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() permissionsRequested,
  }) {
    return permissionsRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? permissionsRequested,
  }) {
    return permissionsRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? permissionsRequested,
    required TResult orElse(),
  }) {
    if (permissionsRequested != null) {
      return permissionsRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PermissionsRequested value) permissionsRequested,
  }) {
    return permissionsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PermissionsRequested value)? permissionsRequested,
  }) {
    return permissionsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PermissionsRequested value)? permissionsRequested,
    required TResult orElse(),
  }) {
    if (permissionsRequested != null) {
      return permissionsRequested(this);
    }
    return orElse();
  }
}

abstract class _PermissionsRequested implements PermissionsEvent {
  const factory _PermissionsRequested() = _$_PermissionsRequested;
}

/// @nodoc
mixin _$PermissionsState {
  bool get permissionsRequested => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionsStateCopyWith<PermissionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsStateCopyWith<$Res> {
  factory $PermissionsStateCopyWith(
          PermissionsState value, $Res Function(PermissionsState) then) =
      _$PermissionsStateCopyWithImpl<$Res, PermissionsState>;
  @useResult
  $Res call({bool permissionsRequested});
}

/// @nodoc
class _$PermissionsStateCopyWithImpl<$Res, $Val extends PermissionsState>
    implements $PermissionsStateCopyWith<$Res> {
  _$PermissionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionsRequested = null,
  }) {
    return _then(_value.copyWith(
      permissionsRequested: null == permissionsRequested
          ? _value.permissionsRequested
          : permissionsRequested // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionsStateCopyWith<$Res>
    implements $PermissionsStateCopyWith<$Res> {
  factory _$$_PermissionsStateCopyWith(
          _$_PermissionsState value, $Res Function(_$_PermissionsState) then) =
      __$$_PermissionsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool permissionsRequested});
}

/// @nodoc
class __$$_PermissionsStateCopyWithImpl<$Res>
    extends _$PermissionsStateCopyWithImpl<$Res, _$_PermissionsState>
    implements _$$_PermissionsStateCopyWith<$Res> {
  __$$_PermissionsStateCopyWithImpl(
      _$_PermissionsState _value, $Res Function(_$_PermissionsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permissionsRequested = null,
  }) {
    return _then(_$_PermissionsState(
      permissionsRequested: null == permissionsRequested
          ? _value.permissionsRequested
          : permissionsRequested // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PermissionsState implements _PermissionsState {
  const _$_PermissionsState({required this.permissionsRequested});

  @override
  final bool permissionsRequested;

  @override
  String toString() {
    return 'PermissionsState(permissionsRequested: $permissionsRequested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PermissionsState &&
            (identical(other.permissionsRequested, permissionsRequested) ||
                other.permissionsRequested == permissionsRequested));
  }

  @override
  int get hashCode => Object.hash(runtimeType, permissionsRequested);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsStateCopyWith<_$_PermissionsState> get copyWith =>
      __$$_PermissionsStateCopyWithImpl<_$_PermissionsState>(this, _$identity);
}

abstract class _PermissionsState implements PermissionsState {
  const factory _PermissionsState({required final bool permissionsRequested}) =
      _$_PermissionsState;

  @override
  bool get permissionsRequested;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsStateCopyWith<_$_PermissionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

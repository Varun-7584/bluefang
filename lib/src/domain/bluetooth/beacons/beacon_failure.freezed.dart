// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beacon_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeaconFailure {
  dynamic get err => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) bluetoothError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? bluetoothError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? bluetoothError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BluetoothError value) bluetoothError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BluetoothError value)? bluetoothError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BluetoothError value)? bluetoothError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeaconFailureCopyWith<BeaconFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconFailureCopyWith<$Res> {
  factory $BeaconFailureCopyWith(
          BeaconFailure value, $Res Function(BeaconFailure) then) =
      _$BeaconFailureCopyWithImpl<$Res, BeaconFailure>;
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class _$BeaconFailureCopyWithImpl<$Res, $Val extends BeaconFailure>
    implements $BeaconFailureCopyWith<$Res> {
  _$BeaconFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothErrorCopyWith<$Res>
    implements $BeaconFailureCopyWith<$Res> {
  factory _$$_BluetoothErrorCopyWith(
          _$_BluetoothError value, $Res Function(_$_BluetoothError) then) =
      __$$_BluetoothErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class __$$_BluetoothErrorCopyWithImpl<$Res>
    extends _$BeaconFailureCopyWithImpl<$Res, _$_BluetoothError>
    implements _$$_BluetoothErrorCopyWith<$Res> {
  __$$_BluetoothErrorCopyWithImpl(
      _$_BluetoothError _value, $Res Function(_$_BluetoothError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_BluetoothError(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_BluetoothError implements _BluetoothError {
  const _$_BluetoothError({required this.err});

  @override
  final dynamic err;

  @override
  String toString() {
    return 'BeaconFailure.bluetoothError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothError &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothErrorCopyWith<_$_BluetoothError> get copyWith =>
      __$$_BluetoothErrorCopyWithImpl<_$_BluetoothError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) bluetoothError,
  }) {
    return bluetoothError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? bluetoothError,
  }) {
    return bluetoothError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? bluetoothError,
    required TResult orElse(),
  }) {
    if (bluetoothError != null) {
      return bluetoothError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BluetoothError value) bluetoothError,
  }) {
    return bluetoothError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BluetoothError value)? bluetoothError,
  }) {
    return bluetoothError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BluetoothError value)? bluetoothError,
    required TResult orElse(),
  }) {
    if (bluetoothError != null) {
      return bluetoothError(this);
    }
    return orElse();
  }
}

abstract class _BluetoothError implements BeaconFailure {
  const factory _BluetoothError({required final dynamic err}) =
      _$_BluetoothError;

  @override
  dynamic get err;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothErrorCopyWith<_$_BluetoothError> get copyWith =>
      throw _privateConstructorUsedError;
}

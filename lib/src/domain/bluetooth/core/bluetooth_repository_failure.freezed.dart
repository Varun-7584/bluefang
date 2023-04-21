// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_repository_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothRepositoryFailure {
  String get error => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) errorParsingBeacons,
    required TResult Function(String error) errorProcessingBeacons,
    required TResult Function(String error) errorEmittingBeacons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? errorParsingBeacons,
    TResult? Function(String error)? errorProcessingBeacons,
    TResult? Function(String error)? errorEmittingBeacons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? errorParsingBeacons,
    TResult Function(String error)? errorProcessingBeacons,
    TResult Function(String error)? errorEmittingBeacons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorParsingBeacons value) errorParsingBeacons,
    required TResult Function(ErrorProcessingBeacons value)
        errorProcessingBeacons,
    required TResult Function(ErrorEmittingBeacons value) errorEmittingBeacons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult? Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult? Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothRepositoryFailureCopyWith<BluetoothRepositoryFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothRepositoryFailureCopyWith<$Res> {
  factory $BluetoothRepositoryFailureCopyWith(BluetoothRepositoryFailure value,
          $Res Function(BluetoothRepositoryFailure) then) =
      _$BluetoothRepositoryFailureCopyWithImpl<$Res,
          BluetoothRepositoryFailure>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$BluetoothRepositoryFailureCopyWithImpl<$Res,
        $Val extends BluetoothRepositoryFailure>
    implements $BluetoothRepositoryFailureCopyWith<$Res> {
  _$BluetoothRepositoryFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorParsingBeaconsCopyWith<$Res>
    implements $BluetoothRepositoryFailureCopyWith<$Res> {
  factory _$$ErrorParsingBeaconsCopyWith(_$ErrorParsingBeacons value,
          $Res Function(_$ErrorParsingBeacons) then) =
      __$$ErrorParsingBeaconsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorParsingBeaconsCopyWithImpl<$Res>
    extends _$BluetoothRepositoryFailureCopyWithImpl<$Res,
        _$ErrorParsingBeacons> implements _$$ErrorParsingBeaconsCopyWith<$Res> {
  __$$ErrorParsingBeaconsCopyWithImpl(
      _$ErrorParsingBeacons _value, $Res Function(_$ErrorParsingBeacons) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorParsingBeacons(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorParsingBeacons implements ErrorParsingBeacons {
  const _$ErrorParsingBeacons(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BluetoothRepositoryFailure.errorParsingBeacons(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorParsingBeacons &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorParsingBeaconsCopyWith<_$ErrorParsingBeacons> get copyWith =>
      __$$ErrorParsingBeaconsCopyWithImpl<_$ErrorParsingBeacons>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) errorParsingBeacons,
    required TResult Function(String error) errorProcessingBeacons,
    required TResult Function(String error) errorEmittingBeacons,
  }) {
    return errorParsingBeacons(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? errorParsingBeacons,
    TResult? Function(String error)? errorProcessingBeacons,
    TResult? Function(String error)? errorEmittingBeacons,
  }) {
    return errorParsingBeacons?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? errorParsingBeacons,
    TResult Function(String error)? errorProcessingBeacons,
    TResult Function(String error)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorParsingBeacons != null) {
      return errorParsingBeacons(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorParsingBeacons value) errorParsingBeacons,
    required TResult Function(ErrorProcessingBeacons value)
        errorProcessingBeacons,
    required TResult Function(ErrorEmittingBeacons value) errorEmittingBeacons,
  }) {
    return errorParsingBeacons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult? Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult? Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
  }) {
    return errorParsingBeacons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorParsingBeacons != null) {
      return errorParsingBeacons(this);
    }
    return orElse();
  }
}

abstract class ErrorParsingBeacons implements BluetoothRepositoryFailure {
  const factory ErrorParsingBeacons(final String error) = _$ErrorParsingBeacons;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ErrorParsingBeaconsCopyWith<_$ErrorParsingBeacons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorProcessingBeaconsCopyWith<$Res>
    implements $BluetoothRepositoryFailureCopyWith<$Res> {
  factory _$$ErrorProcessingBeaconsCopyWith(_$ErrorProcessingBeacons value,
          $Res Function(_$ErrorProcessingBeacons) then) =
      __$$ErrorProcessingBeaconsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorProcessingBeaconsCopyWithImpl<$Res>
    extends _$BluetoothRepositoryFailureCopyWithImpl<$Res,
        _$ErrorProcessingBeacons>
    implements _$$ErrorProcessingBeaconsCopyWith<$Res> {
  __$$ErrorProcessingBeaconsCopyWithImpl(_$ErrorProcessingBeacons _value,
      $Res Function(_$ErrorProcessingBeacons) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorProcessingBeacons(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorProcessingBeacons implements ErrorProcessingBeacons {
  const _$ErrorProcessingBeacons(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BluetoothRepositoryFailure.errorProcessingBeacons(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProcessingBeacons &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProcessingBeaconsCopyWith<_$ErrorProcessingBeacons> get copyWith =>
      __$$ErrorProcessingBeaconsCopyWithImpl<_$ErrorProcessingBeacons>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) errorParsingBeacons,
    required TResult Function(String error) errorProcessingBeacons,
    required TResult Function(String error) errorEmittingBeacons,
  }) {
    return errorProcessingBeacons(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? errorParsingBeacons,
    TResult? Function(String error)? errorProcessingBeacons,
    TResult? Function(String error)? errorEmittingBeacons,
  }) {
    return errorProcessingBeacons?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? errorParsingBeacons,
    TResult Function(String error)? errorProcessingBeacons,
    TResult Function(String error)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorProcessingBeacons != null) {
      return errorProcessingBeacons(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorParsingBeacons value) errorParsingBeacons,
    required TResult Function(ErrorProcessingBeacons value)
        errorProcessingBeacons,
    required TResult Function(ErrorEmittingBeacons value) errorEmittingBeacons,
  }) {
    return errorProcessingBeacons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult? Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult? Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
  }) {
    return errorProcessingBeacons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorProcessingBeacons != null) {
      return errorProcessingBeacons(this);
    }
    return orElse();
  }
}

abstract class ErrorProcessingBeacons implements BluetoothRepositoryFailure {
  const factory ErrorProcessingBeacons(final String error) =
      _$ErrorProcessingBeacons;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ErrorProcessingBeaconsCopyWith<_$ErrorProcessingBeacons> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorEmittingBeaconsCopyWith<$Res>
    implements $BluetoothRepositoryFailureCopyWith<$Res> {
  factory _$$ErrorEmittingBeaconsCopyWith(_$ErrorEmittingBeacons value,
          $Res Function(_$ErrorEmittingBeacons) then) =
      __$$ErrorEmittingBeaconsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorEmittingBeaconsCopyWithImpl<$Res>
    extends _$BluetoothRepositoryFailureCopyWithImpl<$Res,
        _$ErrorEmittingBeacons>
    implements _$$ErrorEmittingBeaconsCopyWith<$Res> {
  __$$ErrorEmittingBeaconsCopyWithImpl(_$ErrorEmittingBeacons _value,
      $Res Function(_$ErrorEmittingBeacons) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorEmittingBeacons(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorEmittingBeacons implements ErrorEmittingBeacons {
  const _$ErrorEmittingBeacons(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BluetoothRepositoryFailure.errorEmittingBeacons(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEmittingBeacons &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEmittingBeaconsCopyWith<_$ErrorEmittingBeacons> get copyWith =>
      __$$ErrorEmittingBeaconsCopyWithImpl<_$ErrorEmittingBeacons>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) errorParsingBeacons,
    required TResult Function(String error) errorProcessingBeacons,
    required TResult Function(String error) errorEmittingBeacons,
  }) {
    return errorEmittingBeacons(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? errorParsingBeacons,
    TResult? Function(String error)? errorProcessingBeacons,
    TResult? Function(String error)? errorEmittingBeacons,
  }) {
    return errorEmittingBeacons?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? errorParsingBeacons,
    TResult Function(String error)? errorProcessingBeacons,
    TResult Function(String error)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorEmittingBeacons != null) {
      return errorEmittingBeacons(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorParsingBeacons value) errorParsingBeacons,
    required TResult Function(ErrorProcessingBeacons value)
        errorProcessingBeacons,
    required TResult Function(ErrorEmittingBeacons value) errorEmittingBeacons,
  }) {
    return errorEmittingBeacons(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult? Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult? Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
  }) {
    return errorEmittingBeacons?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorParsingBeacons value)? errorParsingBeacons,
    TResult Function(ErrorProcessingBeacons value)? errorProcessingBeacons,
    TResult Function(ErrorEmittingBeacons value)? errorEmittingBeacons,
    required TResult orElse(),
  }) {
    if (errorEmittingBeacons != null) {
      return errorEmittingBeacons(this);
    }
    return orElse();
  }
}

abstract class ErrorEmittingBeacons implements BluetoothRepositoryFailure {
  const factory ErrorEmittingBeacons(final String error) =
      _$ErrorEmittingBeacons;

  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$ErrorEmittingBeaconsCopyWith<_$ErrorEmittingBeacons> get copyWith =>
      throw _privateConstructorUsedError;
}

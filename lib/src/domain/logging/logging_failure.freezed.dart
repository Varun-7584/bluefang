// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logging_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoggingFailure {
  dynamic get err => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) invalidMessageType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? invalidMessageType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? invalidMessageType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidMessageType value) invalidMessageType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidMessageType value)? invalidMessageType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidMessageType value)? invalidMessageType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggingFailureCopyWith<LoggingFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggingFailureCopyWith<$Res> {
  factory $LoggingFailureCopyWith(
          LoggingFailure value, $Res Function(LoggingFailure) then) =
      _$LoggingFailureCopyWithImpl<$Res, LoggingFailure>;
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class _$LoggingFailureCopyWithImpl<$Res, $Val extends LoggingFailure>
    implements $LoggingFailureCopyWith<$Res> {
  _$LoggingFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$_InvalidMessageTypeCopyWith<$Res>
    implements $LoggingFailureCopyWith<$Res> {
  factory _$$_InvalidMessageTypeCopyWith(_$_InvalidMessageType value,
          $Res Function(_$_InvalidMessageType) then) =
      __$$_InvalidMessageTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class __$$_InvalidMessageTypeCopyWithImpl<$Res>
    extends _$LoggingFailureCopyWithImpl<$Res, _$_InvalidMessageType>
    implements _$$_InvalidMessageTypeCopyWith<$Res> {
  __$$_InvalidMessageTypeCopyWithImpl(
      _$_InvalidMessageType _value, $Res Function(_$_InvalidMessageType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_InvalidMessageType(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_InvalidMessageType implements _InvalidMessageType {
  const _$_InvalidMessageType({required this.err});

  @override
  final dynamic err;

  @override
  String toString() {
    return 'LoggingFailure.invalidMessageType(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidMessageType &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidMessageTypeCopyWith<_$_InvalidMessageType> get copyWith =>
      __$$_InvalidMessageTypeCopyWithImpl<_$_InvalidMessageType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) invalidMessageType,
  }) {
    return invalidMessageType(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? invalidMessageType,
  }) {
    return invalidMessageType?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? invalidMessageType,
    required TResult orElse(),
  }) {
    if (invalidMessageType != null) {
      return invalidMessageType(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidMessageType value) invalidMessageType,
  }) {
    return invalidMessageType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InvalidMessageType value)? invalidMessageType,
  }) {
    return invalidMessageType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidMessageType value)? invalidMessageType,
    required TResult orElse(),
  }) {
    if (invalidMessageType != null) {
      return invalidMessageType(this);
    }
    return orElse();
  }
}

abstract class _InvalidMessageType implements LoggingFailure {
  const factory _InvalidMessageType({required final dynamic err}) =
      _$_InvalidMessageType;

  @override
  dynamic get err;
  @override
  @JsonKey(ignore: true)
  _$$_InvalidMessageTypeCopyWith<_$_InvalidMessageType> get copyWith =>
      throw _privateConstructorUsedError;
}

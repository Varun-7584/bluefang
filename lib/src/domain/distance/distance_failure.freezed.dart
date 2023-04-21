// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'distance_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DistanceFailure {
  dynamic get err => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) databaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? databaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? databaseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DistanceFailureCopyWith<DistanceFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceFailureCopyWith<$Res> {
  factory $DistanceFailureCopyWith(
          DistanceFailure value, $Res Function(DistanceFailure) then) =
      _$DistanceFailureCopyWithImpl<$Res, DistanceFailure>;
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class _$DistanceFailureCopyWithImpl<$Res, $Val extends DistanceFailure>
    implements $DistanceFailureCopyWith<$Res> {
  _$DistanceFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$_DatabaseErrorCopyWith<$Res>
    implements $DistanceFailureCopyWith<$Res> {
  factory _$$_DatabaseErrorCopyWith(
          _$_DatabaseError value, $Res Function(_$_DatabaseError) then) =
      __$$_DatabaseErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class __$$_DatabaseErrorCopyWithImpl<$Res>
    extends _$DistanceFailureCopyWithImpl<$Res, _$_DatabaseError>
    implements _$$_DatabaseErrorCopyWith<$Res> {
  __$$_DatabaseErrorCopyWithImpl(
      _$_DatabaseError _value, $Res Function(_$_DatabaseError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_DatabaseError(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_DatabaseError implements _DatabaseError {
  const _$_DatabaseError({required this.err});

  @override
  final dynamic err;

  @override
  String toString() {
    return 'DistanceFailure.databaseError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatabaseError &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatabaseErrorCopyWith<_$_DatabaseError> get copyWith =>
      __$$_DatabaseErrorCopyWithImpl<_$_DatabaseError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) databaseError,
  }) {
    return databaseError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? databaseError,
  }) {
    return databaseError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? databaseError,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
  }) {
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
  }) {
    return databaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class _DatabaseError implements DistanceFailure {
  const factory _DatabaseError({required final dynamic err}) = _$_DatabaseError;

  @override
  dynamic get err;
  @override
  @JsonKey(ignore: true)
  _$$_DatabaseErrorCopyWith<_$_DatabaseError> get copyWith =>
      throw _privateConstructorUsedError;
}

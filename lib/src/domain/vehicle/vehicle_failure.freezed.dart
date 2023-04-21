// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VehicleFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(T err) databaseError,
    required TResult Function() unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(T err)? databaseError,
    TResult? Function()? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(T err)? databaseError,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_DatabaseError<T> value) databaseError,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_DatabaseError<T> value)? databaseError,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_DatabaseError<T> value)? databaseError,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleFailureCopyWith<T, $Res> {
  factory $VehicleFailureCopyWith(
          VehicleFailure<T> value, $Res Function(VehicleFailure<T>) then) =
      _$VehicleFailureCopyWithImpl<T, $Res, VehicleFailure<T>>;
}

/// @nodoc
class _$VehicleFailureCopyWithImpl<T, $Res, $Val extends VehicleFailure<T>>
    implements $VehicleFailureCopyWith<T, $Res> {
  _$VehicleFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<T, $Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected<T> value, $Res Function(_$_Unexpected<T>) then) =
      __$$_UnexpectedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<T, $Res>
    extends _$VehicleFailureCopyWithImpl<T, $Res, _$_Unexpected<T>>
    implements _$$_UnexpectedCopyWith<T, $Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected<T> _value, $Res Function(_$_Unexpected<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unexpected<T> implements _Unexpected<T> {
  const _$_Unexpected();

  @override
  String toString() {
    return 'VehicleFailure<$T>.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unexpected<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(T err) databaseError,
    required TResult Function() unableToUpdate,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(T err)? databaseError,
    TResult? Function()? unableToUpdate,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(T err)? databaseError,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_DatabaseError<T> value) databaseError,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_DatabaseError<T> value)? databaseError,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_DatabaseError<T> value)? databaseError,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected<T> implements VehicleFailure<T> {
  const factory _Unexpected() = _$_Unexpected<T>;
}

/// @nodoc
abstract class _$$_DatabaseErrorCopyWith<T, $Res> {
  factory _$$_DatabaseErrorCopyWith(
          _$_DatabaseError<T> value, $Res Function(_$_DatabaseError<T>) then) =
      __$$_DatabaseErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T err});
}

/// @nodoc
class __$$_DatabaseErrorCopyWithImpl<T, $Res>
    extends _$VehicleFailureCopyWithImpl<T, $Res, _$_DatabaseError<T>>
    implements _$$_DatabaseErrorCopyWith<T, $Res> {
  __$$_DatabaseErrorCopyWithImpl(
      _$_DatabaseError<T> _value, $Res Function(_$_DatabaseError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_DatabaseError<T>(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_DatabaseError<T> implements _DatabaseError<T> {
  const _$_DatabaseError({required this.err});

  @override
  final T err;

  @override
  String toString() {
    return 'VehicleFailure<$T>.databaseError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DatabaseError<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatabaseErrorCopyWith<T, _$_DatabaseError<T>> get copyWith =>
      __$$_DatabaseErrorCopyWithImpl<T, _$_DatabaseError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(T err) databaseError,
    required TResult Function() unableToUpdate,
  }) {
    return databaseError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(T err)? databaseError,
    TResult? Function()? unableToUpdate,
  }) {
    return databaseError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(T err)? databaseError,
    TResult Function()? unableToUpdate,
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
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_DatabaseError<T> value) databaseError,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_DatabaseError<T> value)? databaseError,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return databaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_DatabaseError<T> value)? databaseError,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class _DatabaseError<T> implements VehicleFailure<T> {
  const factory _DatabaseError({required final T err}) = _$_DatabaseError<T>;

  T get err;
  @JsonKey(ignore: true)
  _$$_DatabaseErrorCopyWith<T, _$_DatabaseError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnableToUpdateCopyWith<T, $Res> {
  factory _$$_UnableToUpdateCopyWith(_$_UnableToUpdate<T> value,
          $Res Function(_$_UnableToUpdate<T>) then) =
      __$$_UnableToUpdateCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_UnableToUpdateCopyWithImpl<T, $Res>
    extends _$VehicleFailureCopyWithImpl<T, $Res, _$_UnableToUpdate<T>>
    implements _$$_UnableToUpdateCopyWith<T, $Res> {
  __$$_UnableToUpdateCopyWithImpl(
      _$_UnableToUpdate<T> _value, $Res Function(_$_UnableToUpdate<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UnableToUpdate<T> implements _UnableToUpdate<T> {
  const _$_UnableToUpdate();

  @override
  String toString() {
    return 'VehicleFailure<$T>.unableToUpdate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UnableToUpdate<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function(T err) databaseError,
    required TResult Function() unableToUpdate,
  }) {
    return unableToUpdate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function(T err)? databaseError,
    TResult? Function()? unableToUpdate,
  }) {
    return unableToUpdate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function(T err)? databaseError,
    TResult Function()? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected<T> value) unexpected,
    required TResult Function(_DatabaseError<T> value) databaseError,
    required TResult Function(_UnableToUpdate<T> value) unableToUpdate,
  }) {
    return unableToUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected<T> value)? unexpected,
    TResult? Function(_DatabaseError<T> value)? databaseError,
    TResult? Function(_UnableToUpdate<T> value)? unableToUpdate,
  }) {
    return unableToUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected<T> value)? unexpected,
    TResult Function(_DatabaseError<T> value)? databaseError,
    TResult Function(_UnableToUpdate<T> value)? unableToUpdate,
    required TResult orElse(),
  }) {
    if (unableToUpdate != null) {
      return unableToUpdate(this);
    }
    return orElse();
  }
}

abstract class _UnableToUpdate<T> implements VehicleFailure<T> {
  const factory _UnableToUpdate() = _$_UnableToUpdate<T>;
}

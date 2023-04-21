// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepositoryFailures<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryFailuresCopyWith<T, $Res> {
  factory $RepositoryFailuresCopyWith(RepositoryFailures<T> value,
          $Res Function(RepositoryFailures<T>) then) =
      _$RepositoryFailuresCopyWithImpl<T, $Res, RepositoryFailures<T>>;
}

/// @nodoc
class _$RepositoryFailuresCopyWithImpl<T, $Res,
        $Val extends RepositoryFailures<T>>
    implements $RepositoryFailuresCopyWith<T, $Res> {
  _$RepositoryFailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InsertionFailureCopyWith<T, $Res> {
  factory _$$InsertionFailureCopyWith(_$InsertionFailure<T> value,
          $Res Function(_$InsertionFailure<T>) then) =
      __$$InsertionFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T err});
}

/// @nodoc
class __$$InsertionFailureCopyWithImpl<T, $Res>
    extends _$RepositoryFailuresCopyWithImpl<T, $Res, _$InsertionFailure<T>>
    implements _$$InsertionFailureCopyWith<T, $Res> {
  __$$InsertionFailureCopyWithImpl(
      _$InsertionFailure<T> _value, $Res Function(_$InsertionFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$InsertionFailure<T>(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InsertionFailure<T> implements InsertionFailure<T> {
  const _$InsertionFailure({required this.err});

  @override
  final T err;

  @override
  String toString() {
    return 'RepositoryFailures<$T>.insertionFailure(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsertionFailure<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertionFailureCopyWith<T, _$InsertionFailure<T>> get copyWith =>
      __$$InsertionFailureCopyWithImpl<T, _$InsertionFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) {
    return insertionFailure(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) {
    return insertionFailure?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) {
    if (insertionFailure != null) {
      return insertionFailure(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) {
    return insertionFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) {
    return insertionFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) {
    if (insertionFailure != null) {
      return insertionFailure(this);
    }
    return orElse();
  }
}

abstract class InsertionFailure<T> implements RepositoryFailures<T> {
  const factory InsertionFailure({required final T err}) =
      _$InsertionFailure<T>;

  T get err;
  @JsonKey(ignore: true)
  _$$InsertionFailureCopyWith<T, _$InsertionFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFailureCopyWith<T, $Res> {
  factory _$$UpdateFailureCopyWith(
          _$UpdateFailure<T> value, $Res Function(_$UpdateFailure<T>) then) =
      __$$UpdateFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T err});
}

/// @nodoc
class __$$UpdateFailureCopyWithImpl<T, $Res>
    extends _$RepositoryFailuresCopyWithImpl<T, $Res, _$UpdateFailure<T>>
    implements _$$UpdateFailureCopyWith<T, $Res> {
  __$$UpdateFailureCopyWithImpl(
      _$UpdateFailure<T> _value, $Res Function(_$UpdateFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$UpdateFailure<T>(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UpdateFailure<T> implements UpdateFailure<T> {
  const _$UpdateFailure({required this.err});

  @override
  final T err;

  @override
  String toString() {
    return 'RepositoryFailures<$T>.updateFailure(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFailure<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFailureCopyWith<T, _$UpdateFailure<T>> get copyWith =>
      __$$UpdateFailureCopyWithImpl<T, _$UpdateFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) {
    return updateFailure(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) {
    return updateFailure?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) {
    if (updateFailure != null) {
      return updateFailure(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) {
    return updateFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) {
    return updateFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) {
    if (updateFailure != null) {
      return updateFailure(this);
    }
    return orElse();
  }
}

abstract class UpdateFailure<T> implements RepositoryFailures<T> {
  const factory UpdateFailure({required final T err}) = _$UpdateFailure<T>;

  T get err;
  @JsonKey(ignore: true)
  _$$UpdateFailureCopyWith<T, _$UpdateFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFailureCopyWith<T, $Res> {
  factory _$$DeleteFailureCopyWith(
          _$DeleteFailure<T> value, $Res Function(_$DeleteFailure<T>) then) =
      __$$DeleteFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T err});
}

/// @nodoc
class __$$DeleteFailureCopyWithImpl<T, $Res>
    extends _$RepositoryFailuresCopyWithImpl<T, $Res, _$DeleteFailure<T>>
    implements _$$DeleteFailureCopyWith<T, $Res> {
  __$$DeleteFailureCopyWithImpl(
      _$DeleteFailure<T> _value, $Res Function(_$DeleteFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$DeleteFailure<T>(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DeleteFailure<T> implements DeleteFailure<T> {
  const _$DeleteFailure({required this.err});

  @override
  final T err;

  @override
  String toString() {
    return 'RepositoryFailures<$T>.deleteFailure(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFailure<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFailureCopyWith<T, _$DeleteFailure<T>> get copyWith =>
      __$$DeleteFailureCopyWithImpl<T, _$DeleteFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) {
    return deleteFailure(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) {
    return deleteFailure?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) {
    if (deleteFailure != null) {
      return deleteFailure(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) {
    return deleteFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) {
    return deleteFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) {
    if (deleteFailure != null) {
      return deleteFailure(this);
    }
    return orElse();
  }
}

abstract class DeleteFailure<T> implements RepositoryFailures<T> {
  const factory DeleteFailure({required final T err}) = _$DeleteFailure<T>;

  T get err;
  @JsonKey(ignore: true)
  _$$DeleteFailureCopyWith<T, _$DeleteFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QueryFailureCopyWith<T, $Res> {
  factory _$$QueryFailureCopyWith(
          _$QueryFailure<T> value, $Res Function(_$QueryFailure<T>) then) =
      __$$QueryFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T err});
}

/// @nodoc
class __$$QueryFailureCopyWithImpl<T, $Res>
    extends _$RepositoryFailuresCopyWithImpl<T, $Res, _$QueryFailure<T>>
    implements _$$QueryFailureCopyWith<T, $Res> {
  __$$QueryFailureCopyWithImpl(
      _$QueryFailure<T> _value, $Res Function(_$QueryFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$QueryFailure<T>(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$QueryFailure<T> implements QueryFailure<T> {
  const _$QueryFailure({required this.err});

  @override
  final T err;

  @override
  String toString() {
    return 'RepositoryFailures<$T>.queryFailure(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryFailure<T> &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryFailureCopyWith<T, _$QueryFailure<T>> get copyWith =>
      __$$QueryFailureCopyWithImpl<T, _$QueryFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) {
    return queryFailure(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) {
    return queryFailure?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) {
    if (queryFailure != null) {
      return queryFailure(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) {
    return queryFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) {
    return queryFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) {
    if (queryFailure != null) {
      return queryFailure(this);
    }
    return orElse();
  }
}

abstract class QueryFailure<T> implements RepositoryFailures<T> {
  const factory QueryFailure({required final T err}) = _$QueryFailure<T>;

  T get err;
  @JsonKey(ignore: true)
  _$$QueryFailureCopyWith<T, _$QueryFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScibeErrorCopyWith<T, $Res> {
  factory _$$ScibeErrorCopyWith(
          _$ScibeError<T> value, $Res Function(_$ScibeError<T>) then) =
      __$$ScibeErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T failedValue});
}

/// @nodoc
class __$$ScibeErrorCopyWithImpl<T, $Res>
    extends _$RepositoryFailuresCopyWithImpl<T, $Res, _$ScibeError<T>>
    implements _$$ScibeErrorCopyWith<T, $Res> {
  __$$ScibeErrorCopyWithImpl(
      _$ScibeError<T> _value, $Res Function(_$ScibeError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$ScibeError<T>(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ScibeError<T> implements ScibeError<T> {
  const _$ScibeError({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'RepositoryFailures<$T>.scibeError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScibeError<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScibeErrorCopyWith<T, _$ScibeError<T>> get copyWith =>
      __$$ScibeErrorCopyWithImpl<T, _$ScibeError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T err) insertionFailure,
    required TResult Function(T err) updateFailure,
    required TResult Function(T err) deleteFailure,
    required TResult Function(T err) queryFailure,
    required TResult Function(T failedValue) scibeError,
  }) {
    return scibeError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T err)? insertionFailure,
    TResult? Function(T err)? updateFailure,
    TResult? Function(T err)? deleteFailure,
    TResult? Function(T err)? queryFailure,
    TResult? Function(T failedValue)? scibeError,
  }) {
    return scibeError?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T err)? insertionFailure,
    TResult Function(T err)? updateFailure,
    TResult Function(T err)? deleteFailure,
    TResult Function(T err)? queryFailure,
    TResult Function(T failedValue)? scibeError,
    required TResult orElse(),
  }) {
    if (scibeError != null) {
      return scibeError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InsertionFailure<T> value) insertionFailure,
    required TResult Function(UpdateFailure<T> value) updateFailure,
    required TResult Function(DeleteFailure<T> value) deleteFailure,
    required TResult Function(QueryFailure<T> value) queryFailure,
    required TResult Function(ScibeError<T> value) scibeError,
  }) {
    return scibeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InsertionFailure<T> value)? insertionFailure,
    TResult? Function(UpdateFailure<T> value)? updateFailure,
    TResult? Function(DeleteFailure<T> value)? deleteFailure,
    TResult? Function(QueryFailure<T> value)? queryFailure,
    TResult? Function(ScibeError<T> value)? scibeError,
  }) {
    return scibeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InsertionFailure<T> value)? insertionFailure,
    TResult Function(UpdateFailure<T> value)? updateFailure,
    TResult Function(DeleteFailure<T> value)? deleteFailure,
    TResult Function(QueryFailure<T> value)? queryFailure,
    TResult Function(ScibeError<T> value)? scibeError,
    required TResult orElse(),
  }) {
    if (scibeError != null) {
      return scibeError(this);
    }
    return orElse();
  }
}

abstract class ScibeError<T> implements RepositoryFailures<T> {
  const factory ScibeError({required final T failedValue}) = _$ScibeError<T>;

  T get failedValue;
  @JsonKey(ignore: true)
  _$$ScibeErrorCopyWith<T, _$ScibeError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

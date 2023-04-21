// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_datatrac_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgrammedDataTracFailure {
  dynamic get err => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) databaseError,
    required TResult Function(dynamic err) invalidState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? databaseError,
    TResult? Function(dynamic err)? invalidState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? databaseError,
    TResult Function(dynamic err)? invalidState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_InvalidState value) invalidState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_InvalidState value)? invalidState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_InvalidState value)? invalidState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgrammedDataTracFailureCopyWith<ProgrammedDataTracFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgrammedDataTracFailureCopyWith<$Res> {
  factory $ProgrammedDataTracFailureCopyWith(ProgrammedDataTracFailure value,
          $Res Function(ProgrammedDataTracFailure) then) =
      _$ProgrammedDataTracFailureCopyWithImpl<$Res, ProgrammedDataTracFailure>;
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class _$ProgrammedDataTracFailureCopyWithImpl<$Res,
        $Val extends ProgrammedDataTracFailure>
    implements $ProgrammedDataTracFailureCopyWith<$Res> {
  _$ProgrammedDataTracFailureCopyWithImpl(this._value, this._then);

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
    implements $ProgrammedDataTracFailureCopyWith<$Res> {
  factory _$$_DatabaseErrorCopyWith(
          _$_DatabaseError value, $Res Function(_$_DatabaseError) then) =
      __$$_DatabaseErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class __$$_DatabaseErrorCopyWithImpl<$Res>
    extends _$ProgrammedDataTracFailureCopyWithImpl<$Res, _$_DatabaseError>
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
    return 'ProgrammedDataTracFailure.databaseError(err: $err)';
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
    required TResult Function(dynamic err) invalidState,
  }) {
    return databaseError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? databaseError,
    TResult? Function(dynamic err)? invalidState,
  }) {
    return databaseError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? databaseError,
    TResult Function(dynamic err)? invalidState,
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
    required TResult Function(_InvalidState value) invalidState,
  }) {
    return databaseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_InvalidState value)? invalidState,
  }) {
    return databaseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_InvalidState value)? invalidState,
    required TResult orElse(),
  }) {
    if (databaseError != null) {
      return databaseError(this);
    }
    return orElse();
  }
}

abstract class _DatabaseError implements ProgrammedDataTracFailure {
  const factory _DatabaseError({required final dynamic err}) = _$_DatabaseError;

  @override
  dynamic get err;
  @override
  @JsonKey(ignore: true)
  _$$_DatabaseErrorCopyWith<_$_DatabaseError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidStateCopyWith<$Res>
    implements $ProgrammedDataTracFailureCopyWith<$Res> {
  factory _$$_InvalidStateCopyWith(
          _$_InvalidState value, $Res Function(_$_InvalidState) then) =
      __$$_InvalidStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic err});
}

/// @nodoc
class __$$_InvalidStateCopyWithImpl<$Res>
    extends _$ProgrammedDataTracFailureCopyWithImpl<$Res, _$_InvalidState>
    implements _$$_InvalidStateCopyWith<$Res> {
  __$$_InvalidStateCopyWithImpl(
      _$_InvalidState _value, $Res Function(_$_InvalidState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(_$_InvalidState(
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_InvalidState implements _InvalidState {
  const _$_InvalidState({required this.err});

  @override
  final dynamic err;

  @override
  String toString() {
    return 'ProgrammedDataTracFailure.invalidState(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidState &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidStateCopyWith<_$_InvalidState> get copyWith =>
      __$$_InvalidStateCopyWithImpl<_$_InvalidState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic err) databaseError,
    required TResult Function(dynamic err) invalidState,
  }) {
    return invalidState(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic err)? databaseError,
    TResult? Function(dynamic err)? invalidState,
  }) {
    return invalidState?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic err)? databaseError,
    TResult Function(dynamic err)? invalidState,
    required TResult orElse(),
  }) {
    if (invalidState != null) {
      return invalidState(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DatabaseError value) databaseError,
    required TResult Function(_InvalidState value) invalidState,
  }) {
    return invalidState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DatabaseError value)? databaseError,
    TResult? Function(_InvalidState value)? invalidState,
  }) {
    return invalidState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DatabaseError value)? databaseError,
    TResult Function(_InvalidState value)? invalidState,
    required TResult orElse(),
  }) {
    if (invalidState != null) {
      return invalidState(this);
    }
    return orElse();
  }
}

abstract class _InvalidState implements ProgrammedDataTracFailure {
  const factory _InvalidState({required final dynamic err}) = _$_InvalidState;

  @override
  dynamic get err;
  @override
  @JsonKey(ignore: true)
  _$$_InvalidStateCopyWith<_$_InvalidState> get copyWith =>
      throw _privateConstructorUsedError;
}

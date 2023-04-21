// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_data_trac_watcher_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgramDataTracWatcherDataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)
        sensorsRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllStarted,
    TResult? Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_SensorRecieved value) sensorsRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_SensorRecieved value)? sensorsRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_SensorRecieved value)? sensorsRecieved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramDataTracWatcherDataEventCopyWith<$Res> {
  factory $ProgramDataTracWatcherDataEventCopyWith(
          ProgramDataTracWatcherDataEvent value,
          $Res Function(ProgramDataTracWatcherDataEvent) then) =
      _$ProgramDataTracWatcherDataEventCopyWithImpl<$Res,
          ProgramDataTracWatcherDataEvent>;
}

/// @nodoc
class _$ProgramDataTracWatcherDataEventCopyWithImpl<$Res,
        $Val extends ProgramDataTracWatcherDataEvent>
    implements $ProgramDataTracWatcherDataEventCopyWith<$Res> {
  _$ProgramDataTracWatcherDataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WatchAllStartedCopyWith<$Res> {
  factory _$$_WatchAllStartedCopyWith(
          _$_WatchAllStarted value, $Res Function(_$_WatchAllStarted) then) =
      __$$_WatchAllStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WatchAllStartedCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataEventCopyWithImpl<$Res,
        _$_WatchAllStarted> implements _$$_WatchAllStartedCopyWith<$Res> {
  __$$_WatchAllStartedCopyWithImpl(
      _$_WatchAllStarted _value, $Res Function(_$_WatchAllStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_WatchAllStarted implements _WatchAllStarted {
  const _$_WatchAllStarted();

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataEvent.watchAllStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WatchAllStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)
        sensorsRecieved,
  }) {
    return watchAllStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllStarted,
    TResult? Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
  }) {
    return watchAllStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_SensorRecieved value) sensorsRecieved,
  }) {
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_SensorRecieved value)? sensorsRecieved,
  }) {
    return watchAllStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_SensorRecieved value)? sensorsRecieved,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _WatchAllStarted implements ProgramDataTracWatcherDataEvent {
  const factory _WatchAllStarted() = _$_WatchAllStarted;
}

/// @nodoc
abstract class _$$_SensorRecievedCopyWith<$Res> {
  factory _$$_SensorRecievedCopyWith(
          _$_SensorRecieved value, $Res Function(_$_SensorRecieved) then) =
      __$$_SensorRecievedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
          failureOrSensors});
}

/// @nodoc
class __$$_SensorRecievedCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataEventCopyWithImpl<$Res,
        _$_SensorRecieved> implements _$$_SensorRecievedCopyWith<$Res> {
  __$$_SensorRecievedCopyWithImpl(
      _$_SensorRecieved _value, $Res Function(_$_SensorRecieved) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSensors = null,
  }) {
    return _then(_$_SensorRecieved(
      null == failureOrSensors
          ? _value.failureOrSensors
          : failureOrSensors // ignore: cast_nullable_to_non_nullable
              as Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>,
    ));
  }
}

/// @nodoc

class _$_SensorRecieved implements _SensorRecieved {
  const _$_SensorRecieved(this.failureOrSensors);

  @override
  final Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
      failureOrSensors;

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataEvent.sensorsRecieved(failureOrSensors: $failureOrSensors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SensorRecieved &&
            (identical(other.failureOrSensors, failureOrSensors) ||
                other.failureOrSensors == failureOrSensors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrSensors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SensorRecievedCopyWith<_$_SensorRecieved> get copyWith =>
      __$$_SensorRecievedCopyWithImpl<_$_SensorRecieved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)
        sensorsRecieved,
  }) {
    return sensorsRecieved(failureOrSensors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllStarted,
    TResult? Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
  }) {
    return sensorsRecieved?.call(failureOrSensors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(
            Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
                failureOrSensors)?
        sensorsRecieved,
    required TResult orElse(),
  }) {
    if (sensorsRecieved != null) {
      return sensorsRecieved(failureOrSensors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllStarted value) watchAllStarted,
    required TResult Function(_SensorRecieved value) sensorsRecieved,
  }) {
    return sensorsRecieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllStarted value)? watchAllStarted,
    TResult? Function(_SensorRecieved value)? sensorsRecieved,
  }) {
    return sensorsRecieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllStarted value)? watchAllStarted,
    TResult Function(_SensorRecieved value)? sensorsRecieved,
    required TResult orElse(),
  }) {
    if (sensorsRecieved != null) {
      return sensorsRecieved(this);
    }
    return orElse();
  }
}

abstract class _SensorRecieved implements ProgramDataTracWatcherDataEvent {
  const factory _SensorRecieved(
      final Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
          failureOrSensors) = _$_SensorRecieved;

  Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
      get failureOrSensors;
  @JsonKey(ignore: true)
  _$$_SensorRecievedCopyWith<_$_SensorRecieved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProgramDataTracWatcherDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)
        loadSuccess,
    required TResult Function(
            ProgrammedDataTracFailure programmedDataTracFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult? Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramDataTracWatcherDataStateCopyWith<$Res> {
  factory $ProgramDataTracWatcherDataStateCopyWith(
          ProgramDataTracWatcherDataState value,
          $Res Function(ProgramDataTracWatcherDataState) then) =
      _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res,
          ProgramDataTracWatcherDataState>;
}

/// @nodoc
class _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res,
        $Val extends ProgramDataTracWatcherDataState>
    implements $ProgramDataTracWatcherDataStateCopyWith<$Res> {
  _$ProgramDataTracWatcherDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)
        loadSuccess,
    required TResult Function(
            ProgrammedDataTracFailure programmedDataTracFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult? Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProgramDataTracWatcherDataState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res,
        _$_LoadInProgress> implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)
        loadSuccess,
    required TResult Function(
            ProgrammedDataTracFailure programmedDataTracFailure)
        loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult? Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements ProgramDataTracWatcherDataState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<ProgrammedDataTrac> programmedDataTrac});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programmedDataTrac = null,
  }) {
    return _then(_$_LoadSuccess(
      null == programmedDataTrac
          ? _value.programmedDataTrac
          : programmedDataTrac // ignore: cast_nullable_to_non_nullable
              as KtList<ProgrammedDataTrac>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.programmedDataTrac);

  @override
  final KtList<ProgrammedDataTrac> programmedDataTrac;

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataState.loadSuccess(programmedDataTrac: $programmedDataTrac)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.programmedDataTrac, programmedDataTrac) ||
                other.programmedDataTrac == programmedDataTrac));
  }

  @override
  int get hashCode => Object.hash(runtimeType, programmedDataTrac);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)
        loadSuccess,
    required TResult Function(
            ProgrammedDataTracFailure programmedDataTracFailure)
        loadFailure,
  }) {
    return loadSuccess(programmedDataTrac);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult? Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
  }) {
    return loadSuccess?.call(programmedDataTrac);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(programmedDataTrac);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements ProgramDataTracWatcherDataState {
  const factory _LoadSuccess(
      final KtList<ProgrammedDataTrac> programmedDataTrac) = _$_LoadSuccess;

  KtList<ProgrammedDataTrac> get programmedDataTrac;
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({ProgrammedDataTracFailure programmedDataTracFailure});

  $ProgrammedDataTracFailureCopyWith<$Res> get programmedDataTracFailure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$ProgramDataTracWatcherDataStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programmedDataTracFailure = null,
  }) {
    return _then(_$_LoadFailure(
      null == programmedDataTracFailure
          ? _value.programmedDataTracFailure
          : programmedDataTracFailure // ignore: cast_nullable_to_non_nullable
              as ProgrammedDataTracFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgrammedDataTracFailureCopyWith<$Res> get programmedDataTracFailure {
    return $ProgrammedDataTracFailureCopyWith<$Res>(
        _value.programmedDataTracFailure, (value) {
      return _then(_value.copyWith(programmedDataTracFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.programmedDataTracFailure);

  @override
  final ProgrammedDataTracFailure programmedDataTracFailure;

  @override
  String toString() {
    return 'ProgramDataTracWatcherDataState.loadFailure(programmedDataTracFailure: $programmedDataTracFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.programmedDataTracFailure,
                    programmedDataTracFailure) ||
                other.programmedDataTracFailure == programmedDataTracFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, programmedDataTracFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)
        loadSuccess,
    required TResult Function(
            ProgrammedDataTracFailure programmedDataTracFailure)
        loadFailure,
  }) {
    return loadFailure(programmedDataTracFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult? Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
  }) {
    return loadFailure?.call(programmedDataTracFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<ProgrammedDataTrac> programmedDataTrac)?
        loadSuccess,
    TResult Function(ProgrammedDataTracFailure programmedDataTracFailure)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(programmedDataTracFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements ProgramDataTracWatcherDataState {
  const factory _LoadFailure(
          final ProgrammedDataTracFailure programmedDataTracFailure) =
      _$_LoadFailure;

  ProgrammedDataTracFailure get programmedDataTracFailure;
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

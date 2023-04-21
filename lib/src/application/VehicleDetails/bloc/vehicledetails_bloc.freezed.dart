// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicledetails_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VehicledetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DtID dataTracID) displayVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displayVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displayVehicle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FindVehicle value) displayVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FindVehicle value)? displayVehicle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FindVehicle value)? displayVehicle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicledetailsEventCopyWith<$Res> {
  factory $VehicledetailsEventCopyWith(
          VehicledetailsEvent value, $Res Function(VehicledetailsEvent) then) =
      _$VehicledetailsEventCopyWithImpl<$Res, VehicledetailsEvent>;
}

/// @nodoc
class _$VehicledetailsEventCopyWithImpl<$Res, $Val extends VehicledetailsEvent>
    implements $VehicledetailsEventCopyWith<$Res> {
  _$VehicledetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$VehicledetailsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'VehicledetailsEvent.started()';
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
    required TResult Function(DtID dataTracID) displayVehicle,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displayVehicle,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displayVehicle,
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
    required TResult Function(_FindVehicle value) displayVehicle,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FindVehicle value)? displayVehicle,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FindVehicle value)? displayVehicle,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VehicledetailsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_FindVehicleCopyWith<$Res> {
  factory _$$_FindVehicleCopyWith(
          _$_FindVehicle value, $Res Function(_$_FindVehicle) then) =
      __$$_FindVehicleCopyWithImpl<$Res>;
  @useResult
  $Res call({DtID dataTracID});
}

/// @nodoc
class __$$_FindVehicleCopyWithImpl<$Res>
    extends _$VehicledetailsEventCopyWithImpl<$Res, _$_FindVehicle>
    implements _$$_FindVehicleCopyWith<$Res> {
  __$$_FindVehicleCopyWithImpl(
      _$_FindVehicle _value, $Res Function(_$_FindVehicle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataTracID = null,
  }) {
    return _then(_$_FindVehicle(
      dataTracID: null == dataTracID
          ? _value.dataTracID
          : dataTracID // ignore: cast_nullable_to_non_nullable
              as DtID,
    ));
  }
}

/// @nodoc

class _$_FindVehicle implements _FindVehicle {
  const _$_FindVehicle({required this.dataTracID});

  @override
  final DtID dataTracID;

  @override
  String toString() {
    return 'VehicledetailsEvent.displayVehicle(dataTracID: $dataTracID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FindVehicle &&
            (identical(other.dataTracID, dataTracID) ||
                other.dataTracID == dataTracID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataTracID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FindVehicleCopyWith<_$_FindVehicle> get copyWith =>
      __$$_FindVehicleCopyWithImpl<_$_FindVehicle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DtID dataTracID) displayVehicle,
  }) {
    return displayVehicle(dataTracID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displayVehicle,
  }) {
    return displayVehicle?.call(dataTracID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displayVehicle,
    required TResult orElse(),
  }) {
    if (displayVehicle != null) {
      return displayVehicle(dataTracID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FindVehicle value) displayVehicle,
  }) {
    return displayVehicle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_FindVehicle value)? displayVehicle,
  }) {
    return displayVehicle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FindVehicle value)? displayVehicle,
    required TResult orElse(),
  }) {
    if (displayVehicle != null) {
      return displayVehicle(this);
    }
    return orElse();
  }
}

abstract class _FindVehicle implements VehicledetailsEvent {
  const factory _FindVehicle({required final DtID dataTracID}) = _$_FindVehicle;

  DtID get dataTracID;
  @JsonKey(ignore: true)
  _$$_FindVehicleCopyWith<_$_FindVehicle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicledetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  ProgrammedDataTrac get programmedDataTrac =>
      throw _privateConstructorUsedError;
  Option<Either<ProgrammedDataTracFailure, Unit>>
      get saveFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VehicledetailsStateCopyWith<VehicledetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicledetailsStateCopyWith<$Res> {
  factory $VehicledetailsStateCopyWith(
          VehicledetailsState value, $Res Function(VehicledetailsState) then) =
      _$VehicledetailsStateCopyWithImpl<$Res, VehicledetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      ProgrammedDataTrac programmedDataTrac,
      Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption});

  $ProgrammedDataTracCopyWith<$Res> get programmedDataTrac;
}

/// @nodoc
class _$VehicledetailsStateCopyWithImpl<$Res, $Val extends VehicledetailsState>
    implements $VehicledetailsStateCopyWith<$Res> {
  _$VehicledetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? programmedDataTrac = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      programmedDataTrac: null == programmedDataTrac
          ? _value.programmedDataTrac
          : programmedDataTrac // ignore: cast_nullable_to_non_nullable
              as ProgrammedDataTrac,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProgrammedDataTracFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgrammedDataTracCopyWith<$Res> get programmedDataTrac {
    return $ProgrammedDataTracCopyWith<$Res>(_value.programmedDataTrac,
        (value) {
      return _then(_value.copyWith(programmedDataTrac: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VehicledetailsStateCopyWith<$Res>
    implements $VehicledetailsStateCopyWith<$Res> {
  factory _$$_VehicledetailsStateCopyWith(_$_VehicledetailsState value,
          $Res Function(_$_VehicledetailsState) then) =
      __$$_VehicledetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ProgrammedDataTrac programmedDataTrac,
      Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption});

  @override
  $ProgrammedDataTracCopyWith<$Res> get programmedDataTrac;
}

/// @nodoc
class __$$_VehicledetailsStateCopyWithImpl<$Res>
    extends _$VehicledetailsStateCopyWithImpl<$Res, _$_VehicledetailsState>
    implements _$$_VehicledetailsStateCopyWith<$Res> {
  __$$_VehicledetailsStateCopyWithImpl(_$_VehicledetailsState _value,
      $Res Function(_$_VehicledetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? programmedDataTrac = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_VehicledetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      programmedDataTrac: null == programmedDataTrac
          ? _value.programmedDataTrac
          : programmedDataTrac // ignore: cast_nullable_to_non_nullable
              as ProgrammedDataTrac,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProgrammedDataTracFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_VehicledetailsState implements _VehicledetailsState {
  const _$_VehicledetailsState(
      {required this.isLoading,
      required this.programmedDataTrac,
      required this.saveFailureOrSuccessOption});

  @override
  final bool isLoading;
  @override
  final ProgrammedDataTrac programmedDataTrac;
  @override
  final Option<Either<ProgrammedDataTracFailure, Unit>>
      saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'VehicledetailsState(isLoading: $isLoading, programmedDataTrac: $programmedDataTrac, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicledetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.programmedDataTrac, programmedDataTrac) ||
                other.programmedDataTrac == programmedDataTrac) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, programmedDataTrac, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicledetailsStateCopyWith<_$_VehicledetailsState> get copyWith =>
      __$$_VehicledetailsStateCopyWithImpl<_$_VehicledetailsState>(
          this, _$identity);
}

abstract class _VehicledetailsState implements VehicledetailsState {
  const factory _VehicledetailsState(
      {required final bool isLoading,
      required final ProgrammedDataTrac programmedDataTrac,
      required final Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_VehicledetailsState;

  @override
  bool get isLoading;
  @override
  ProgrammedDataTrac get programmedDataTrac;
  @override
  Option<Either<ProgrammedDataTracFailure, Unit>>
      get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_VehicledetailsStateCopyWith<_$_VehicledetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

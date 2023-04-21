// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensordetails_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensordetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DtID dataTracID) displaySensor,
    required TResult Function(IBeacon beacon) beaconAlert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displaySensor,
    TResult? Function(IBeacon beacon)? beaconAlert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displaySensor,
    TResult Function(IBeacon beacon)? beaconAlert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DisplaySensor value) displaySensor,
    required TResult Function(_BeaconAlert value) beaconAlert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DisplaySensor value)? displaySensor,
    TResult? Function(_BeaconAlert value)? beaconAlert,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DisplaySensor value)? displaySensor,
    TResult Function(_BeaconAlert value)? beaconAlert,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensordetailsEventCopyWith<$Res> {
  factory $SensordetailsEventCopyWith(
          SensordetailsEvent value, $Res Function(SensordetailsEvent) then) =
      _$SensordetailsEventCopyWithImpl<$Res, SensordetailsEvent>;
}

/// @nodoc
class _$SensordetailsEventCopyWithImpl<$Res, $Val extends SensordetailsEvent>
    implements $SensordetailsEventCopyWith<$Res> {
  _$SensordetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$SensordetailsEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  _$_Started();

  @override
  String toString() {
    return 'SensordetailsEvent.started()';
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
    required TResult Function(DtID dataTracID) displaySensor,
    required TResult Function(IBeacon beacon) beaconAlert,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displaySensor,
    TResult? Function(IBeacon beacon)? beaconAlert,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displaySensor,
    TResult Function(IBeacon beacon)? beaconAlert,
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
    required TResult Function(_DisplaySensor value) displaySensor,
    required TResult Function(_BeaconAlert value) beaconAlert,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DisplaySensor value)? displaySensor,
    TResult? Function(_BeaconAlert value)? beaconAlert,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DisplaySensor value)? displaySensor,
    TResult Function(_BeaconAlert value)? beaconAlert,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SensordetailsEvent {
  factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_DisplaySensorCopyWith<$Res> {
  factory _$$_DisplaySensorCopyWith(
          _$_DisplaySensor value, $Res Function(_$_DisplaySensor) then) =
      __$$_DisplaySensorCopyWithImpl<$Res>;
  @useResult
  $Res call({DtID dataTracID});
}

/// @nodoc
class __$$_DisplaySensorCopyWithImpl<$Res>
    extends _$SensordetailsEventCopyWithImpl<$Res, _$_DisplaySensor>
    implements _$$_DisplaySensorCopyWith<$Res> {
  __$$_DisplaySensorCopyWithImpl(
      _$_DisplaySensor _value, $Res Function(_$_DisplaySensor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataTracID = null,
  }) {
    return _then(_$_DisplaySensor(
      dataTracID: null == dataTracID
          ? _value.dataTracID
          : dataTracID // ignore: cast_nullable_to_non_nullable
              as DtID,
    ));
  }
}

/// @nodoc

class _$_DisplaySensor implements _DisplaySensor {
  _$_DisplaySensor({required this.dataTracID});

  @override
  final DtID dataTracID;

  @override
  String toString() {
    return 'SensordetailsEvent.displaySensor(dataTracID: $dataTracID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplaySensor &&
            (identical(other.dataTracID, dataTracID) ||
                other.dataTracID == dataTracID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dataTracID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisplaySensorCopyWith<_$_DisplaySensor> get copyWith =>
      __$$_DisplaySensorCopyWithImpl<_$_DisplaySensor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DtID dataTracID) displaySensor,
    required TResult Function(IBeacon beacon) beaconAlert,
  }) {
    return displaySensor(dataTracID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displaySensor,
    TResult? Function(IBeacon beacon)? beaconAlert,
  }) {
    return displaySensor?.call(dataTracID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displaySensor,
    TResult Function(IBeacon beacon)? beaconAlert,
    required TResult orElse(),
  }) {
    if (displaySensor != null) {
      return displaySensor(dataTracID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DisplaySensor value) displaySensor,
    required TResult Function(_BeaconAlert value) beaconAlert,
  }) {
    return displaySensor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DisplaySensor value)? displaySensor,
    TResult? Function(_BeaconAlert value)? beaconAlert,
  }) {
    return displaySensor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DisplaySensor value)? displaySensor,
    TResult Function(_BeaconAlert value)? beaconAlert,
    required TResult orElse(),
  }) {
    if (displaySensor != null) {
      return displaySensor(this);
    }
    return orElse();
  }
}

abstract class _DisplaySensor implements SensordetailsEvent {
  factory _DisplaySensor({required final DtID dataTracID}) = _$_DisplaySensor;

  DtID get dataTracID;
  @JsonKey(ignore: true)
  _$$_DisplaySensorCopyWith<_$_DisplaySensor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeaconAlertCopyWith<$Res> {
  factory _$$_BeaconAlertCopyWith(
          _$_BeaconAlert value, $Res Function(_$_BeaconAlert) then) =
      __$$_BeaconAlertCopyWithImpl<$Res>;
  @useResult
  $Res call({IBeacon beacon});
}

/// @nodoc
class __$$_BeaconAlertCopyWithImpl<$Res>
    extends _$SensordetailsEventCopyWithImpl<$Res, _$_BeaconAlert>
    implements _$$_BeaconAlertCopyWith<$Res> {
  __$$_BeaconAlertCopyWithImpl(
      _$_BeaconAlert _value, $Res Function(_$_BeaconAlert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beacon = null,
  }) {
    return _then(_$_BeaconAlert(
      beacon: null == beacon
          ? _value.beacon
          : beacon // ignore: cast_nullable_to_non_nullable
              as IBeacon,
    ));
  }
}

/// @nodoc

class _$_BeaconAlert implements _BeaconAlert {
  _$_BeaconAlert({required this.beacon});

  @override
  final IBeacon beacon;

  @override
  String toString() {
    return 'SensordetailsEvent.beaconAlert(beacon: $beacon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeaconAlert &&
            (identical(other.beacon, beacon) || other.beacon == beacon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beacon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeaconAlertCopyWith<_$_BeaconAlert> get copyWith =>
      __$$_BeaconAlertCopyWithImpl<_$_BeaconAlert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DtID dataTracID) displaySensor,
    required TResult Function(IBeacon beacon) beaconAlert,
  }) {
    return beaconAlert(beacon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DtID dataTracID)? displaySensor,
    TResult? Function(IBeacon beacon)? beaconAlert,
  }) {
    return beaconAlert?.call(beacon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DtID dataTracID)? displaySensor,
    TResult Function(IBeacon beacon)? beaconAlert,
    required TResult orElse(),
  }) {
    if (beaconAlert != null) {
      return beaconAlert(beacon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DisplaySensor value) displaySensor,
    required TResult Function(_BeaconAlert value) beaconAlert,
  }) {
    return beaconAlert(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DisplaySensor value)? displaySensor,
    TResult? Function(_BeaconAlert value)? beaconAlert,
  }) {
    return beaconAlert?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DisplaySensor value)? displaySensor,
    TResult Function(_BeaconAlert value)? beaconAlert,
    required TResult orElse(),
  }) {
    if (beaconAlert != null) {
      return beaconAlert(this);
    }
    return orElse();
  }
}

abstract class _BeaconAlert implements SensordetailsEvent {
  factory _BeaconAlert({required final IBeacon beacon}) = _$_BeaconAlert;

  IBeacon get beacon;
  @JsonKey(ignore: true)
  _$$_BeaconAlertCopyWith<_$_BeaconAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SensordetailsState {
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Sensor get sensor => throw _privateConstructorUsedError;
  Distance get distance => throw _privateConstructorUsedError;
  int get rotationalFrequency => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  SignalStrength get signalStrength => throw _privateConstructorUsedError;
  int get rotationalAngle => throw _privateConstructorUsedError;
  String get standardBeaconHex => throw _privateConstructorUsedError;
  String get vehicleBeaconHex => throw _privateConstructorUsedError;
  String get vinBeaconHex => throw _privateConstructorUsedError;
  String get licensePlateBeaconHex => throw _privateConstructorUsedError;
  Option<Either<ProgrammedDataTracFailure, Unit>>
      get saveFailureOrSuccessOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SensordetailsStateCopyWith<SensordetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensordetailsStateCopyWith<$Res> {
  factory $SensordetailsStateCopyWith(
          SensordetailsState value, $Res Function(SensordetailsState) then) =
      _$SensordetailsStateCopyWithImpl<$Res, SensordetailsState>;
  @useResult
  $Res call(
      {bool showErrorMessages,
      bool isLoading,
      Sensor sensor,
      Distance distance,
      int rotationalFrequency,
      double speed,
      SignalStrength signalStrength,
      int rotationalAngle,
      String standardBeaconHex,
      String vehicleBeaconHex,
      String vinBeaconHex,
      String licensePlateBeaconHex,
      Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption});

  $SensorCopyWith<$Res> get sensor;
  $DistanceCopyWith<$Res> get distance;
}

/// @nodoc
class _$SensordetailsStateCopyWithImpl<$Res, $Val extends SensordetailsState>
    implements $SensordetailsStateCopyWith<$Res> {
  _$SensordetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? sensor = null,
    Object? distance = null,
    Object? rotationalFrequency = null,
    Object? speed = null,
    Object? signalStrength = null,
    Object? rotationalAngle = null,
    Object? standardBeaconHex = null,
    Object? vehicleBeaconHex = null,
    Object? vinBeaconHex = null,
    Object? licensePlateBeaconHex = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as Sensor,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance,
      rotationalFrequency: null == rotationalFrequency
          ? _value.rotationalFrequency
          : rotationalFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      signalStrength: null == signalStrength
          ? _value.signalStrength
          : signalStrength // ignore: cast_nullable_to_non_nullable
              as SignalStrength,
      rotationalAngle: null == rotationalAngle
          ? _value.rotationalAngle
          : rotationalAngle // ignore: cast_nullable_to_non_nullable
              as int,
      standardBeaconHex: null == standardBeaconHex
          ? _value.standardBeaconHex
          : standardBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleBeaconHex: null == vehicleBeaconHex
          ? _value.vehicleBeaconHex
          : vehicleBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      vinBeaconHex: null == vinBeaconHex
          ? _value.vinBeaconHex
          : vinBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlateBeaconHex: null == licensePlateBeaconHex
          ? _value.licensePlateBeaconHex
          : licensePlateBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProgrammedDataTracFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SensorCopyWith<$Res> get sensor {
    return $SensorCopyWith<$Res>(_value.sensor, (value) {
      return _then(_value.copyWith(sensor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DistanceCopyWith<$Res> get distance {
    return $DistanceCopyWith<$Res>(_value.distance, (value) {
      return _then(_value.copyWith(distance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SensordetailsStateCopyWith<$Res>
    implements $SensordetailsStateCopyWith<$Res> {
  factory _$$_SensordetailsStateCopyWith(_$_SensordetailsState value,
          $Res Function(_$_SensordetailsState) then) =
      __$$_SensordetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showErrorMessages,
      bool isLoading,
      Sensor sensor,
      Distance distance,
      int rotationalFrequency,
      double speed,
      SignalStrength signalStrength,
      int rotationalAngle,
      String standardBeaconHex,
      String vehicleBeaconHex,
      String vinBeaconHex,
      String licensePlateBeaconHex,
      Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption});

  @override
  $SensorCopyWith<$Res> get sensor;
  @override
  $DistanceCopyWith<$Res> get distance;
}

/// @nodoc
class __$$_SensordetailsStateCopyWithImpl<$Res>
    extends _$SensordetailsStateCopyWithImpl<$Res, _$_SensordetailsState>
    implements _$$_SensordetailsStateCopyWith<$Res> {
  __$$_SensordetailsStateCopyWithImpl(
      _$_SensordetailsState _value, $Res Function(_$_SensordetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showErrorMessages = null,
    Object? isLoading = null,
    Object? sensor = null,
    Object? distance = null,
    Object? rotationalFrequency = null,
    Object? speed = null,
    Object? signalStrength = null,
    Object? rotationalAngle = null,
    Object? standardBeaconHex = null,
    Object? vehicleBeaconHex = null,
    Object? vinBeaconHex = null,
    Object? licensePlateBeaconHex = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_SensordetailsState(
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as Sensor,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance,
      rotationalFrequency: null == rotationalFrequency
          ? _value.rotationalFrequency
          : rotationalFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      signalStrength: null == signalStrength
          ? _value.signalStrength
          : signalStrength // ignore: cast_nullable_to_non_nullable
              as SignalStrength,
      rotationalAngle: null == rotationalAngle
          ? _value.rotationalAngle
          : rotationalAngle // ignore: cast_nullable_to_non_nullable
              as int,
      standardBeaconHex: null == standardBeaconHex
          ? _value.standardBeaconHex
          : standardBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleBeaconHex: null == vehicleBeaconHex
          ? _value.vehicleBeaconHex
          : vehicleBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      vinBeaconHex: null == vinBeaconHex
          ? _value.vinBeaconHex
          : vinBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlateBeaconHex: null == licensePlateBeaconHex
          ? _value.licensePlateBeaconHex
          : licensePlateBeaconHex // ignore: cast_nullable_to_non_nullable
              as String,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ProgrammedDataTracFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_SensordetailsState implements _SensordetailsState {
  const _$_SensordetailsState(
      {required this.showErrorMessages,
      required this.isLoading,
      required this.sensor,
      required this.distance,
      required this.rotationalFrequency,
      required this.speed,
      required this.signalStrength,
      required this.rotationalAngle,
      required this.standardBeaconHex,
      required this.vehicleBeaconHex,
      required this.vinBeaconHex,
      required this.licensePlateBeaconHex,
      required this.saveFailureOrSuccessOption});

  @override
  final bool showErrorMessages;
  @override
  final bool isLoading;
  @override
  final Sensor sensor;
  @override
  final Distance distance;
  @override
  final int rotationalFrequency;
  @override
  final double speed;
  @override
  final SignalStrength signalStrength;
  @override
  final int rotationalAngle;
  @override
  final String standardBeaconHex;
  @override
  final String vehicleBeaconHex;
  @override
  final String vinBeaconHex;
  @override
  final String licensePlateBeaconHex;
  @override
  final Option<Either<ProgrammedDataTracFailure, Unit>>
      saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'SensordetailsState(showErrorMessages: $showErrorMessages, isLoading: $isLoading, sensor: $sensor, distance: $distance, rotationalFrequency: $rotationalFrequency, speed: $speed, signalStrength: $signalStrength, rotationalAngle: $rotationalAngle, standardBeaconHex: $standardBeaconHex, vehicleBeaconHex: $vehicleBeaconHex, vinBeaconHex: $vinBeaconHex, licensePlateBeaconHex: $licensePlateBeaconHex, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SensordetailsState &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.sensor, sensor) || other.sensor == sensor) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.rotationalFrequency, rotationalFrequency) ||
                other.rotationalFrequency == rotationalFrequency) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.signalStrength, signalStrength) ||
                other.signalStrength == signalStrength) &&
            (identical(other.rotationalAngle, rotationalAngle) ||
                other.rotationalAngle == rotationalAngle) &&
            (identical(other.standardBeaconHex, standardBeaconHex) ||
                other.standardBeaconHex == standardBeaconHex) &&
            (identical(other.vehicleBeaconHex, vehicleBeaconHex) ||
                other.vehicleBeaconHex == vehicleBeaconHex) &&
            (identical(other.vinBeaconHex, vinBeaconHex) ||
                other.vinBeaconHex == vinBeaconHex) &&
            (identical(other.licensePlateBeaconHex, licensePlateBeaconHex) ||
                other.licensePlateBeaconHex == licensePlateBeaconHex) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      showErrorMessages,
      isLoading,
      sensor,
      distance,
      rotationalFrequency,
      speed,
      signalStrength,
      rotationalAngle,
      standardBeaconHex,
      vehicleBeaconHex,
      vinBeaconHex,
      licensePlateBeaconHex,
      saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SensordetailsStateCopyWith<_$_SensordetailsState> get copyWith =>
      __$$_SensordetailsStateCopyWithImpl<_$_SensordetailsState>(
          this, _$identity);
}

abstract class _SensordetailsState implements SensordetailsState {
  const factory _SensordetailsState(
      {required final bool showErrorMessages,
      required final bool isLoading,
      required final Sensor sensor,
      required final Distance distance,
      required final int rotationalFrequency,
      required final double speed,
      required final SignalStrength signalStrength,
      required final int rotationalAngle,
      required final String standardBeaconHex,
      required final String vehicleBeaconHex,
      required final String vinBeaconHex,
      required final String licensePlateBeaconHex,
      required final Option<Either<ProgrammedDataTracFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_SensordetailsState;

  @override
  bool get showErrorMessages;
  @override
  bool get isLoading;
  @override
  Sensor get sensor;
  @override
  Distance get distance;
  @override
  int get rotationalFrequency;
  @override
  double get speed;
  @override
  SignalStrength get signalStrength;
  @override
  int get rotationalAngle;
  @override
  String get standardBeaconHex;
  @override
  String get vehicleBeaconHex;
  @override
  String get vinBeaconHex;
  @override
  String get licensePlateBeaconHex;
  @override
  Option<Either<ProgrammedDataTracFailure, Unit>>
      get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SensordetailsStateCopyWith<_$_SensordetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

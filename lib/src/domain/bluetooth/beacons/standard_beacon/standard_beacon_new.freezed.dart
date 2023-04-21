// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'standard_beacon_new.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StandardBeaconNew {
  String get hexValue => throw _privateConstructorUsedError;
  int get manufacturerId => throw _privateConstructorUsedError;
  DtID get dtId => throw _privateConstructorUsedError;
  BeaconType get beaconType => throw _privateConstructorUsedError;
  bool get vehicleBeaconEnabled => throw _privateConstructorUsedError;
  bool get licensePlateBeaconEnabled => throw _privateConstructorUsedError;
  bool get vinBeaconEnabled => throw _privateConstructorUsedError;
  MTModelAndFuel get mtModelAndFuel => throw _privateConstructorUsedError;
  MTSensor get mtSensor => throw _privateConstructorUsedError;
  MTSite get mtSite => throw _privateConstructorUsedError;
  MTDistance get mtDistance => throw _privateConstructorUsedError;
  int get directionOfRotation => throw _privateConstructorUsedError;
  int get companyId =>
      throw _privateConstructorUsedError; // This denotes the company ID that is eligible to program this device - part of the security solution.
  int get motionBit =>
      throw _privateConstructorUsedError; // Real time data. Not stored in SQLlite db
  bool get dirValid =>
      throw _privateConstructorUsedError; // Real time data. Not stored in SQLlite db
  int get rotationalAngle => throw _privateConstructorUsedError;
  int get rotationalFrequency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StandardBeaconNewCopyWith<StandardBeaconNew> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandardBeaconNewCopyWith<$Res> {
  factory $StandardBeaconNewCopyWith(
          StandardBeaconNew value, $Res Function(StandardBeaconNew) then) =
      _$StandardBeaconNewCopyWithImpl<$Res>;
  $Res call(
      {String hexValue,
      int manufacturerId,
      DtID dtId,
      BeaconType beaconType,
      bool vehicleBeaconEnabled,
      bool licensePlateBeaconEnabled,
      bool vinBeaconEnabled,
      MTModelAndFuel mtModelAndFuel,
      MTSensor mtSensor,
      MTSite mtSite,
      MTDistance mtDistance,
      int directionOfRotation,
      int companyId,
      int motionBit,
      bool dirValid,
      int rotationalAngle,
      int rotationalFrequency});

  $MTModelAndFuelCopyWith<$Res> get mtModelAndFuel;
  $MTSensorCopyWith<$Res> get mtSensor;
  $MTSiteCopyWith<$Res> get mtSite;
  $MTDistanceCopyWith<$Res> get mtDistance;
}

/// @nodoc
class _$StandardBeaconNewCopyWithImpl<$Res>
    implements $StandardBeaconNewCopyWith<$Res> {
  _$StandardBeaconNewCopyWithImpl(this._value, this._then);

  final StandardBeaconNew _value;
  // ignore: unused_field
  final $Res Function(StandardBeaconNew) _then;

  @override
  $Res call({
    Object? hexValue = freezed,
    Object? manufacturerId = freezed,
    Object? dtId = freezed,
    Object? beaconType = freezed,
    Object? vehicleBeaconEnabled = freezed,
    Object? licensePlateBeaconEnabled = freezed,
    Object? vinBeaconEnabled = freezed,
    Object? mtModelAndFuel = freezed,
    Object? mtSensor = freezed,
    Object? mtSite = freezed,
    Object? mtDistance = freezed,
    Object? directionOfRotation = freezed,
    Object? companyId = freezed,
    Object? motionBit = freezed,
    Object? dirValid = freezed,
    Object? rotationalAngle = freezed,
    Object? rotationalFrequency = freezed,
  }) {
    return _then(_value.copyWith(
      hexValue: hexValue == freezed
          ? _value.hexValue
          : hexValue // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturerId: manufacturerId == freezed
          ? _value.manufacturerId
          : manufacturerId // ignore: cast_nullable_to_non_nullable
              as int,
      dtId: dtId == freezed
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as DtID,
      beaconType: beaconType == freezed
          ? _value.beaconType
          : beaconType // ignore: cast_nullable_to_non_nullable
              as BeaconType,
      vehicleBeaconEnabled: vehicleBeaconEnabled == freezed
          ? _value.vehicleBeaconEnabled
          : vehicleBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      licensePlateBeaconEnabled: licensePlateBeaconEnabled == freezed
          ? _value.licensePlateBeaconEnabled
          : licensePlateBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vinBeaconEnabled: vinBeaconEnabled == freezed
          ? _value.vinBeaconEnabled
          : vinBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      mtModelAndFuel: mtModelAndFuel == freezed
          ? _value.mtModelAndFuel
          : mtModelAndFuel // ignore: cast_nullable_to_non_nullable
              as MTModelAndFuel,
      mtSensor: mtSensor == freezed
          ? _value.mtSensor
          : mtSensor // ignore: cast_nullable_to_non_nullable
              as MTSensor,
      mtSite: mtSite == freezed
          ? _value.mtSite
          : mtSite // ignore: cast_nullable_to_non_nullable
              as MTSite,
      mtDistance: mtDistance == freezed
          ? _value.mtDistance
          : mtDistance // ignore: cast_nullable_to_non_nullable
              as MTDistance,
      directionOfRotation: directionOfRotation == freezed
          ? _value.directionOfRotation
          : directionOfRotation // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      motionBit: motionBit == freezed
          ? _value.motionBit
          : motionBit // ignore: cast_nullable_to_non_nullable
              as int,
      dirValid: dirValid == freezed
          ? _value.dirValid
          : dirValid // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationalAngle: rotationalAngle == freezed
          ? _value.rotationalAngle
          : rotationalAngle // ignore: cast_nullable_to_non_nullable
              as int,
      rotationalFrequency: rotationalFrequency == freezed
          ? _value.rotationalFrequency
          : rotationalFrequency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $MTModelAndFuelCopyWith<$Res> get mtModelAndFuel {
    return $MTModelAndFuelCopyWith<$Res>(_value.mtModelAndFuel, (value) {
      return _then(_value.copyWith(mtModelAndFuel: value));
    });
  }

  @override
  $MTSensorCopyWith<$Res> get mtSensor {
    return $MTSensorCopyWith<$Res>(_value.mtSensor, (value) {
      return _then(_value.copyWith(mtSensor: value));
    });
  }

  @override
  $MTSiteCopyWith<$Res> get mtSite {
    return $MTSiteCopyWith<$Res>(_value.mtSite, (value) {
      return _then(_value.copyWith(mtSite: value));
    });
  }

  @override
  $MTDistanceCopyWith<$Res> get mtDistance {
    return $MTDistanceCopyWith<$Res>(_value.mtDistance, (value) {
      return _then(_value.copyWith(mtDistance: value));
    });
  }
}

/// @nodoc
abstract class _$$_StandardBeaconNewCopyWith<$Res>
    implements $StandardBeaconNewCopyWith<$Res> {
  factory _$$_StandardBeaconNewCopyWith(_$_StandardBeaconNew value,
          $Res Function(_$_StandardBeaconNew) then) =
      __$$_StandardBeaconNewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String hexValue,
      int manufacturerId,
      DtID dtId,
      BeaconType beaconType,
      bool vehicleBeaconEnabled,
      bool licensePlateBeaconEnabled,
      bool vinBeaconEnabled,
      MTModelAndFuel mtModelAndFuel,
      MTSensor mtSensor,
      MTSite mtSite,
      MTDistance mtDistance,
      int directionOfRotation,
      int companyId,
      int motionBit,
      bool dirValid,
      int rotationalAngle,
      int rotationalFrequency});

  @override
  $MTModelAndFuelCopyWith<$Res> get mtModelAndFuel;
  @override
  $MTSensorCopyWith<$Res> get mtSensor;
  @override
  $MTSiteCopyWith<$Res> get mtSite;
  @override
  $MTDistanceCopyWith<$Res> get mtDistance;
}

/// @nodoc
class __$$_StandardBeaconNewCopyWithImpl<$Res>
    extends _$StandardBeaconNewCopyWithImpl<$Res>
    implements _$$_StandardBeaconNewCopyWith<$Res> {
  __$$_StandardBeaconNewCopyWithImpl(
      _$_StandardBeaconNew _value, $Res Function(_$_StandardBeaconNew) _then)
      : super(_value, (v) => _then(v as _$_StandardBeaconNew));

  @override
  _$_StandardBeaconNew get _value => super._value as _$_StandardBeaconNew;

  @override
  $Res call({
    Object? hexValue = freezed,
    Object? manufacturerId = freezed,
    Object? dtId = freezed,
    Object? beaconType = freezed,
    Object? vehicleBeaconEnabled = freezed,
    Object? licensePlateBeaconEnabled = freezed,
    Object? vinBeaconEnabled = freezed,
    Object? mtModelAndFuel = freezed,
    Object? mtSensor = freezed,
    Object? mtSite = freezed,
    Object? mtDistance = freezed,
    Object? directionOfRotation = freezed,
    Object? companyId = freezed,
    Object? motionBit = freezed,
    Object? dirValid = freezed,
    Object? rotationalAngle = freezed,
    Object? rotationalFrequency = freezed,
  }) {
    return _then(_$_StandardBeaconNew(
      hexValue: hexValue == freezed
          ? _value.hexValue
          : hexValue // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturerId: manufacturerId == freezed
          ? _value.manufacturerId
          : manufacturerId // ignore: cast_nullable_to_non_nullable
              as int,
      dtId: dtId == freezed
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as DtID,
      beaconType: beaconType == freezed
          ? _value.beaconType
          : beaconType // ignore: cast_nullable_to_non_nullable
              as BeaconType,
      vehicleBeaconEnabled: vehicleBeaconEnabled == freezed
          ? _value.vehicleBeaconEnabled
          : vehicleBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      licensePlateBeaconEnabled: licensePlateBeaconEnabled == freezed
          ? _value.licensePlateBeaconEnabled
          : licensePlateBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vinBeaconEnabled: vinBeaconEnabled == freezed
          ? _value.vinBeaconEnabled
          : vinBeaconEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      mtModelAndFuel: mtModelAndFuel == freezed
          ? _value.mtModelAndFuel
          : mtModelAndFuel // ignore: cast_nullable_to_non_nullable
              as MTModelAndFuel,
      mtSensor: mtSensor == freezed
          ? _value.mtSensor
          : mtSensor // ignore: cast_nullable_to_non_nullable
              as MTSensor,
      mtSite: mtSite == freezed
          ? _value.mtSite
          : mtSite // ignore: cast_nullable_to_non_nullable
              as MTSite,
      mtDistance: mtDistance == freezed
          ? _value.mtDistance
          : mtDistance // ignore: cast_nullable_to_non_nullable
              as MTDistance,
      directionOfRotation: directionOfRotation == freezed
          ? _value.directionOfRotation
          : directionOfRotation // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      motionBit: motionBit == freezed
          ? _value.motionBit
          : motionBit // ignore: cast_nullable_to_non_nullable
              as int,
      dirValid: dirValid == freezed
          ? _value.dirValid
          : dirValid // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationalAngle: rotationalAngle == freezed
          ? _value.rotationalAngle
          : rotationalAngle // ignore: cast_nullable_to_non_nullable
              as int,
      rotationalFrequency: rotationalFrequency == freezed
          ? _value.rotationalFrequency
          : rotationalFrequency // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StandardBeaconNew extends _StandardBeaconNew {
  const _$_StandardBeaconNew(
      {required this.hexValue,
      required this.manufacturerId,
      required this.dtId,
      required this.beaconType,
      required this.vehicleBeaconEnabled,
      required this.licensePlateBeaconEnabled,
      required this.vinBeaconEnabled,
      required this.mtModelAndFuel,
      required this.mtSensor,
      required this.mtSite,
      required this.mtDistance,
      required this.directionOfRotation,
      required this.companyId,
      required this.motionBit,
      required this.dirValid,
      required this.rotationalAngle,
      required this.rotationalFrequency})
      : super._();

  @override
  final String hexValue;
  @override
  final int manufacturerId;
  @override
  final DtID dtId;
  @override
  final BeaconType beaconType;
  @override
  final bool vehicleBeaconEnabled;
  @override
  final bool licensePlateBeaconEnabled;
  @override
  final bool vinBeaconEnabled;
  @override
  final MTModelAndFuel mtModelAndFuel;
  @override
  final MTSensor mtSensor;
  @override
  final MTSite mtSite;
  @override
  final MTDistance mtDistance;
  @override
  final int directionOfRotation;
  @override
  final int companyId;
// This denotes the company ID that is eligible to program this device - part of the security solution.
  @override
  final int motionBit;
// Real time data. Not stored in SQLlite db
  @override
  final bool dirValid;
// Real time data. Not stored in SQLlite db
  @override
  final int rotationalAngle;
  @override
  final int rotationalFrequency;

  @override
  String toString() {
    return 'StandardBeaconNew(hexValue: $hexValue, manufacturerId: $manufacturerId, dtId: $dtId, beaconType: $beaconType, vehicleBeaconEnabled: $vehicleBeaconEnabled, licensePlateBeaconEnabled: $licensePlateBeaconEnabled, vinBeaconEnabled: $vinBeaconEnabled, mtModelAndFuel: $mtModelAndFuel, mtSensor: $mtSensor, mtSite: $mtSite, mtDistance: $mtDistance, directionOfRotation: $directionOfRotation, companyId: $companyId, motionBit: $motionBit, dirValid: $dirValid, rotationalAngle: $rotationalAngle, rotationalFrequency: $rotationalFrequency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StandardBeaconNew &&
            const DeepCollectionEquality().equals(other.hexValue, hexValue) &&
            const DeepCollectionEquality()
                .equals(other.manufacturerId, manufacturerId) &&
            const DeepCollectionEquality().equals(other.dtId, dtId) &&
            const DeepCollectionEquality()
                .equals(other.beaconType, beaconType) &&
            const DeepCollectionEquality()
                .equals(other.vehicleBeaconEnabled, vehicleBeaconEnabled) &&
            const DeepCollectionEquality().equals(
                other.licensePlateBeaconEnabled, licensePlateBeaconEnabled) &&
            const DeepCollectionEquality()
                .equals(other.vinBeaconEnabled, vinBeaconEnabled) &&
            const DeepCollectionEquality()
                .equals(other.mtModelAndFuel, mtModelAndFuel) &&
            const DeepCollectionEquality().equals(other.mtSensor, mtSensor) &&
            const DeepCollectionEquality().equals(other.mtSite, mtSite) &&
            const DeepCollectionEquality()
                .equals(other.mtDistance, mtDistance) &&
            const DeepCollectionEquality()
                .equals(other.directionOfRotation, directionOfRotation) &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality().equals(other.motionBit, motionBit) &&
            const DeepCollectionEquality().equals(other.dirValid, dirValid) &&
            const DeepCollectionEquality()
                .equals(other.rotationalAngle, rotationalAngle) &&
            const DeepCollectionEquality()
                .equals(other.rotationalFrequency, rotationalFrequency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hexValue),
      const DeepCollectionEquality().hash(manufacturerId),
      const DeepCollectionEquality().hash(dtId),
      const DeepCollectionEquality().hash(beaconType),
      const DeepCollectionEquality().hash(vehicleBeaconEnabled),
      const DeepCollectionEquality().hash(licensePlateBeaconEnabled),
      const DeepCollectionEquality().hash(vinBeaconEnabled),
      const DeepCollectionEquality().hash(mtModelAndFuel),
      const DeepCollectionEquality().hash(mtSensor),
      const DeepCollectionEquality().hash(mtSite),
      const DeepCollectionEquality().hash(mtDistance),
      const DeepCollectionEquality().hash(directionOfRotation),
      const DeepCollectionEquality().hash(companyId),
      const DeepCollectionEquality().hash(motionBit),
      const DeepCollectionEquality().hash(dirValid),
      const DeepCollectionEquality().hash(rotationalAngle),
      const DeepCollectionEquality().hash(rotationalFrequency));

  @JsonKey(ignore: true)
  @override
  _$$_StandardBeaconNewCopyWith<_$_StandardBeaconNew> get copyWith =>
      __$$_StandardBeaconNewCopyWithImpl<_$_StandardBeaconNew>(
          this, _$identity);
}

abstract class _StandardBeaconNew extends StandardBeaconNew {
  const factory _StandardBeaconNew(
      {required final String hexValue,
      required final int manufacturerId,
      required final DtID dtId,
      required final BeaconType beaconType,
      required final bool vehicleBeaconEnabled,
      required final bool licensePlateBeaconEnabled,
      required final bool vinBeaconEnabled,
      required final MTModelAndFuel mtModelAndFuel,
      required final MTSensor mtSensor,
      required final MTSite mtSite,
      required final MTDistance mtDistance,
      required final int directionOfRotation,
      required final int companyId,
      required final int motionBit,
      required final bool dirValid,
      required final int rotationalAngle,
      required final int rotationalFrequency}) = _$_StandardBeaconNew;
  const _StandardBeaconNew._() : super._();

  @override
  String get hexValue;
  @override
  int get manufacturerId;
  @override
  DtID get dtId;
  @override
  BeaconType get beaconType;
  @override
  bool get vehicleBeaconEnabled;
  @override
  bool get licensePlateBeaconEnabled;
  @override
  bool get vinBeaconEnabled;
  @override
  MTModelAndFuel get mtModelAndFuel;
  @override
  MTSensor get mtSensor;
  @override
  MTSite get mtSite;
  @override
  MTDistance get mtDistance;
  @override
  int get directionOfRotation;
  @override
  int get companyId;
  @override // This denotes the company ID that is eligible to program this device - part of the security solution.
  int get motionBit;
  @override // Real time data. Not stored in SQLlite db
  bool get dirValid;
  @override // Real time data. Not stored in SQLlite db
  int get rotationalAngle;
  @override
  int get rotationalFrequency;
  @override
  @JsonKey(ignore: true)
  _$$_StandardBeaconNewCopyWith<_$_StandardBeaconNew> get copyWith =>
      throw _privateConstructorUsedError;
}

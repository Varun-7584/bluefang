// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_number_beacon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VehicleNumberBeacon {
  String get hexValue => throw _privateConstructorUsedError;
  String get manufacturerId => throw _privateConstructorUsedError;
  DtID get dtId => throw _privateConstructorUsedError;
  BeaconType get beaconType => throw _privateConstructorUsedError;
  String get stringLength => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VehicleNumberBeaconCopyWith<VehicleNumberBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleNumberBeaconCopyWith<$Res> {
  factory $VehicleNumberBeaconCopyWith(
          VehicleNumberBeacon value, $Res Function(VehicleNumberBeacon) then) =
      _$VehicleNumberBeaconCopyWithImpl<$Res, VehicleNumberBeacon>;
  @useResult
  $Res call(
      {String hexValue,
      String manufacturerId,
      DtID dtId,
      BeaconType beaconType,
      String stringLength,
      String vehicleNumber});
}

/// @nodoc
class _$VehicleNumberBeaconCopyWithImpl<$Res, $Val extends VehicleNumberBeacon>
    implements $VehicleNumberBeaconCopyWith<$Res> {
  _$VehicleNumberBeaconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hexValue = null,
    Object? manufacturerId = null,
    Object? dtId = null,
    Object? beaconType = null,
    Object? stringLength = null,
    Object? vehicleNumber = null,
  }) {
    return _then(_value.copyWith(
      hexValue: null == hexValue
          ? _value.hexValue
          : hexValue // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturerId: null == manufacturerId
          ? _value.manufacturerId
          : manufacturerId // ignore: cast_nullable_to_non_nullable
              as String,
      dtId: null == dtId
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as DtID,
      beaconType: null == beaconType
          ? _value.beaconType
          : beaconType // ignore: cast_nullable_to_non_nullable
              as BeaconType,
      stringLength: null == stringLength
          ? _value.stringLength
          : stringLength // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VehicleNumberBeaconCopyWith<$Res>
    implements $VehicleNumberBeaconCopyWith<$Res> {
  factory _$$_VehicleNumberBeaconCopyWith(_$_VehicleNumberBeacon value,
          $Res Function(_$_VehicleNumberBeacon) then) =
      __$$_VehicleNumberBeaconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hexValue,
      String manufacturerId,
      DtID dtId,
      BeaconType beaconType,
      String stringLength,
      String vehicleNumber});
}

/// @nodoc
class __$$_VehicleNumberBeaconCopyWithImpl<$Res>
    extends _$VehicleNumberBeaconCopyWithImpl<$Res, _$_VehicleNumberBeacon>
    implements _$$_VehicleNumberBeaconCopyWith<$Res> {
  __$$_VehicleNumberBeaconCopyWithImpl(_$_VehicleNumberBeacon _value,
      $Res Function(_$_VehicleNumberBeacon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hexValue = null,
    Object? manufacturerId = null,
    Object? dtId = null,
    Object? beaconType = null,
    Object? stringLength = null,
    Object? vehicleNumber = null,
  }) {
    return _then(_$_VehicleNumberBeacon(
      hexValue: null == hexValue
          ? _value.hexValue
          : hexValue // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturerId: null == manufacturerId
          ? _value.manufacturerId
          : manufacturerId // ignore: cast_nullable_to_non_nullable
              as String,
      dtId: null == dtId
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as DtID,
      beaconType: null == beaconType
          ? _value.beaconType
          : beaconType // ignore: cast_nullable_to_non_nullable
              as BeaconType,
      stringLength: null == stringLength
          ? _value.stringLength
          : stringLength // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VehicleNumberBeacon extends _VehicleNumberBeacon {
  _$_VehicleNumberBeacon(
      {required this.hexValue,
      required this.manufacturerId,
      required this.dtId,
      required this.beaconType,
      required this.stringLength,
      required this.vehicleNumber})
      : super._();

  @override
  final String hexValue;
  @override
  final String manufacturerId;
  @override
  final DtID dtId;
  @override
  final BeaconType beaconType;
  @override
  final String stringLength;
  @override
  final String vehicleNumber;

  @override
  String toString() {
    return 'VehicleNumberBeacon(hexValue: $hexValue, manufacturerId: $manufacturerId, dtId: $dtId, beaconType: $beaconType, stringLength: $stringLength, vehicleNumber: $vehicleNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleNumberBeacon &&
            (identical(other.hexValue, hexValue) ||
                other.hexValue == hexValue) &&
            (identical(other.manufacturerId, manufacturerId) ||
                other.manufacturerId == manufacturerId) &&
            (identical(other.dtId, dtId) || other.dtId == dtId) &&
            (identical(other.beaconType, beaconType) ||
                other.beaconType == beaconType) &&
            (identical(other.stringLength, stringLength) ||
                other.stringLength == stringLength) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hexValue, manufacturerId, dtId,
      beaconType, stringLength, vehicleNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleNumberBeaconCopyWith<_$_VehicleNumberBeacon> get copyWith =>
      __$$_VehicleNumberBeaconCopyWithImpl<_$_VehicleNumberBeacon>(
          this, _$identity);
}

abstract class _VehicleNumberBeacon extends VehicleNumberBeacon {
  factory _VehicleNumberBeacon(
      {required final String hexValue,
      required final String manufacturerId,
      required final DtID dtId,
      required final BeaconType beaconType,
      required final String stringLength,
      required final String vehicleNumber}) = _$_VehicleNumberBeacon;
  _VehicleNumberBeacon._() : super._();

  @override
  String get hexValue;
  @override
  String get manufacturerId;
  @override
  DtID get dtId;
  @override
  BeaconType get beaconType;
  @override
  String get stringLength;
  @override
  String get vehicleNumber;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleNumberBeaconCopyWith<_$_VehicleNumberBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

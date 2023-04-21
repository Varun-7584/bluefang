// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BFBluetoothScanResult {
  BFBluetoothDevice get device => throw _privateConstructorUsedError;
  BFAdvertisementData get advertisementData =>
      throw _privateConstructorUsedError;
  int get rssi => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BFBluetoothScanResultCopyWith<BFBluetoothScanResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BFBluetoothScanResultCopyWith<$Res> {
  factory $BFBluetoothScanResultCopyWith(BFBluetoothScanResult value,
          $Res Function(BFBluetoothScanResult) then) =
      _$BFBluetoothScanResultCopyWithImpl<$Res, BFBluetoothScanResult>;
  @useResult
  $Res call(
      {BFBluetoothDevice device,
      BFAdvertisementData advertisementData,
      int rssi});

  $BFBluetoothDeviceCopyWith<$Res> get device;
  $BFAdvertisementDataCopyWith<$Res> get advertisementData;
}

/// @nodoc
class _$BFBluetoothScanResultCopyWithImpl<$Res,
        $Val extends BFBluetoothScanResult>
    implements $BFBluetoothScanResultCopyWith<$Res> {
  _$BFBluetoothScanResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? advertisementData = null,
    Object? rssi = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BFBluetoothDevice,
      advertisementData: null == advertisementData
          ? _value.advertisementData
          : advertisementData // ignore: cast_nullable_to_non_nullable
              as BFAdvertisementData,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BFBluetoothDeviceCopyWith<$Res> get device {
    return $BFBluetoothDeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BFAdvertisementDataCopyWith<$Res> get advertisementData {
    return $BFAdvertisementDataCopyWith<$Res>(_value.advertisementData,
        (value) {
      return _then(_value.copyWith(advertisementData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BFBluetoothScanResultCopyWith<$Res>
    implements $BFBluetoothScanResultCopyWith<$Res> {
  factory _$$_BFBluetoothScanResultCopyWith(_$_BFBluetoothScanResult value,
          $Res Function(_$_BFBluetoothScanResult) then) =
      __$$_BFBluetoothScanResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BFBluetoothDevice device,
      BFAdvertisementData advertisementData,
      int rssi});

  @override
  $BFBluetoothDeviceCopyWith<$Res> get device;
  @override
  $BFAdvertisementDataCopyWith<$Res> get advertisementData;
}

/// @nodoc
class __$$_BFBluetoothScanResultCopyWithImpl<$Res>
    extends _$BFBluetoothScanResultCopyWithImpl<$Res, _$_BFBluetoothScanResult>
    implements _$$_BFBluetoothScanResultCopyWith<$Res> {
  __$$_BFBluetoothScanResultCopyWithImpl(_$_BFBluetoothScanResult _value,
      $Res Function(_$_BFBluetoothScanResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? advertisementData = null,
    Object? rssi = null,
  }) {
    return _then(_$_BFBluetoothScanResult(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BFBluetoothDevice,
      advertisementData: null == advertisementData
          ? _value.advertisementData
          : advertisementData // ignore: cast_nullable_to_non_nullable
              as BFAdvertisementData,
      rssi: null == rssi
          ? _value.rssi
          : rssi // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BFBluetoothScanResult extends _BFBluetoothScanResult {
  const _$_BFBluetoothScanResult(
      {required this.device,
      required this.advertisementData,
      required this.rssi})
      : super._();

  @override
  final BFBluetoothDevice device;
  @override
  final BFAdvertisementData advertisementData;
  @override
  final int rssi;

  @override
  String toString() {
    return 'BFBluetoothScanResult(device: $device, advertisementData: $advertisementData, rssi: $rssi)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BFBluetoothScanResult &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.advertisementData, advertisementData) ||
                other.advertisementData == advertisementData) &&
            (identical(other.rssi, rssi) || other.rssi == rssi));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, advertisementData, rssi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BFBluetoothScanResultCopyWith<_$_BFBluetoothScanResult> get copyWith =>
      __$$_BFBluetoothScanResultCopyWithImpl<_$_BFBluetoothScanResult>(
          this, _$identity);
}

abstract class _BFBluetoothScanResult extends BFBluetoothScanResult {
  const factory _BFBluetoothScanResult(
      {required final BFBluetoothDevice device,
      required final BFAdvertisementData advertisementData,
      required final int rssi}) = _$_BFBluetoothScanResult;
  const _BFBluetoothScanResult._() : super._();

  @override
  BFBluetoothDevice get device;
  @override
  BFAdvertisementData get advertisementData;
  @override
  int get rssi;
  @override
  @JsonKey(ignore: true)
  _$$_BFBluetoothScanResultCopyWith<_$_BFBluetoothScanResult> get copyWith =>
      throw _privateConstructorUsedError;
}

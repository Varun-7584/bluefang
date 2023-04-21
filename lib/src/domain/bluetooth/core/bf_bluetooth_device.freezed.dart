// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bf_bluetooth_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BFBluetoothDevice {
  BFDeviceIdentifier get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BFBluetoothDeviceCopyWith<BFBluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BFBluetoothDeviceCopyWith<$Res> {
  factory $BFBluetoothDeviceCopyWith(
          BFBluetoothDevice value, $Res Function(BFBluetoothDevice) then) =
      _$BFBluetoothDeviceCopyWithImpl<$Res, BFBluetoothDevice>;
  @useResult
  $Res call({BFDeviceIdentifier id, String name});
}

/// @nodoc
class _$BFBluetoothDeviceCopyWithImpl<$Res, $Val extends BFBluetoothDevice>
    implements $BFBluetoothDeviceCopyWith<$Res> {
  _$BFBluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BFDeviceIdentifier,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BFBluetoothDeviceCopyWith<$Res>
    implements $BFBluetoothDeviceCopyWith<$Res> {
  factory _$$_BFBluetoothDeviceCopyWith(_$_BFBluetoothDevice value,
          $Res Function(_$_BFBluetoothDevice) then) =
      __$$_BFBluetoothDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BFDeviceIdentifier id, String name});
}

/// @nodoc
class __$$_BFBluetoothDeviceCopyWithImpl<$Res>
    extends _$BFBluetoothDeviceCopyWithImpl<$Res, _$_BFBluetoothDevice>
    implements _$$_BFBluetoothDeviceCopyWith<$Res> {
  __$$_BFBluetoothDeviceCopyWithImpl(
      _$_BFBluetoothDevice _value, $Res Function(_$_BFBluetoothDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_BFBluetoothDevice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BFDeviceIdentifier,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BFBluetoothDevice extends _BFBluetoothDevice {
  const _$_BFBluetoothDevice({required this.id, required this.name})
      : super._();

  @override
  final BFDeviceIdentifier id;
  @override
  final String name;

  @override
  String toString() {
    return 'BFBluetoothDevice(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BFBluetoothDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BFBluetoothDeviceCopyWith<_$_BFBluetoothDevice> get copyWith =>
      __$$_BFBluetoothDeviceCopyWithImpl<_$_BFBluetoothDevice>(
          this, _$identity);
}

abstract class _BFBluetoothDevice extends BFBluetoothDevice {
  const factory _BFBluetoothDevice(
      {required final BFDeviceIdentifier id,
      required final String name}) = _$_BFBluetoothDevice;
  const _BFBluetoothDevice._() : super._();

  @override
  BFDeviceIdentifier get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_BFBluetoothDeviceCopyWith<_$_BFBluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

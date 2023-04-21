// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bf_advertisement_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BFAdvertisementData {
  String get localName => throw _privateConstructorUsedError;
  int? get txPowerLevel => throw _privateConstructorUsedError;
  bool get connectable => throw _privateConstructorUsedError;
  Map<int, List<int>> get manufacturerData =>
      throw _privateConstructorUsedError;
  Map<String, List<int>> get serviceData => throw _privateConstructorUsedError;
  List<String> get serviceUuids => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BFAdvertisementDataCopyWith<BFAdvertisementData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BFAdvertisementDataCopyWith<$Res> {
  factory $BFAdvertisementDataCopyWith(
          BFAdvertisementData value, $Res Function(BFAdvertisementData) then) =
      _$BFAdvertisementDataCopyWithImpl<$Res, BFAdvertisementData>;
  @useResult
  $Res call(
      {String localName,
      int? txPowerLevel,
      bool connectable,
      Map<int, List<int>> manufacturerData,
      Map<String, List<int>> serviceData,
      List<String> serviceUuids});
}

/// @nodoc
class _$BFAdvertisementDataCopyWithImpl<$Res, $Val extends BFAdvertisementData>
    implements $BFAdvertisementDataCopyWith<$Res> {
  _$BFAdvertisementDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localName = null,
    Object? txPowerLevel = freezed,
    Object? connectable = null,
    Object? manufacturerData = null,
    Object? serviceData = null,
    Object? serviceUuids = null,
  }) {
    return _then(_value.copyWith(
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      txPowerLevel: freezed == txPowerLevel
          ? _value.txPowerLevel
          : txPowerLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      connectable: null == connectable
          ? _value.connectable
          : connectable // ignore: cast_nullable_to_non_nullable
              as bool,
      manufacturerData: null == manufacturerData
          ? _value.manufacturerData
          : manufacturerData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<int>>,
      serviceData: null == serviceData
          ? _value.serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
      serviceUuids: null == serviceUuids
          ? _value.serviceUuids
          : serviceUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BFAdvertisementDataCopyWith<$Res>
    implements $BFAdvertisementDataCopyWith<$Res> {
  factory _$$_BFAdvertisementDataCopyWith(_$_BFAdvertisementData value,
          $Res Function(_$_BFAdvertisementData) then) =
      __$$_BFAdvertisementDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localName,
      int? txPowerLevel,
      bool connectable,
      Map<int, List<int>> manufacturerData,
      Map<String, List<int>> serviceData,
      List<String> serviceUuids});
}

/// @nodoc
class __$$_BFAdvertisementDataCopyWithImpl<$Res>
    extends _$BFAdvertisementDataCopyWithImpl<$Res, _$_BFAdvertisementData>
    implements _$$_BFAdvertisementDataCopyWith<$Res> {
  __$$_BFAdvertisementDataCopyWithImpl(_$_BFAdvertisementData _value,
      $Res Function(_$_BFAdvertisementData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localName = null,
    Object? txPowerLevel = freezed,
    Object? connectable = null,
    Object? manufacturerData = null,
    Object? serviceData = null,
    Object? serviceUuids = null,
  }) {
    return _then(_$_BFAdvertisementData(
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      txPowerLevel: freezed == txPowerLevel
          ? _value.txPowerLevel
          : txPowerLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      connectable: null == connectable
          ? _value.connectable
          : connectable // ignore: cast_nullable_to_non_nullable
              as bool,
      manufacturerData: null == manufacturerData
          ? _value._manufacturerData
          : manufacturerData // ignore: cast_nullable_to_non_nullable
              as Map<int, List<int>>,
      serviceData: null == serviceData
          ? _value._serviceData
          : serviceData // ignore: cast_nullable_to_non_nullable
              as Map<String, List<int>>,
      serviceUuids: null == serviceUuids
          ? _value._serviceUuids
          : serviceUuids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_BFAdvertisementData extends _BFAdvertisementData {
  const _$_BFAdvertisementData(
      {required this.localName,
      this.txPowerLevel,
      required this.connectable,
      required final Map<int, List<int>> manufacturerData,
      required final Map<String, List<int>> serviceData,
      required final List<String> serviceUuids})
      : _manufacturerData = manufacturerData,
        _serviceData = serviceData,
        _serviceUuids = serviceUuids,
        super._();

  @override
  final String localName;
  @override
  final int? txPowerLevel;
  @override
  final bool connectable;
  final Map<int, List<int>> _manufacturerData;
  @override
  Map<int, List<int>> get manufacturerData {
    if (_manufacturerData is EqualUnmodifiableMapView) return _manufacturerData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_manufacturerData);
  }

  final Map<String, List<int>> _serviceData;
  @override
  Map<String, List<int>> get serviceData {
    if (_serviceData is EqualUnmodifiableMapView) return _serviceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_serviceData);
  }

  final List<String> _serviceUuids;
  @override
  List<String> get serviceUuids {
    if (_serviceUuids is EqualUnmodifiableListView) return _serviceUuids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceUuids);
  }

  @override
  String toString() {
    return 'BFAdvertisementData(localName: $localName, txPowerLevel: $txPowerLevel, connectable: $connectable, manufacturerData: $manufacturerData, serviceData: $serviceData, serviceUuids: $serviceUuids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BFAdvertisementData &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.txPowerLevel, txPowerLevel) ||
                other.txPowerLevel == txPowerLevel) &&
            (identical(other.connectable, connectable) ||
                other.connectable == connectable) &&
            const DeepCollectionEquality()
                .equals(other._manufacturerData, _manufacturerData) &&
            const DeepCollectionEquality()
                .equals(other._serviceData, _serviceData) &&
            const DeepCollectionEquality()
                .equals(other._serviceUuids, _serviceUuids));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      localName,
      txPowerLevel,
      connectable,
      const DeepCollectionEquality().hash(_manufacturerData),
      const DeepCollectionEquality().hash(_serviceData),
      const DeepCollectionEquality().hash(_serviceUuids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BFAdvertisementDataCopyWith<_$_BFAdvertisementData> get copyWith =>
      __$$_BFAdvertisementDataCopyWithImpl<_$_BFAdvertisementData>(
          this, _$identity);
}

abstract class _BFAdvertisementData extends BFAdvertisementData {
  const factory _BFAdvertisementData(
      {required final String localName,
      final int? txPowerLevel,
      required final bool connectable,
      required final Map<int, List<int>> manufacturerData,
      required final Map<String, List<int>> serviceData,
      required final List<String> serviceUuids}) = _$_BFAdvertisementData;
  const _BFAdvertisementData._() : super._();

  @override
  String get localName;
  @override
  int? get txPowerLevel;
  @override
  bool get connectable;
  @override
  Map<int, List<int>> get manufacturerData;
  @override
  Map<String, List<int>> get serviceData;
  @override
  List<String> get serviceUuids;
  @override
  @JsonKey(ignore: true)
  _$$_BFAdvertisementDataCopyWith<_$_BFAdvertisementData> get copyWith =>
      throw _privateConstructorUsedError;
}

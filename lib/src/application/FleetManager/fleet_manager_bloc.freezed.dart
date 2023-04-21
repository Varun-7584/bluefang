// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fleet_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FleetManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FleetManagerEventCopyWith<$Res> {
  factory $FleetManagerEventCopyWith(
          FleetManagerEvent value, $Res Function(FleetManagerEvent) then) =
      _$FleetManagerEventCopyWithImpl<$Res, FleetManagerEvent>;
}

/// @nodoc
class _$FleetManagerEventCopyWithImpl<$Res, $Val extends FleetManagerEvent>
    implements $FleetManagerEventCopyWith<$Res> {
  _$FleetManagerEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({bool? listForm});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$FleetManagerEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listForm = freezed,
  }) {
    return _then(_$_Started(
      freezed == listForm
          ? _value.listForm
          : listForm // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.listForm);

  @override
  final bool? listForm;

  @override
  String toString() {
    return 'FleetManagerEvent.started(listForm: $listForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.listForm, listForm) ||
                other.listForm == listForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) {
    return started(listForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) {
    return started?.call(listForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(listForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FleetManagerEvent {
  const factory _Started(final bool? listForm) = _$_Started;

  bool? get listForm;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetVehicleListCopyWith<$Res> {
  factory _$$_GetVehicleListCopyWith(
          _$_GetVehicleList value, $Res Function(_$_GetVehicleList) then) =
      __$$_GetVehicleListCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleListSortOrder sortedBy, bool descending, bool listForm});
}

/// @nodoc
class __$$_GetVehicleListCopyWithImpl<$Res>
    extends _$FleetManagerEventCopyWithImpl<$Res, _$_GetVehicleList>
    implements _$$_GetVehicleListCopyWith<$Res> {
  __$$_GetVehicleListCopyWithImpl(
      _$_GetVehicleList _value, $Res Function(_$_GetVehicleList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortedBy = null,
    Object? descending = null,
    Object? listForm = null,
  }) {
    return _then(_$_GetVehicleList(
      sortedBy: null == sortedBy
          ? _value.sortedBy
          : sortedBy // ignore: cast_nullable_to_non_nullable
              as VehicleListSortOrder,
      descending: null == descending
          ? _value.descending
          : descending // ignore: cast_nullable_to_non_nullable
              as bool,
      listForm: null == listForm
          ? _value.listForm
          : listForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetVehicleList implements _GetVehicleList {
  const _$_GetVehicleList(
      {required this.sortedBy,
      required this.descending,
      required this.listForm});

  @override
  final VehicleListSortOrder sortedBy;
  @override
  final bool descending;
  @override
  final bool listForm;

  @override
  String toString() {
    return 'FleetManagerEvent.getVehicleList(sortedBy: $sortedBy, descending: $descending, listForm: $listForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetVehicleList &&
            (identical(other.sortedBy, sortedBy) ||
                other.sortedBy == sortedBy) &&
            (identical(other.descending, descending) ||
                other.descending == descending) &&
            (identical(other.listForm, listForm) ||
                other.listForm == listForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortedBy, descending, listForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetVehicleListCopyWith<_$_GetVehicleList> get copyWith =>
      __$$_GetVehicleListCopyWithImpl<_$_GetVehicleList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) {
    return getVehicleList(sortedBy, descending, listForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) {
    return getVehicleList?.call(sortedBy, descending, listForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (getVehicleList != null) {
      return getVehicleList(sortedBy, descending, listForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) {
    return getVehicleList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) {
    return getVehicleList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (getVehicleList != null) {
      return getVehicleList(this);
    }
    return orElse();
  }
}

abstract class _GetVehicleList implements FleetManagerEvent {
  const factory _GetVehicleList(
      {required final VehicleListSortOrder sortedBy,
      required final bool descending,
      required final bool listForm}) = _$_GetVehicleList;

  VehicleListSortOrder get sortedBy;
  bool get descending;
  bool get listForm;
  @JsonKey(ignore: true)
  _$$_GetVehicleListCopyWith<_$_GetVehicleList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSensorListCopyWith<$Res> {
  factory _$$_GetSensorListCopyWith(
          _$_GetSensorList value, $Res Function(_$_GetSensorList) then) =
      __$$_GetSensorListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetSensorListCopyWithImpl<$Res>
    extends _$FleetManagerEventCopyWithImpl<$Res, _$_GetSensorList>
    implements _$$_GetSensorListCopyWith<$Res> {
  __$$_GetSensorListCopyWithImpl(
      _$_GetSensorList _value, $Res Function(_$_GetSensorList) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetSensorList implements _GetSensorList {
  const _$_GetSensorList();

  @override
  String toString() {
    return 'FleetManagerEvent.getSensorList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetSensorList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) {
    return getSensorList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) {
    return getSensorList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (getSensorList != null) {
      return getSensorList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) {
    return getSensorList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) {
    return getSensorList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (getSensorList != null) {
      return getSensorList(this);
    }
    return orElse();
  }
}

abstract class _GetSensorList implements FleetManagerEvent {
  const factory _GetSensorList() = _$_GetSensorList;
}

/// @nodoc
abstract class _$$_RefreshScreenCopyWith<$Res> {
  factory _$$_RefreshScreenCopyWith(
          _$_RefreshScreen value, $Res Function(_$_RefreshScreen) then) =
      __$$_RefreshScreenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshScreenCopyWithImpl<$Res>
    extends _$FleetManagerEventCopyWithImpl<$Res, _$_RefreshScreen>
    implements _$$_RefreshScreenCopyWith<$Res> {
  __$$_RefreshScreenCopyWithImpl(
      _$_RefreshScreen _value, $Res Function(_$_RefreshScreen) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshScreen implements _RefreshScreen {
  const _$_RefreshScreen();

  @override
  String toString() {
    return 'FleetManagerEvent.refreshScreen()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshScreen);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) {
    return refreshScreen();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) {
    return refreshScreen?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (refreshScreen != null) {
      return refreshScreen();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) {
    return refreshScreen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) {
    return refreshScreen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (refreshScreen != null) {
      return refreshScreen(this);
    }
    return orElse();
  }
}

abstract class _RefreshScreen implements FleetManagerEvent {
  const factory _RefreshScreen() = _$_RefreshScreen;
}

/// @nodoc
abstract class _$$_ChangeVehiclesShownCopyWith<$Res> {
  factory _$$_ChangeVehiclesShownCopyWith(_$_ChangeVehiclesShown value,
          $Res Function(_$_ChangeVehiclesShown) then) =
      __$$_ChangeVehiclesShownCopyWithImpl<$Res>;
  @useResult
  $Res call({bool showInRangeVehicles});
}

/// @nodoc
class __$$_ChangeVehiclesShownCopyWithImpl<$Res>
    extends _$FleetManagerEventCopyWithImpl<$Res, _$_ChangeVehiclesShown>
    implements _$$_ChangeVehiclesShownCopyWith<$Res> {
  __$$_ChangeVehiclesShownCopyWithImpl(_$_ChangeVehiclesShown _value,
      $Res Function(_$_ChangeVehiclesShown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showInRangeVehicles = null,
  }) {
    return _then(_$_ChangeVehiclesShown(
      showInRangeVehicles: null == showInRangeVehicles
          ? _value.showInRangeVehicles
          : showInRangeVehicles // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChangeVehiclesShown implements _ChangeVehiclesShown {
  _$_ChangeVehiclesShown({required this.showInRangeVehicles});

  @override
  final bool showInRangeVehicles;

  @override
  String toString() {
    return 'FleetManagerEvent.changeVehiclesShown(showInRangeVehicles: $showInRangeVehicles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeVehiclesShown &&
            (identical(other.showInRangeVehicles, showInRangeVehicles) ||
                other.showInRangeVehicles == showInRangeVehicles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showInRangeVehicles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeVehiclesShownCopyWith<_$_ChangeVehiclesShown> get copyWith =>
      __$$_ChangeVehiclesShownCopyWithImpl<_$_ChangeVehiclesShown>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? listForm) started,
    required TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)
        getVehicleList,
    required TResult Function() getSensorList,
    required TResult Function() refreshScreen,
    required TResult Function(bool showInRangeVehicles) changeVehiclesShown,
  }) {
    return changeVehiclesShown(showInRangeVehicles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? listForm)? started,
    TResult? Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult? Function()? getSensorList,
    TResult? Function()? refreshScreen,
    TResult? Function(bool showInRangeVehicles)? changeVehiclesShown,
  }) {
    return changeVehiclesShown?.call(showInRangeVehicles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? listForm)? started,
    TResult Function(
            VehicleListSortOrder sortedBy, bool descending, bool listForm)?
        getVehicleList,
    TResult Function()? getSensorList,
    TResult Function()? refreshScreen,
    TResult Function(bool showInRangeVehicles)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (changeVehiclesShown != null) {
      return changeVehiclesShown(showInRangeVehicles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetVehicleList value) getVehicleList,
    required TResult Function(_GetSensorList value) getSensorList,
    required TResult Function(_RefreshScreen value) refreshScreen,
    required TResult Function(_ChangeVehiclesShown value) changeVehiclesShown,
  }) {
    return changeVehiclesShown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetVehicleList value)? getVehicleList,
    TResult? Function(_GetSensorList value)? getSensorList,
    TResult? Function(_RefreshScreen value)? refreshScreen,
    TResult? Function(_ChangeVehiclesShown value)? changeVehiclesShown,
  }) {
    return changeVehiclesShown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetVehicleList value)? getVehicleList,
    TResult Function(_GetSensorList value)? getSensorList,
    TResult Function(_RefreshScreen value)? refreshScreen,
    TResult Function(_ChangeVehiclesShown value)? changeVehiclesShown,
    required TResult orElse(),
  }) {
    if (changeVehiclesShown != null) {
      return changeVehiclesShown(this);
    }
    return orElse();
  }
}

abstract class _ChangeVehiclesShown implements FleetManagerEvent {
  factory _ChangeVehiclesShown({required final bool showInRangeVehicles}) =
      _$_ChangeVehiclesShown;

  bool get showInRangeVehicles;
  @JsonKey(ignore: true)
  _$$_ChangeVehiclesShownCopyWith<_$_ChangeVehiclesShown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FleetManagerState {
  KtMutableList<VehicleInfo> get vehicleList =>
      throw _privateConstructorUsedError;
  KtMutableList<Sensor> get datatracList => throw _privateConstructorUsedError;
  bool get descendingSort => throw _privateConstructorUsedError;
  VehicleListSortOrder get currentSort => throw _privateConstructorUsedError;
  List<List<VehicleInfo>> get vehByType => throw _privateConstructorUsedError;
  bool get listForm => throw _privateConstructorUsedError;
  bool get showInRangeVehicles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FleetManagerStateCopyWith<FleetManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FleetManagerStateCopyWith<$Res> {
  factory $FleetManagerStateCopyWith(
          FleetManagerState value, $Res Function(FleetManagerState) then) =
      _$FleetManagerStateCopyWithImpl<$Res, FleetManagerState>;
  @useResult
  $Res call(
      {KtMutableList<VehicleInfo> vehicleList,
      KtMutableList<Sensor> datatracList,
      bool descendingSort,
      VehicleListSortOrder currentSort,
      List<List<VehicleInfo>> vehByType,
      bool listForm,
      bool showInRangeVehicles});
}

/// @nodoc
class _$FleetManagerStateCopyWithImpl<$Res, $Val extends FleetManagerState>
    implements $FleetManagerStateCopyWith<$Res> {
  _$FleetManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleList = null,
    Object? datatracList = null,
    Object? descendingSort = null,
    Object? currentSort = null,
    Object? vehByType = null,
    Object? listForm = null,
    Object? showInRangeVehicles = null,
  }) {
    return _then(_value.copyWith(
      vehicleList: null == vehicleList
          ? _value.vehicleList
          : vehicleList // ignore: cast_nullable_to_non_nullable
              as KtMutableList<VehicleInfo>,
      datatracList: null == datatracList
          ? _value.datatracList
          : datatracList // ignore: cast_nullable_to_non_nullable
              as KtMutableList<Sensor>,
      descendingSort: null == descendingSort
          ? _value.descendingSort
          : descendingSort // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSort: null == currentSort
          ? _value.currentSort
          : currentSort // ignore: cast_nullable_to_non_nullable
              as VehicleListSortOrder,
      vehByType: null == vehByType
          ? _value.vehByType
          : vehByType // ignore: cast_nullable_to_non_nullable
              as List<List<VehicleInfo>>,
      listForm: null == listForm
          ? _value.listForm
          : listForm // ignore: cast_nullable_to_non_nullable
              as bool,
      showInRangeVehicles: null == showInRangeVehicles
          ? _value.showInRangeVehicles
          : showInRangeVehicles // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FleetManagerStateCopyWith<$Res>
    implements $FleetManagerStateCopyWith<$Res> {
  factory _$$_FleetManagerStateCopyWith(_$_FleetManagerState value,
          $Res Function(_$_FleetManagerState) then) =
      __$$_FleetManagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {KtMutableList<VehicleInfo> vehicleList,
      KtMutableList<Sensor> datatracList,
      bool descendingSort,
      VehicleListSortOrder currentSort,
      List<List<VehicleInfo>> vehByType,
      bool listForm,
      bool showInRangeVehicles});
}

/// @nodoc
class __$$_FleetManagerStateCopyWithImpl<$Res>
    extends _$FleetManagerStateCopyWithImpl<$Res, _$_FleetManagerState>
    implements _$$_FleetManagerStateCopyWith<$Res> {
  __$$_FleetManagerStateCopyWithImpl(
      _$_FleetManagerState _value, $Res Function(_$_FleetManagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleList = null,
    Object? datatracList = null,
    Object? descendingSort = null,
    Object? currentSort = null,
    Object? vehByType = null,
    Object? listForm = null,
    Object? showInRangeVehicles = null,
  }) {
    return _then(_$_FleetManagerState(
      vehicleList: null == vehicleList
          ? _value.vehicleList
          : vehicleList // ignore: cast_nullable_to_non_nullable
              as KtMutableList<VehicleInfo>,
      datatracList: null == datatracList
          ? _value.datatracList
          : datatracList // ignore: cast_nullable_to_non_nullable
              as KtMutableList<Sensor>,
      descendingSort: null == descendingSort
          ? _value.descendingSort
          : descendingSort // ignore: cast_nullable_to_non_nullable
              as bool,
      currentSort: null == currentSort
          ? _value.currentSort
          : currentSort // ignore: cast_nullable_to_non_nullable
              as VehicleListSortOrder,
      vehByType: null == vehByType
          ? _value._vehByType
          : vehByType // ignore: cast_nullable_to_non_nullable
              as List<List<VehicleInfo>>,
      listForm: null == listForm
          ? _value.listForm
          : listForm // ignore: cast_nullable_to_non_nullable
              as bool,
      showInRangeVehicles: null == showInRangeVehicles
          ? _value.showInRangeVehicles
          : showInRangeVehicles // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FleetManagerState implements _FleetManagerState {
  const _$_FleetManagerState(
      {required this.vehicleList,
      required this.datatracList,
      required this.descendingSort,
      required this.currentSort,
      required final List<List<VehicleInfo>> vehByType,
      required this.listForm,
      required this.showInRangeVehicles})
      : _vehByType = vehByType;

  @override
  final KtMutableList<VehicleInfo> vehicleList;
  @override
  final KtMutableList<Sensor> datatracList;
  @override
  final bool descendingSort;
  @override
  final VehicleListSortOrder currentSort;
  final List<List<VehicleInfo>> _vehByType;
  @override
  List<List<VehicleInfo>> get vehByType {
    if (_vehByType is EqualUnmodifiableListView) return _vehByType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehByType);
  }

  @override
  final bool listForm;
  @override
  final bool showInRangeVehicles;

  @override
  String toString() {
    return 'FleetManagerState(vehicleList: $vehicleList, datatracList: $datatracList, descendingSort: $descendingSort, currentSort: $currentSort, vehByType: $vehByType, listForm: $listForm, showInRangeVehicles: $showInRangeVehicles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FleetManagerState &&
            (identical(other.vehicleList, vehicleList) ||
                other.vehicleList == vehicleList) &&
            (identical(other.datatracList, datatracList) ||
                other.datatracList == datatracList) &&
            (identical(other.descendingSort, descendingSort) ||
                other.descendingSort == descendingSort) &&
            (identical(other.currentSort, currentSort) ||
                other.currentSort == currentSort) &&
            const DeepCollectionEquality()
                .equals(other._vehByType, _vehByType) &&
            (identical(other.listForm, listForm) ||
                other.listForm == listForm) &&
            (identical(other.showInRangeVehicles, showInRangeVehicles) ||
                other.showInRangeVehicles == showInRangeVehicles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      vehicleList,
      datatracList,
      descendingSort,
      currentSort,
      const DeepCollectionEquality().hash(_vehByType),
      listForm,
      showInRangeVehicles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FleetManagerStateCopyWith<_$_FleetManagerState> get copyWith =>
      __$$_FleetManagerStateCopyWithImpl<_$_FleetManagerState>(
          this, _$identity);
}

abstract class _FleetManagerState implements FleetManagerState {
  const factory _FleetManagerState(
      {required final KtMutableList<VehicleInfo> vehicleList,
      required final KtMutableList<Sensor> datatracList,
      required final bool descendingSort,
      required final VehicleListSortOrder currentSort,
      required final List<List<VehicleInfo>> vehByType,
      required final bool listForm,
      required final bool showInRangeVehicles}) = _$_FleetManagerState;

  @override
  KtMutableList<VehicleInfo> get vehicleList;
  @override
  KtMutableList<Sensor> get datatracList;
  @override
  bool get descendingSort;
  @override
  VehicleListSortOrder get currentSort;
  @override
  List<List<VehicleInfo>> get vehByType;
  @override
  bool get listForm;
  @override
  bool get showInRangeVehicles;
  @override
  @JsonKey(ignore: true)
  _$$_FleetManagerStateCopyWith<_$_FleetManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

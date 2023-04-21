// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logging_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoggingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggingEventCopyWith<$Res> {
  factory $LoggingEventCopyWith(
          LoggingEvent value, $Res Function(LoggingEvent) then) =
      _$LoggingEventCopyWithImpl<$Res, LoggingEvent>;
}

/// @nodoc
class _$LoggingEventCopyWithImpl<$Res, $Val extends LoggingEvent>
    implements $LoggingEventCopyWith<$Res> {
  _$LoggingEventCopyWithImpl(this._value, this._then);

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
    extends _$LoggingEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'LoggingEvent.started()';
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
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
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
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LoggingEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_GetLogsCopyWith<$Res> {
  factory _$$_GetLogsCopyWith(
          _$_GetLogs value, $Res Function(_$_GetLogs) then) =
      __$$_GetLogsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetLogsCopyWithImpl<$Res>
    extends _$LoggingEventCopyWithImpl<$Res, _$_GetLogs>
    implements _$$_GetLogsCopyWith<$Res> {
  __$$_GetLogsCopyWithImpl(_$_GetLogs _value, $Res Function(_$_GetLogs) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetLogs implements _GetLogs {
  const _$_GetLogs();

  @override
  String toString() {
    return 'LoggingEvent.getLogs()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetLogs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return getLogs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return getLogs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) {
    if (getLogs != null) {
      return getLogs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return getLogs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return getLogs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (getLogs != null) {
      return getLogs(this);
    }
    return orElse();
  }
}

abstract class _GetLogs implements LoggingEvent {
  const factory _GetLogs() = _$_GetLogs;
}

/// @nodoc
abstract class _$$_VehIdFilterCopyWith<$Res> {
  factory _$$_VehIdFilterCopyWith(
          _$_VehIdFilter value, $Res Function(_$_VehIdFilter) then) =
      __$$_VehIdFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOn, String vehId});
}

/// @nodoc
class __$$_VehIdFilterCopyWithImpl<$Res>
    extends _$LoggingEventCopyWithImpl<$Res, _$_VehIdFilter>
    implements _$$_VehIdFilterCopyWith<$Res> {
  __$$_VehIdFilterCopyWithImpl(
      _$_VehIdFilter _value, $Res Function(_$_VehIdFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOn = null,
    Object? vehId = null,
  }) {
    return _then(_$_VehIdFilter(
      null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      null == vehId
          ? _value.vehId
          : vehId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VehIdFilter implements _VehIdFilter {
  _$_VehIdFilter(this.isOn, this.vehId);

  @override
  final bool isOn;
  @override
  final String vehId;

  @override
  String toString() {
    return 'LoggingEvent.vehIdFilter(isOn: $isOn, vehId: $vehId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehIdFilter &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.vehId, vehId) || other.vehId == vehId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn, vehId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehIdFilterCopyWith<_$_VehIdFilter> get copyWith =>
      __$$_VehIdFilterCopyWithImpl<_$_VehIdFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return vehIdFilter(isOn, vehId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return vehIdFilter?.call(isOn, vehId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) {
    if (vehIdFilter != null) {
      return vehIdFilter(isOn, vehId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return vehIdFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return vehIdFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (vehIdFilter != null) {
      return vehIdFilter(this);
    }
    return orElse();
  }
}

abstract class _VehIdFilter implements LoggingEvent {
  factory _VehIdFilter(final bool isOn, final String vehId) = _$_VehIdFilter;

  bool get isOn;
  String get vehId;
  @JsonKey(ignore: true)
  _$$_VehIdFilterCopyWith<_$_VehIdFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DtIdFilterCopyWith<$Res> {
  factory _$$_DtIdFilterCopyWith(
          _$_DtIdFilter value, $Res Function(_$_DtIdFilter) then) =
      __$$_DtIdFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOn, String dtId});
}

/// @nodoc
class __$$_DtIdFilterCopyWithImpl<$Res>
    extends _$LoggingEventCopyWithImpl<$Res, _$_DtIdFilter>
    implements _$$_DtIdFilterCopyWith<$Res> {
  __$$_DtIdFilterCopyWithImpl(
      _$_DtIdFilter _value, $Res Function(_$_DtIdFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOn = null,
    Object? dtId = null,
  }) {
    return _then(_$_DtIdFilter(
      null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      null == dtId
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DtIdFilter implements _DtIdFilter {
  _$_DtIdFilter(this.isOn, this.dtId);

  @override
  final bool isOn;
  @override
  final String dtId;

  @override
  String toString() {
    return 'LoggingEvent.dtIdFilter(isOn: $isOn, dtId: $dtId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DtIdFilter &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.dtId, dtId) || other.dtId == dtId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn, dtId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DtIdFilterCopyWith<_$_DtIdFilter> get copyWith =>
      __$$_DtIdFilterCopyWithImpl<_$_DtIdFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return dtIdFilter(isOn, dtId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return dtIdFilter?.call(isOn, dtId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) {
    if (dtIdFilter != null) {
      return dtIdFilter(isOn, dtId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return dtIdFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return dtIdFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (dtIdFilter != null) {
      return dtIdFilter(this);
    }
    return orElse();
  }
}

abstract class _DtIdFilter implements LoggingEvent {
  factory _DtIdFilter(final bool isOn, final String dtId) = _$_DtIdFilter;

  bool get isOn;
  String get dtId;
  @JsonKey(ignore: true)
  _$$_DtIdFilterCopyWith<_$_DtIdFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MsgTypeFilterCopyWith<$Res> {
  factory _$$_MsgTypeFilterCopyWith(
          _$_MsgTypeFilter value, $Res Function(_$_MsgTypeFilter) then) =
      __$$_MsgTypeFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOn, String msgType});
}

/// @nodoc
class __$$_MsgTypeFilterCopyWithImpl<$Res>
    extends _$LoggingEventCopyWithImpl<$Res, _$_MsgTypeFilter>
    implements _$$_MsgTypeFilterCopyWith<$Res> {
  __$$_MsgTypeFilterCopyWithImpl(
      _$_MsgTypeFilter _value, $Res Function(_$_MsgTypeFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOn = null,
    Object? msgType = null,
  }) {
    return _then(_$_MsgTypeFilter(
      null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
      null == msgType
          ? _value.msgType
          : msgType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MsgTypeFilter implements _MsgTypeFilter {
  _$_MsgTypeFilter(this.isOn, this.msgType);

  @override
  final bool isOn;
  @override
  final String msgType;

  @override
  String toString() {
    return 'LoggingEvent.msgTypeFilter(isOn: $isOn, msgType: $msgType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MsgTypeFilter &&
            (identical(other.isOn, isOn) || other.isOn == isOn) &&
            (identical(other.msgType, msgType) || other.msgType == msgType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOn, msgType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MsgTypeFilterCopyWith<_$_MsgTypeFilter> get copyWith =>
      __$$_MsgTypeFilterCopyWithImpl<_$_MsgTypeFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return msgTypeFilter(isOn, msgType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return msgTypeFilter?.call(isOn, msgType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) {
    if (msgTypeFilter != null) {
      return msgTypeFilter(isOn, msgType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return msgTypeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return msgTypeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (msgTypeFilter != null) {
      return msgTypeFilter(this);
    }
    return orElse();
  }
}

abstract class _MsgTypeFilter implements LoggingEvent {
  factory _MsgTypeFilter(final bool isOn, final String msgType) =
      _$_MsgTypeFilter;

  bool get isOn;
  String get msgType;
  @JsonKey(ignore: true)
  _$$_MsgTypeFilterCopyWith<_$_MsgTypeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ClearFiltersCopyWith<$Res> {
  factory _$$_ClearFiltersCopyWith(
          _$_ClearFilters value, $Res Function(_$_ClearFilters) then) =
      __$$_ClearFiltersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearFiltersCopyWithImpl<$Res>
    extends _$LoggingEventCopyWithImpl<$Res, _$_ClearFilters>
    implements _$$_ClearFiltersCopyWith<$Res> {
  __$$_ClearFiltersCopyWithImpl(
      _$_ClearFilters _value, $Res Function(_$_ClearFilters) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearFilters implements _ClearFilters {
  _$_ClearFilters();

  @override
  String toString() {
    return 'LoggingEvent.clearFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLogs,
    required TResult Function(bool isOn, String vehId) vehIdFilter,
    required TResult Function(bool isOn, String dtId) dtIdFilter,
    required TResult Function(bool isOn, String msgType) msgTypeFilter,
    required TResult Function() clearFilters,
  }) {
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLogs,
    TResult? Function(bool isOn, String vehId)? vehIdFilter,
    TResult? Function(bool isOn, String dtId)? dtIdFilter,
    TResult? Function(bool isOn, String msgType)? msgTypeFilter,
    TResult? Function()? clearFilters,
  }) {
    return clearFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLogs,
    TResult Function(bool isOn, String vehId)? vehIdFilter,
    TResult Function(bool isOn, String dtId)? dtIdFilter,
    TResult Function(bool isOn, String msgType)? msgTypeFilter,
    TResult Function()? clearFilters,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLogs value) getLogs,
    required TResult Function(_VehIdFilter value) vehIdFilter,
    required TResult Function(_DtIdFilter value) dtIdFilter,
    required TResult Function(_MsgTypeFilter value) msgTypeFilter,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLogs value)? getLogs,
    TResult? Function(_VehIdFilter value)? vehIdFilter,
    TResult? Function(_DtIdFilter value)? dtIdFilter,
    TResult? Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLogs value)? getLogs,
    TResult Function(_VehIdFilter value)? vehIdFilter,
    TResult Function(_DtIdFilter value)? dtIdFilter,
    TResult Function(_MsgTypeFilter value)? msgTypeFilter,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements LoggingEvent {
  factory _ClearFilters() = _$_ClearFilters;
}

/// @nodoc
mixin _$LoggingState {
  bool get isLoading => throw _privateConstructorUsedError;
  KtList<LogItem> get logItems => throw _privateConstructorUsedError;
  bool get vehIdFilter => throw _privateConstructorUsedError;
  bool get dtIdFilter => throw _privateConstructorUsedError;
  bool get msgTypeFilter => throw _privateConstructorUsedError;
  String get vehId => throw _privateConstructorUsedError;
  String get dtId => throw _privateConstructorUsedError;
  String get msgType => throw _privateConstructorUsedError;
  List<String> get possibleVehIds => throw _privateConstructorUsedError;
  List<String> get possibleDtIds => throw _privateConstructorUsedError;
  List<String> get possibleMsgTypes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggingStateCopyWith<LoggingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggingStateCopyWith<$Res> {
  factory $LoggingStateCopyWith(
          LoggingState value, $Res Function(LoggingState) then) =
      _$LoggingStateCopyWithImpl<$Res, LoggingState>;
  @useResult
  $Res call(
      {bool isLoading,
      KtList<LogItem> logItems,
      bool vehIdFilter,
      bool dtIdFilter,
      bool msgTypeFilter,
      String vehId,
      String dtId,
      String msgType,
      List<String> possibleVehIds,
      List<String> possibleDtIds,
      List<String> possibleMsgTypes});
}

/// @nodoc
class _$LoggingStateCopyWithImpl<$Res, $Val extends LoggingState>
    implements $LoggingStateCopyWith<$Res> {
  _$LoggingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? logItems = null,
    Object? vehIdFilter = null,
    Object? dtIdFilter = null,
    Object? msgTypeFilter = null,
    Object? vehId = null,
    Object? dtId = null,
    Object? msgType = null,
    Object? possibleVehIds = null,
    Object? possibleDtIds = null,
    Object? possibleMsgTypes = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      logItems: null == logItems
          ? _value.logItems
          : logItems // ignore: cast_nullable_to_non_nullable
              as KtList<LogItem>,
      vehIdFilter: null == vehIdFilter
          ? _value.vehIdFilter
          : vehIdFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      dtIdFilter: null == dtIdFilter
          ? _value.dtIdFilter
          : dtIdFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      msgTypeFilter: null == msgTypeFilter
          ? _value.msgTypeFilter
          : msgTypeFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      vehId: null == vehId
          ? _value.vehId
          : vehId // ignore: cast_nullable_to_non_nullable
              as String,
      dtId: null == dtId
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as String,
      msgType: null == msgType
          ? _value.msgType
          : msgType // ignore: cast_nullable_to_non_nullable
              as String,
      possibleVehIds: null == possibleVehIds
          ? _value.possibleVehIds
          : possibleVehIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possibleDtIds: null == possibleDtIds
          ? _value.possibleDtIds
          : possibleDtIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possibleMsgTypes: null == possibleMsgTypes
          ? _value.possibleMsgTypes
          : possibleMsgTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoggingStateCopyWith<$Res>
    implements $LoggingStateCopyWith<$Res> {
  factory _$$_LoggingStateCopyWith(
          _$_LoggingState value, $Res Function(_$_LoggingState) then) =
      __$$_LoggingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      KtList<LogItem> logItems,
      bool vehIdFilter,
      bool dtIdFilter,
      bool msgTypeFilter,
      String vehId,
      String dtId,
      String msgType,
      List<String> possibleVehIds,
      List<String> possibleDtIds,
      List<String> possibleMsgTypes});
}

/// @nodoc
class __$$_LoggingStateCopyWithImpl<$Res>
    extends _$LoggingStateCopyWithImpl<$Res, _$_LoggingState>
    implements _$$_LoggingStateCopyWith<$Res> {
  __$$_LoggingStateCopyWithImpl(
      _$_LoggingState _value, $Res Function(_$_LoggingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? logItems = null,
    Object? vehIdFilter = null,
    Object? dtIdFilter = null,
    Object? msgTypeFilter = null,
    Object? vehId = null,
    Object? dtId = null,
    Object? msgType = null,
    Object? possibleVehIds = null,
    Object? possibleDtIds = null,
    Object? possibleMsgTypes = null,
  }) {
    return _then(_$_LoggingState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      logItems: null == logItems
          ? _value.logItems
          : logItems // ignore: cast_nullable_to_non_nullable
              as KtList<LogItem>,
      vehIdFilter: null == vehIdFilter
          ? _value.vehIdFilter
          : vehIdFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      dtIdFilter: null == dtIdFilter
          ? _value.dtIdFilter
          : dtIdFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      msgTypeFilter: null == msgTypeFilter
          ? _value.msgTypeFilter
          : msgTypeFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      vehId: null == vehId
          ? _value.vehId
          : vehId // ignore: cast_nullable_to_non_nullable
              as String,
      dtId: null == dtId
          ? _value.dtId
          : dtId // ignore: cast_nullable_to_non_nullable
              as String,
      msgType: null == msgType
          ? _value.msgType
          : msgType // ignore: cast_nullable_to_non_nullable
              as String,
      possibleVehIds: null == possibleVehIds
          ? _value._possibleVehIds
          : possibleVehIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possibleDtIds: null == possibleDtIds
          ? _value._possibleDtIds
          : possibleDtIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possibleMsgTypes: null == possibleMsgTypes
          ? _value._possibleMsgTypes
          : possibleMsgTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_LoggingState implements _LoggingState {
  const _$_LoggingState(
      {required this.isLoading,
      required this.logItems,
      required this.vehIdFilter,
      required this.dtIdFilter,
      required this.msgTypeFilter,
      required this.vehId,
      required this.dtId,
      required this.msgType,
      required final List<String> possibleVehIds,
      required final List<String> possibleDtIds,
      required final List<String> possibleMsgTypes})
      : _possibleVehIds = possibleVehIds,
        _possibleDtIds = possibleDtIds,
        _possibleMsgTypes = possibleMsgTypes;

  @override
  final bool isLoading;
  @override
  final KtList<LogItem> logItems;
  @override
  final bool vehIdFilter;
  @override
  final bool dtIdFilter;
  @override
  final bool msgTypeFilter;
  @override
  final String vehId;
  @override
  final String dtId;
  @override
  final String msgType;
  final List<String> _possibleVehIds;
  @override
  List<String> get possibleVehIds {
    if (_possibleVehIds is EqualUnmodifiableListView) return _possibleVehIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibleVehIds);
  }

  final List<String> _possibleDtIds;
  @override
  List<String> get possibleDtIds {
    if (_possibleDtIds is EqualUnmodifiableListView) return _possibleDtIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibleDtIds);
  }

  final List<String> _possibleMsgTypes;
  @override
  List<String> get possibleMsgTypes {
    if (_possibleMsgTypes is EqualUnmodifiableListView)
      return _possibleMsgTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibleMsgTypes);
  }

  @override
  String toString() {
    return 'LoggingState(isLoading: $isLoading, logItems: $logItems, vehIdFilter: $vehIdFilter, dtIdFilter: $dtIdFilter, msgTypeFilter: $msgTypeFilter, vehId: $vehId, dtId: $dtId, msgType: $msgType, possibleVehIds: $possibleVehIds, possibleDtIds: $possibleDtIds, possibleMsgTypes: $possibleMsgTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoggingState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.logItems, logItems) ||
                other.logItems == logItems) &&
            (identical(other.vehIdFilter, vehIdFilter) ||
                other.vehIdFilter == vehIdFilter) &&
            (identical(other.dtIdFilter, dtIdFilter) ||
                other.dtIdFilter == dtIdFilter) &&
            (identical(other.msgTypeFilter, msgTypeFilter) ||
                other.msgTypeFilter == msgTypeFilter) &&
            (identical(other.vehId, vehId) || other.vehId == vehId) &&
            (identical(other.dtId, dtId) || other.dtId == dtId) &&
            (identical(other.msgType, msgType) || other.msgType == msgType) &&
            const DeepCollectionEquality()
                .equals(other._possibleVehIds, _possibleVehIds) &&
            const DeepCollectionEquality()
                .equals(other._possibleDtIds, _possibleDtIds) &&
            const DeepCollectionEquality()
                .equals(other._possibleMsgTypes, _possibleMsgTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      logItems,
      vehIdFilter,
      dtIdFilter,
      msgTypeFilter,
      vehId,
      dtId,
      msgType,
      const DeepCollectionEquality().hash(_possibleVehIds),
      const DeepCollectionEquality().hash(_possibleDtIds),
      const DeepCollectionEquality().hash(_possibleMsgTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoggingStateCopyWith<_$_LoggingState> get copyWith =>
      __$$_LoggingStateCopyWithImpl<_$_LoggingState>(this, _$identity);
}

abstract class _LoggingState implements LoggingState {
  const factory _LoggingState(
      {required final bool isLoading,
      required final KtList<LogItem> logItems,
      required final bool vehIdFilter,
      required final bool dtIdFilter,
      required final bool msgTypeFilter,
      required final String vehId,
      required final String dtId,
      required final String msgType,
      required final List<String> possibleVehIds,
      required final List<String> possibleDtIds,
      required final List<String> possibleMsgTypes}) = _$_LoggingState;

  @override
  bool get isLoading;
  @override
  KtList<LogItem> get logItems;
  @override
  bool get vehIdFilter;
  @override
  bool get dtIdFilter;
  @override
  bool get msgTypeFilter;
  @override
  String get vehId;
  @override
  String get dtId;
  @override
  String get msgType;
  @override
  List<String> get possibleVehIds;
  @override
  List<String> get possibleDtIds;
  @override
  List<String> get possibleMsgTypes;
  @override
  @JsonKey(ignore: true)
  _$$_LoggingStateCopyWith<_$_LoggingState> get copyWith =>
      throw _privateConstructorUsedError;
}

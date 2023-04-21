// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'programming_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgrammingStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgrammingStatusEventCopyWith<$Res> {
  factory $ProgrammingStatusEventCopyWith(ProgrammingStatusEvent value,
          $Res Function(ProgrammingStatusEvent) then) =
      _$ProgrammingStatusEventCopyWithImpl<$Res, ProgrammingStatusEvent>;
}

/// @nodoc
class _$ProgrammingStatusEventCopyWithImpl<$Res,
        $Val extends ProgrammingStatusEvent>
    implements $ProgrammingStatusEventCopyWith<$Res> {
  _$ProgrammingStatusEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {ProgrammedDataTrac dataTrac,
      Map<String, dynamic> changedValuesMap,
      bool isEditing,
      bool realPassword,
      bool wiping});

  $ProgrammedDataTracCopyWith<$Res> get dataTrac;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataTrac = null,
    Object? changedValuesMap = null,
    Object? isEditing = null,
    Object? realPassword = null,
    Object? wiping = null,
  }) {
    return _then(_$_Started(
      null == dataTrac
          ? _value.dataTrac
          : dataTrac // ignore: cast_nullable_to_non_nullable
              as ProgrammedDataTrac,
      null == changedValuesMap
          ? _value._changedValuesMap
          : changedValuesMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      null == realPassword
          ? _value.realPassword
          : realPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      null == wiping
          ? _value.wiping
          : wiping // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgrammedDataTracCopyWith<$Res> get dataTrac {
    return $ProgrammedDataTracCopyWith<$Res>(_value.dataTrac, (value) {
      return _then(_value.copyWith(dataTrac: value));
    });
  }
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started(this.dataTrac, final Map<String, dynamic> changedValuesMap,
      this.isEditing, this.realPassword, this.wiping)
      : _changedValuesMap = changedValuesMap;

  @override
  final ProgrammedDataTrac dataTrac;
  final Map<String, dynamic> _changedValuesMap;
  @override
  Map<String, dynamic> get changedValuesMap {
    if (_changedValuesMap is EqualUnmodifiableMapView) return _changedValuesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_changedValuesMap);
  }

  @override
  final bool isEditing;
  @override
  final bool realPassword;
  @override
  final bool wiping;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.started(dataTrac: $dataTrac, changedValuesMap: $changedValuesMap, isEditing: $isEditing, realPassword: $realPassword, wiping: $wiping)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgrammingStatusEvent.started'))
      ..add(DiagnosticsProperty('dataTrac', dataTrac))
      ..add(DiagnosticsProperty('changedValuesMap', changedValuesMap))
      ..add(DiagnosticsProperty('isEditing', isEditing))
      ..add(DiagnosticsProperty('realPassword', realPassword))
      ..add(DiagnosticsProperty('wiping', wiping));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.dataTrac, dataTrac) ||
                other.dataTrac == dataTrac) &&
            const DeepCollectionEquality()
                .equals(other._changedValuesMap, _changedValuesMap) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.realPassword, realPassword) ||
                other.realPassword == realPassword) &&
            (identical(other.wiping, wiping) || other.wiping == wiping));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataTrac,
      const DeepCollectionEquality().hash(_changedValuesMap),
      isEditing,
      realPassword,
      wiping);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return started(dataTrac, changedValuesMap, isEditing, realPassword, wiping);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return started?.call(
        dataTrac, changedValuesMap, isEditing, realPassword, wiping);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(
          dataTrac, changedValuesMap, isEditing, realPassword, wiping);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProgrammingStatusEvent {
  const factory _Started(
      final ProgrammedDataTrac dataTrac,
      final Map<String, dynamic> changedValuesMap,
      final bool isEditing,
      final bool realPassword,
      final bool wiping) = _$_Started;

  ProgrammedDataTrac get dataTrac;
  Map<String, dynamic> get changedValuesMap;
  bool get isEditing;
  bool get realPassword;
  bool get wiping;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectedCopyWith<$Res> {
  factory _$$_ConnectedCopyWith(
          _$_Connected value, $Res Function(_$_Connected) then) =
      __$$_ConnectedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConnected});
}

/// @nodoc
class __$$_ConnectedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_Connected>
    implements _$$_ConnectedCopyWith<$Res> {
  __$$_ConnectedCopyWithImpl(
      _$_Connected _value, $Res Function(_$_Connected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
  }) {
    return _then(_$_Connected(
      null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Connected with DiagnosticableTreeMixin implements _Connected {
  const _$_Connected(this.isConnected);

  @override
  final bool isConnected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.connected(isConnected: $isConnected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgrammingStatusEvent.connected'))
      ..add(DiagnosticsProperty('isConnected', isConnected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Connected &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedCopyWith<_$_Connected> get copyWith =>
      __$$_ConnectedCopyWithImpl<_$_Connected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return connected(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return connected?.call(isConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(isConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements ProgrammingStatusEvent {
  const factory _Connected(final bool isConnected) = _$_Connected;

  bool get isConnected;
  @JsonKey(ignore: true)
  _$$_ConnectedCopyWith<_$_Connected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatedCopyWith<$Res> {
  factory _$$_UpdatedCopyWith(
          _$_Updated value, $Res Function(_$_Updated) then) =
      __$$_UpdatedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isUpdated});
}

/// @nodoc
class __$$_UpdatedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_Updated>
    implements _$$_UpdatedCopyWith<$Res> {
  __$$_UpdatedCopyWithImpl(_$_Updated _value, $Res Function(_$_Updated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdated = null,
  }) {
    return _then(_$_Updated(
      null == isUpdated
          ? _value.isUpdated
          : isUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Updated with DiagnosticableTreeMixin implements _Updated {
  const _$_Updated(this.isUpdated);

  @override
  final bool isUpdated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.updated(isUpdated: $isUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgrammingStatusEvent.updated'))
      ..add(DiagnosticsProperty('isUpdated', isUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updated &&
            (identical(other.isUpdated, isUpdated) ||
                other.isUpdated == isUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatedCopyWith<_$_Updated> get copyWith =>
      __$$_UpdatedCopyWithImpl<_$_Updated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return updated(isUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return updated?.call(isUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(isUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements ProgrammingStatusEvent {
  const factory _Updated(final bool isUpdated) = _$_Updated;

  bool get isUpdated;
  @JsonKey(ignore: true)
  _$$_UpdatedCopyWith<_$_Updated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifiedCopyWith<$Res> {
  factory _$$_VerifiedCopyWith(
          _$_Verified value, $Res Function(_$_Verified) then) =
      __$$_VerifiedCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isVerified});
}

/// @nodoc
class __$$_VerifiedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_Verified>
    implements _$$_VerifiedCopyWith<$Res> {
  __$$_VerifiedCopyWithImpl(
      _$_Verified _value, $Res Function(_$_Verified) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerified = null,
  }) {
    return _then(_$_Verified(
      null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Verified with DiagnosticableTreeMixin implements _Verified {
  const _$_Verified(this.isVerified);

  @override
  final bool isVerified;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.verified(isVerified: $isVerified)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgrammingStatusEvent.verified'))
      ..add(DiagnosticsProperty('isVerified', isVerified));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Verified &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifiedCopyWith<_$_Verified> get copyWith =>
      __$$_VerifiedCopyWithImpl<_$_Verified>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return verified(isVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return verified?.call(isVerified);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(isVerified);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified implements ProgrammingStatusEvent {
  const factory _Verified(final bool isVerified) = _$_Verified;

  bool get isVerified;
  @JsonKey(ignore: true)
  _$$_VerifiedCopyWith<_$_Verified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConnectionFailedCopyWith<$Res> {
  factory _$$_ConnectionFailedCopyWith(
          _$_ConnectionFailed value, $Res Function(_$_ConnectionFailed) then) =
      __$$_ConnectionFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectionFailedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_ConnectionFailed>
    implements _$$_ConnectionFailedCopyWith<$Res> {
  __$$_ConnectionFailedCopyWithImpl(
      _$_ConnectionFailed _value, $Res Function(_$_ConnectionFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectionFailed
    with DiagnosticableTreeMixin
    implements _ConnectionFailed {
  const _$_ConnectionFailed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.connectionFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ProgrammingStatusEvent.connectionFailed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConnectionFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return connectionFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return connectionFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return connectionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return connectionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(this);
    }
    return orElse();
  }
}

abstract class _ConnectionFailed implements ProgrammingStatusEvent {
  const factory _ConnectionFailed() = _$_ConnectionFailed;
}

/// @nodoc
abstract class _$$_UpdateFailedCopyWith<$Res> {
  factory _$$_UpdateFailedCopyWith(
          _$_UpdateFailed value, $Res Function(_$_UpdateFailed) then) =
      __$$_UpdateFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateFailedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_UpdateFailed>
    implements _$$_UpdateFailedCopyWith<$Res> {
  __$$_UpdateFailedCopyWithImpl(
      _$_UpdateFailed _value, $Res Function(_$_UpdateFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateFailed with DiagnosticableTreeMixin implements _UpdateFailed {
  const _$_UpdateFailed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.updateFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'ProgrammingStatusEvent.updateFailed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return updateFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return updateFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (updateFailed != null) {
      return updateFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return updateFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return updateFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (updateFailed != null) {
      return updateFailed(this);
    }
    return orElse();
  }
}

abstract class _UpdateFailed implements ProgrammingStatusEvent {
  const factory _UpdateFailed() = _$_UpdateFailed;
}

/// @nodoc
abstract class _$$_VerificationFailedCopyWith<$Res> {
  factory _$$_VerificationFailedCopyWith(_$_VerificationFailed value,
          $Res Function(_$_VerificationFailed) then) =
      __$$_VerificationFailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_VerificationFailedCopyWithImpl<$Res>
    extends _$ProgrammingStatusEventCopyWithImpl<$Res, _$_VerificationFailed>
    implements _$$_VerificationFailedCopyWith<$Res> {
  __$$_VerificationFailedCopyWithImpl(
      _$_VerificationFailed _value, $Res Function(_$_VerificationFailed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_VerificationFailed
    with DiagnosticableTreeMixin
    implements _VerificationFailed {
  const _$_VerificationFailed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusEvent.verificationFailed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'ProgrammingStatusEvent.verificationFailed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_VerificationFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)
        started,
    required TResult Function(bool isConnected) connected,
    required TResult Function(bool isUpdated) updated,
    required TResult Function(bool isVerified) verified,
    required TResult Function() connectionFailed,
    required TResult Function() updateFailed,
    required TResult Function() verificationFailed,
  }) {
    return verificationFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult? Function(bool isConnected)? connected,
    TResult? Function(bool isUpdated)? updated,
    TResult? Function(bool isVerified)? verified,
    TResult? Function()? connectionFailed,
    TResult? Function()? updateFailed,
    TResult? Function()? verificationFailed,
  }) {
    return verificationFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProgrammedDataTrac dataTrac,
            Map<String, dynamic> changedValuesMap,
            bool isEditing,
            bool realPassword,
            bool wiping)?
        started,
    TResult Function(bool isConnected)? connected,
    TResult Function(bool isUpdated)? updated,
    TResult Function(bool isVerified)? verified,
    TResult Function()? connectionFailed,
    TResult Function()? updateFailed,
    TResult Function()? verificationFailed,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Verified value) verified,
    required TResult Function(_ConnectionFailed value) connectionFailed,
    required TResult Function(_UpdateFailed value) updateFailed,
    required TResult Function(_VerificationFailed value) verificationFailed,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_ConnectionFailed value)? connectionFailed,
    TResult? Function(_UpdateFailed value)? updateFailed,
    TResult? Function(_VerificationFailed value)? verificationFailed,
  }) {
    return verificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Connected value)? connected,
    TResult Function(_Updated value)? updated,
    TResult Function(_Verified value)? verified,
    TResult Function(_ConnectionFailed value)? connectionFailed,
    TResult Function(_UpdateFailed value)? updateFailed,
    TResult Function(_VerificationFailed value)? verificationFailed,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class _VerificationFailed implements ProgrammingStatusEvent {
  const factory _VerificationFailed() = _$_VerificationFailed;
}

/// @nodoc
mixin _$ProgrammingStatusState {
  bool get isConnected => throw _privateConstructorUsedError;
  bool get isProgrammed => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isWritten => throw _privateConstructorUsedError;
  bool get connectionFailed => throw _privateConstructorUsedError;
  bool get updateFailed => throw _privateConstructorUsedError;
  bool get verificationFailed => throw _privateConstructorUsedError;
  bool get writingFailed => throw _privateConstructorUsedError;
  bool get changeScreen => throw _privateConstructorUsedError;
  bool get homeScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgrammingStatusStateCopyWith<ProgrammingStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgrammingStatusStateCopyWith<$Res> {
  factory $ProgrammingStatusStateCopyWith(ProgrammingStatusState value,
          $Res Function(ProgrammingStatusState) then) =
      _$ProgrammingStatusStateCopyWithImpl<$Res, ProgrammingStatusState>;
  @useResult
  $Res call(
      {bool isConnected,
      bool isProgrammed,
      bool isVerified,
      bool isWritten,
      bool connectionFailed,
      bool updateFailed,
      bool verificationFailed,
      bool writingFailed,
      bool changeScreen,
      bool homeScreen});
}

/// @nodoc
class _$ProgrammingStatusStateCopyWithImpl<$Res,
        $Val extends ProgrammingStatusState>
    implements $ProgrammingStatusStateCopyWith<$Res> {
  _$ProgrammingStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? isProgrammed = null,
    Object? isVerified = null,
    Object? isWritten = null,
    Object? connectionFailed = null,
    Object? updateFailed = null,
    Object? verificationFailed = null,
    Object? writingFailed = null,
    Object? changeScreen = null,
    Object? homeScreen = null,
  }) {
    return _then(_value.copyWith(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isProgrammed: null == isProgrammed
          ? _value.isProgrammed
          : isProgrammed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isWritten: null == isWritten
          ? _value.isWritten
          : isWritten // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionFailed: null == connectionFailed
          ? _value.connectionFailed
          : connectionFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updateFailed: null == updateFailed
          ? _value.updateFailed
          : updateFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationFailed: null == verificationFailed
          ? _value.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      writingFailed: null == writingFailed
          ? _value.writingFailed
          : writingFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      changeScreen: null == changeScreen
          ? _value.changeScreen
          : changeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      homeScreen: null == homeScreen
          ? _value.homeScreen
          : homeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProgrammingStatusStateCopyWith<$Res>
    implements $ProgrammingStatusStateCopyWith<$Res> {
  factory _$$_ProgrammingStatusStateCopyWith(_$_ProgrammingStatusState value,
          $Res Function(_$_ProgrammingStatusState) then) =
      __$$_ProgrammingStatusStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isConnected,
      bool isProgrammed,
      bool isVerified,
      bool isWritten,
      bool connectionFailed,
      bool updateFailed,
      bool verificationFailed,
      bool writingFailed,
      bool changeScreen,
      bool homeScreen});
}

/// @nodoc
class __$$_ProgrammingStatusStateCopyWithImpl<$Res>
    extends _$ProgrammingStatusStateCopyWithImpl<$Res,
        _$_ProgrammingStatusState>
    implements _$$_ProgrammingStatusStateCopyWith<$Res> {
  __$$_ProgrammingStatusStateCopyWithImpl(_$_ProgrammingStatusState _value,
      $Res Function(_$_ProgrammingStatusState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConnected = null,
    Object? isProgrammed = null,
    Object? isVerified = null,
    Object? isWritten = null,
    Object? connectionFailed = null,
    Object? updateFailed = null,
    Object? verificationFailed = null,
    Object? writingFailed = null,
    Object? changeScreen = null,
    Object? homeScreen = null,
  }) {
    return _then(_$_ProgrammingStatusState(
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isProgrammed: null == isProgrammed
          ? _value.isProgrammed
          : isProgrammed // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isWritten: null == isWritten
          ? _value.isWritten
          : isWritten // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionFailed: null == connectionFailed
          ? _value.connectionFailed
          : connectionFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updateFailed: null == updateFailed
          ? _value.updateFailed
          : updateFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationFailed: null == verificationFailed
          ? _value.verificationFailed
          : verificationFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      writingFailed: null == writingFailed
          ? _value.writingFailed
          : writingFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      changeScreen: null == changeScreen
          ? _value.changeScreen
          : changeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      homeScreen: null == homeScreen
          ? _value.homeScreen
          : homeScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProgrammingStatusState
    with DiagnosticableTreeMixin
    implements _ProgrammingStatusState {
  const _$_ProgrammingStatusState(
      {required this.isConnected,
      required this.isProgrammed,
      required this.isVerified,
      required this.isWritten,
      required this.connectionFailed,
      required this.updateFailed,
      required this.verificationFailed,
      required this.writingFailed,
      required this.changeScreen,
      required this.homeScreen});

  @override
  final bool isConnected;
  @override
  final bool isProgrammed;
  @override
  final bool isVerified;
  @override
  final bool isWritten;
  @override
  final bool connectionFailed;
  @override
  final bool updateFailed;
  @override
  final bool verificationFailed;
  @override
  final bool writingFailed;
  @override
  final bool changeScreen;
  @override
  final bool homeScreen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgrammingStatusState(isConnected: $isConnected, isProgrammed: $isProgrammed, isVerified: $isVerified, isWritten: $isWritten, connectionFailed: $connectionFailed, updateFailed: $updateFailed, verificationFailed: $verificationFailed, writingFailed: $writingFailed, changeScreen: $changeScreen, homeScreen: $homeScreen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgrammingStatusState'))
      ..add(DiagnosticsProperty('isConnected', isConnected))
      ..add(DiagnosticsProperty('isProgrammed', isProgrammed))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('isWritten', isWritten))
      ..add(DiagnosticsProperty('connectionFailed', connectionFailed))
      ..add(DiagnosticsProperty('updateFailed', updateFailed))
      ..add(DiagnosticsProperty('verificationFailed', verificationFailed))
      ..add(DiagnosticsProperty('writingFailed', writingFailed))
      ..add(DiagnosticsProperty('changeScreen', changeScreen))
      ..add(DiagnosticsProperty('homeScreen', homeScreen));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProgrammingStatusState &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.isProgrammed, isProgrammed) ||
                other.isProgrammed == isProgrammed) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isWritten, isWritten) ||
                other.isWritten == isWritten) &&
            (identical(other.connectionFailed, connectionFailed) ||
                other.connectionFailed == connectionFailed) &&
            (identical(other.updateFailed, updateFailed) ||
                other.updateFailed == updateFailed) &&
            (identical(other.verificationFailed, verificationFailed) ||
                other.verificationFailed == verificationFailed) &&
            (identical(other.writingFailed, writingFailed) ||
                other.writingFailed == writingFailed) &&
            (identical(other.changeScreen, changeScreen) ||
                other.changeScreen == changeScreen) &&
            (identical(other.homeScreen, homeScreen) ||
                other.homeScreen == homeScreen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isConnected,
      isProgrammed,
      isVerified,
      isWritten,
      connectionFailed,
      updateFailed,
      verificationFailed,
      writingFailed,
      changeScreen,
      homeScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProgrammingStatusStateCopyWith<_$_ProgrammingStatusState> get copyWith =>
      __$$_ProgrammingStatusStateCopyWithImpl<_$_ProgrammingStatusState>(
          this, _$identity);
}

abstract class _ProgrammingStatusState implements ProgrammingStatusState {
  const factory _ProgrammingStatusState(
      {required final bool isConnected,
      required final bool isProgrammed,
      required final bool isVerified,
      required final bool isWritten,
      required final bool connectionFailed,
      required final bool updateFailed,
      required final bool verificationFailed,
      required final bool writingFailed,
      required final bool changeScreen,
      required final bool homeScreen}) = _$_ProgrammingStatusState;

  @override
  bool get isConnected;
  @override
  bool get isProgrammed;
  @override
  bool get isVerified;
  @override
  bool get isWritten;
  @override
  bool get connectionFailed;
  @override
  bool get updateFailed;
  @override
  bool get verificationFailed;
  @override
  bool get writingFailed;
  @override
  bool get changeScreen;
  @override
  bool get homeScreen;
  @override
  @JsonKey(ignore: true)
  _$$_ProgrammingStatusStateCopyWith<_$_ProgrammingStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_mt_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MTSiteDto {
  int get siteId => throw _privateConstructorUsedError;
  int get userIdMod => throw _privateConstructorUsedError;
  int get dateTimeRep => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MTSiteDtoCopyWith<MTSiteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MTSiteDtoCopyWith<$Res> {
  factory $MTSiteDtoCopyWith(MTSiteDto value, $Res Function(MTSiteDto) then) =
      _$MTSiteDtoCopyWithImpl<$Res, MTSiteDto>;
  @useResult
  $Res call({int siteId, int userIdMod, int dateTimeRep});
}

/// @nodoc
class _$MTSiteDtoCopyWithImpl<$Res, $Val extends MTSiteDto>
    implements $MTSiteDtoCopyWith<$Res> {
  _$MTSiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? userIdMod = null,
    Object? dateTimeRep = null,
  }) {
    return _then(_value.copyWith(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      userIdMod: null == userIdMod
          ? _value.userIdMod
          : userIdMod // ignore: cast_nullable_to_non_nullable
              as int,
      dateTimeRep: null == dateTimeRep
          ? _value.dateTimeRep
          : dateTimeRep // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MTSiteDtoCopyWith<$Res> implements $MTSiteDtoCopyWith<$Res> {
  factory _$$_MTSiteDtoCopyWith(
          _$_MTSiteDto value, $Res Function(_$_MTSiteDto) then) =
      __$$_MTSiteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int siteId, int userIdMod, int dateTimeRep});
}

/// @nodoc
class __$$_MTSiteDtoCopyWithImpl<$Res>
    extends _$MTSiteDtoCopyWithImpl<$Res, _$_MTSiteDto>
    implements _$$_MTSiteDtoCopyWith<$Res> {
  __$$_MTSiteDtoCopyWithImpl(
      _$_MTSiteDto _value, $Res Function(_$_MTSiteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? siteId = null,
    Object? userIdMod = null,
    Object? dateTimeRep = null,
  }) {
    return _then(_$_MTSiteDto(
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      userIdMod: null == userIdMod
          ? _value.userIdMod
          : userIdMod // ignore: cast_nullable_to_non_nullable
              as int,
      dateTimeRep: null == dateTimeRep
          ? _value.dateTimeRep
          : dateTimeRep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MTSiteDto extends _MTSiteDto {
  _$_MTSiteDto(
      {required this.siteId,
      required this.userIdMod,
      required this.dateTimeRep})
      : super._();

  @override
  final int siteId;
  @override
  final int userIdMod;
  @override
  final int dateTimeRep;

  @override
  String toString() {
    return 'MTSiteDto(siteId: $siteId, userIdMod: $userIdMod, dateTimeRep: $dateTimeRep)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MTSiteDto &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.userIdMod, userIdMod) ||
                other.userIdMod == userIdMod) &&
            (identical(other.dateTimeRep, dateTimeRep) ||
                other.dateTimeRep == dateTimeRep));
  }

  @override
  int get hashCode => Object.hash(runtimeType, siteId, userIdMod, dateTimeRep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MTSiteDtoCopyWith<_$_MTSiteDto> get copyWith =>
      __$$_MTSiteDtoCopyWithImpl<_$_MTSiteDto>(this, _$identity);
}

abstract class _MTSiteDto extends MTSiteDto {
  factory _MTSiteDto(
      {required final int siteId,
      required final int userIdMod,
      required final int dateTimeRep}) = _$_MTSiteDto;
  _MTSiteDto._() : super._();

  @override
  int get siteId;
  @override
  int get userIdMod;
  @override
  int get dateTimeRep;
  @override
  @JsonKey(ignore: true)
  _$$_MTSiteDtoCopyWith<_$_MTSiteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

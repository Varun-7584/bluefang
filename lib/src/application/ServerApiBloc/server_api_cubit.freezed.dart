// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_api_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ServerApiState {
  List<ServerApiDto> get serverApiDtoList => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  bool get loggedIn => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  List<String> get errorList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerApiStateCopyWith<ServerApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerApiStateCopyWith<$Res> {
  factory $ServerApiStateCopyWith(
          ServerApiState value, $Res Function(ServerApiState) then) =
      _$ServerApiStateCopyWithImpl<$Res, ServerApiState>;
  @useResult
  $Res call(
      {List<ServerApiDto> serverApiDtoList,
      String token,
      bool loggedIn,
      bool success,
      List<String> errorList});
}

/// @nodoc
class _$ServerApiStateCopyWithImpl<$Res, $Val extends ServerApiState>
    implements $ServerApiStateCopyWith<$Res> {
  _$ServerApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverApiDtoList = null,
    Object? token = null,
    Object? loggedIn = null,
    Object? success = null,
    Object? errorList = null,
  }) {
    return _then(_value.copyWith(
      serverApiDtoList: null == serverApiDtoList
          ? _value.serverApiDtoList
          : serverApiDtoList // ignore: cast_nullable_to_non_nullable
              as List<ServerApiDto>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      errorList: null == errorList
          ? _value.errorList
          : errorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServerApiStateCopyWith<$Res>
    implements $ServerApiStateCopyWith<$Res> {
  factory _$$_ServerApiStateCopyWith(
          _$_ServerApiState value, $Res Function(_$_ServerApiState) then) =
      __$$_ServerApiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ServerApiDto> serverApiDtoList,
      String token,
      bool loggedIn,
      bool success,
      List<String> errorList});
}

/// @nodoc
class __$$_ServerApiStateCopyWithImpl<$Res>
    extends _$ServerApiStateCopyWithImpl<$Res, _$_ServerApiState>
    implements _$$_ServerApiStateCopyWith<$Res> {
  __$$_ServerApiStateCopyWithImpl(
      _$_ServerApiState _value, $Res Function(_$_ServerApiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverApiDtoList = null,
    Object? token = null,
    Object? loggedIn = null,
    Object? success = null,
    Object? errorList = null,
  }) {
    return _then(_$_ServerApiState(
      serverApiDtoList: null == serverApiDtoList
          ? _value._serverApiDtoList
          : serverApiDtoList // ignore: cast_nullable_to_non_nullable
              as List<ServerApiDto>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      errorList: null == errorList
          ? _value._errorList
          : errorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ServerApiState implements _ServerApiState {
  const _$_ServerApiState(
      {required final List<ServerApiDto> serverApiDtoList,
      required this.token,
      required this.loggedIn,
      required this.success,
      required final List<String> errorList})
      : _serverApiDtoList = serverApiDtoList,
        _errorList = errorList;

  final List<ServerApiDto> _serverApiDtoList;
  @override
  List<ServerApiDto> get serverApiDtoList {
    if (_serverApiDtoList is EqualUnmodifiableListView)
      return _serverApiDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serverApiDtoList);
  }

  @override
  final String token;
  @override
  final bool loggedIn;
  @override
  final bool success;
  final List<String> _errorList;
  @override
  List<String> get errorList {
    if (_errorList is EqualUnmodifiableListView) return _errorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorList);
  }

  @override
  String toString() {
    return 'ServerApiState(serverApiDtoList: $serverApiDtoList, token: $token, loggedIn: $loggedIn, success: $success, errorList: $errorList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerApiState &&
            const DeepCollectionEquality()
                .equals(other._serverApiDtoList, _serverApiDtoList) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._errorList, _errorList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serverApiDtoList),
      token,
      loggedIn,
      success,
      const DeepCollectionEquality().hash(_errorList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerApiStateCopyWith<_$_ServerApiState> get copyWith =>
      __$$_ServerApiStateCopyWithImpl<_$_ServerApiState>(this, _$identity);
}

abstract class _ServerApiState implements ServerApiState {
  const factory _ServerApiState(
      {required final List<ServerApiDto> serverApiDtoList,
      required final String token,
      required final bool loggedIn,
      required final bool success,
      required final List<String> errorList}) = _$_ServerApiState;

  @override
  List<ServerApiDto> get serverApiDtoList;
  @override
  String get token;
  @override
  bool get loggedIn;
  @override
  bool get success;
  @override
  List<String> get errorList;
  @override
  @JsonKey(ignore: true)
  _$$_ServerApiStateCopyWith<_$_ServerApiState> get copyWith =>
      throw _privateConstructorUsedError;
}


part of 'server_api_cubit.dart';

@freezed
class ServerApiState with _$ServerApiState {
  const factory ServerApiState({
    required List<ServerApiDto> serverApiDtoList,
    required String token,
    required bool loggedIn,
    required bool success,
    required List<String> errorList,
  }) = _ServerApiState;
  factory ServerApiState.initial() => ServerApiState(
    serverApiDtoList: [ServerApiDto.empty()],
    success: false,
    loggedIn: false,
    token: "",
    errorList: []
  );

}

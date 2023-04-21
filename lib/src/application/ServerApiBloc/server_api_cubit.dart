// ignore_for_file: avoid_escaping_inner_quotes, avoid_bool_literals_in_conditional_expressions

import 'dart:convert';
import 'dart:developer';
import 'package:bluefang/src/infrastructure/serverApi/server_api_dto.dart';
import 'package:bluefang/src/infrastructure/serverApi/server_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

part 'server_api_cubit.freezed.dart';
part 'server_api_state.dart';

/// Creates a new instance of the ServerApiCubitt to control calling the ServerApi and storing the retrieved data.
  /// 
  /// Requires [ServerUpdateRepository]. It is decorated with ```@singleton```, so calling it via getIt<> will always return the same instance. 
@singleton
class ServerApiCubit extends Cubit<ServerApiState> {
  final ServerApiRepository _serverUpdateRepository;
  
  ServerApiCubit(this._serverUpdateRepository) : super(ServerApiState.initial());

  String token = "";

  /// Emits the newest updates.
  ///
  /// If there is an error, the updates will not be written to the database
  Future<void> getUpdates({required String username, required String companyNo, required String deviceID, required String pwd}) async {
    //Go ahead and declare this now
    ServerApiDto? responseDto;
    List<ServerApiDto> dtoResultList = [];
    int statusCode = 0;
    bool success = true;

    //Get the newest timestamps for each table from the DB
    // ignore: unused_local_variable
    final timestampList = await _serverUpdateRepository.getNewestTimestamps();
    //Create a DataUpdateDto using that timestamp list CHANGE FOR PRODUCTION
    final ServerApiDto serverApiDto = ServerApiDto.fromParameters(
        cid: "151", tableName: "UPDATE", rowCount: 5, columns: ["tableName, timestamp"], 
        data: [
          ["Vehicle", "000000000"], 
          ["Model_n_Fuel", "00000000"],
          ["Sensor", "00000000"],
          ["Distance", "00000000"],
          ["Site", "00000000"]
        ]
    );
    
    //Call the Bluefang API and receive the results - will be in a JSON array with each object in the array being the update for one table
    statusCode = await _serverUpdateRepository.getUpdates(serverApiDto, token, dtoResultList);

    //If the response was a 401 authorization error, try logging in again
    if (statusCode == 401){
      await login(username: username, companyNo: companyNo, deviceID: deviceID, pwd: pwd);
      statusCode = await _serverUpdateRepository.getUpdates(serverApiDto, token, dtoResultList);
    }

    //If there was an error, try again
    if (statusCode != 200) {
      dtoResultList = [];
      statusCode = await _serverUpdateRepository.getUpdates(serverApiDto, token, dtoResultList);

      //If that second attempt failed, abort
      if (statusCode != 200) {
        log("Failure connecting to the server.");
        emit(state.copyWith(
          serverApiDtoList: dtoResultList,
          success: false
        ));
      }
      else {
        emit(
          state.copyWith(
            serverApiDtoList: dtoResultList,
            success: true
          )
        );

      }
    }
    //Else deserialize results and write to database
    else {
      //A single empty DTO is returned if there are no new updates
      if (dtoResultList.length == 1 && dtoResultList.elementAt(0).isEmpty()) {
        //No new updates
        emit(state.copyWith(serverApiDtoList: dtoResultList, success: true));
        return;
      }
      for (int i = 0; i < dtoResultList.length; i++) {
        responseDto = dtoResultList.elementAt(i);
        //Write results to database and broadcast if valid
        if (!responseDto.isValid()) {
          log("Could not get updates from server. Response body was invalid.", name: "server_api_cubit.dart");
          success = false;
        }
      }
      if (success) {
        //Now that we know all of them are valid, write them to the database
        await _serverUpdateRepository.insertList(serverApiDtoList: dtoResultList);
      }
      emit(state.copyWith(
          serverApiDtoList: dtoResultList,
          success: success));
    }
  }

  Future<void> sendUpdates() async {
    //Send the DTO list from the event to the API - need to send the data for all the tables at once as a JSON array full of DTOs
    //Get the response just to make sure it didn't encounter an error
    //If there was an error, log it
    //If the data was malformed, fix and resend
    //Else if there was a server error, wait and resend
    //If there is still an error, notify the user and stop trying
  }

  /// Called when logging into the API. 
  /// 
  /// This event has to be processed and the token received before any other events can be called. 
  Future<void> login({required String username, required String companyNo, required String deviceID, required String pwd}) async {
    http.Response response = http.Response("", 404);
    try{
      final Map<String, String> jsonRequestData = {"userID": username, "companyID": companyNo, "deviceID": deviceID, "password":pwd};
      //Call the Bluefang API and receive the results - will be in a JSON array with each object in the array being the update for one table
      response  = await http.post(
          Uri(scheme: "https", host: "bluefang.batrf.com", path: "/login"),
          body: json.encode(jsonRequestData),
          headers: {"Content-Type": "application/json"}
      );

      //200 is the HTTP.OK response code. Anything else means an error (our API is not using other 100 or 200 level status codes).
      if (response.statusCode != 200){
        log("Error: received status code ${response.statusCode} when logging in to API.", name: "date_update_api_bloc.dart");
      } 
      else {
        //The response should contain the token we need.
        final Map<String, dynamic> jsonMap = json.decode(response.body) as Map<String, dynamic>;
        final String token = jsonMap["token"] as String? ?? "";
        this.token = token;
        //log("Received token: $token");

        //Emit the new state with the fresh token and no errors
        emit(
          state.copyWith(
            token: token,
            errorList: [],
            success: jsonMap["success"] as bool? ?? false,
            serverApiDtoList: [],
            loggedIn: (jsonMap["success"] as bool? ?? false) && token.isNotEmpty
          )
        );
      }
    }
    catch (ex, stack){
      log("An error occurred when logging into the API.", error: ex, stackTrace: stack, name: "data_update_api_bloc.dart");
      emit(state.copyWith(
        success: false,
        token: "",
        errorList: [ex.toString()],
        serverApiDtoList: []
      ));
    }
  }

  Future<void> testConnection() async {
    final response = await http.get(Uri(
      host: "bluefang.batrf.com",
      scheme: "https",
    ));
    log("Response body: ${response.body}");
    emit(
      state.copyWith(
        success: response.statusCode == 200 ? true : false,
        errorList: []
      ),
    );
  }
}

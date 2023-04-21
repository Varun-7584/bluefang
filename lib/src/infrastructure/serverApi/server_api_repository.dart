
// ignore_for_file: avoid_redundant_argument_values, prefer_const_constructors


import 'dart:convert';
import 'dart:developer';

import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:bluefang/src/infrastructure/serverApi/server_api_dto.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class ServerApiRepository {
  final ICache _localRepository;
  ServerApiRepository(this._localRepository);

  /// Ask the WebBat server for updates.
  /// 
  /// Returns the status code. [resultList] should be an empty list when passed in. All of the results from the server will be added to [resultList]. 
  /// Because Dart/Flutter passes the value of the object's reference, the list in the caller will be updated when [resultList] has objects added to it. 
  /// 
  /// Does not check if the returned DTOs are valid or catch any exceptions. 
  Future<int> getUpdates(ServerApiDto requestDto, String token, List<ServerApiDto> resultList) async {
    String responseBody = "";

    //Call the Bluefang API and receive the results - will be in a JSON array with each object in the array being the update for one table
    final http.Response response = await http.post(
        Uri(scheme: "https", host: "bluefang.batrf.com", path: "/getUpdates"),
        body: json.encode(requestDto.toJson()),
        headers: {"Content-Type": "application/json", "Authorization" : "Bearer $token"}
    );
    responseBody = utf8.decode(response.bodyBytes).replaceAll(RegExp("while[(]1[)];"), "");
    //For some reason the string is double encoded, so need to decode it twice. 
    final jsonMap1 = json.decode(responseBody);
    final jsonMap = json.decode(jsonMap1 as String) as List<dynamic>;
    log("Returned data from server: $jsonMap", name: "server_api_repository.dart");
    final List<ServerApiDto> dtoList = List<ServerApiDto>.from(jsonMap.map((model) => ServerApiDto.fromJson(model as Map<String, dynamic>)));
    resultList.addAll(dtoList);

    return response.statusCode;
  }

  ///Inserts the [serverApiDto] **list** into the database.
  ///
  ///It is the **caller's** job to make sure there were no failures. If there were any failures, **none** of the data will be committed. 
  Future<List<Either<RepositoryFailures, List<Object?>>>> insertList({
    required List<ServerApiDto> serverApiDtoList, bool commit = true
  }) async {
    final List<Either<RepositoryFailures, List<Object?>>> resultList = [];
    bool success = true;
    for (int i = 0; i < serverApiDtoList.length; i++){
      resultList.add(await insert(serverApiDto: serverApiDtoList.elementAt(i), commit: false));
      if (resultList.last.isLeft()){
        success = false;
      }
    }

    //Now commit if there were no failures
    if (success){
      await _localRepository.commitTransactions();
    } 
    else {
      _localRepository.cancelTransaction();
    }

    return resultList;
  }

  ///Inserts the [serverApiDto] into the database.
  ///
  ///Throws a [FormatException] if the data is invalid. 
  Future<Either<RepositoryFailures, List<Object?>>> insert({
    required ServerApiDto serverApiDto, bool commit = true
  }) async {
    final List<Object?> resultList = [];
    
    try {
      //Check the table name against a whitelist before using it; that way we prevent SQL injection
      final String tableName = validTableName(serverApiDto.tableName ?? ""); 
      //Put the columns into a comma-separated list
        final StringBuffer columnList = StringBuffer();
        final StringBuffer valueList = StringBuffer();
        int dateTimeModIndex = -1;
        for (int j = 0; j < (serverApiDto.columns?.length  ?? 0) - 1; j++){
          columnList.write("${serverApiDto.columns?[j] ?? ""}, ");
          valueList.write("?, ");
          //Grab the index of the dateTimeMod column (will need it later)
          if ((serverApiDto.columns?[j] ?? "") == "dateTimeMod"){
            dateTimeModIndex = j;
          }
        }
        columnList.write(serverApiDto.columns?.last ?? "0");
        valueList.write("?");
        if (serverApiDto.columns?.last == "dateTimeMod"){
          dateTimeModIndex = serverApiDto.columns?.length ?? -1;
        }
      //Insert each row from the DTO into the database
      for (int i = 0; i < (serverApiDto.data?.length ?? 0); i++){

        //Each row should have a dateTimeMod; otherwise, error
        if (dateTimeModIndex == -1){
          throw FormatException("No dateTimeMod column found. Column list: ${serverApiDto.columns}");
        }

        //Using a SELECT statement like this is the only way to get a conditional INSERT OR REPLACE pre-SQLite 3.24, which not all Android phones have.
        await _localRepository.rawInsert(
          "INSERT OR REPLACE INTO $tableName ($columnList) SELECT $valueList WHERE NOT EXISTS (SELECT dateTimeMod FROM $tableName WHERE ${serverApiDto.columns?.first ?? ""} = '${serverApiDto.data?[i].first ?? ""}' AND dateTimeMod >= ${serverApiDto.data?[i][dateTimeModIndex] ?? 0});",
          arguments: serverApiDto.data?[i],
          commit: false //Don't commit yet
        );
        // log("INSERT OR REPLACE INTO $tableName (${columnList.toString()}) SELECT ${valueList.toString()} WHERE NOT EXISTS (SELECT dateTimeMod FROM $tableName WHERE ${serverApiDto.columns?.first ?? ""} = '${serverApiDto.data?[i].first ?? ""}' AND dateTimeMod >= ${serverApiDto.data?[i][dateTimeModIndex] ?? 0});",);
        // log("Arguments: ${serverApiDto.data?[i]}");
        //log("Returned value: $returnVal", name: "data_update_repository.dart");
      }
      //Commit transactions once all the inserts are done - speeds things up
      //resultList = await _localRepository.commitTransactions();
      //log("Result list: $resultList");
      return right(resultList);
    }
    catch (ex){
      //_localRepository.commitTransactions();
      await FirebaseCrashlytics.instance.recordError(ex, null, reason: 'Error inserting records.');
      return left(RepositoryFailures.insertionFailure(err: ex));
    }
  }

  ///Returns a map containing the newest timestamps from each table. 
  ///
  ///The map keys are the table names as given by [VehicleDBFields], [ModelAndFuelDBFields], [SensorDBFields], [DistanceDBFields], and [SiteDBFields] 
  Future<Map<String, Either<RepositoryFailures, List<Map<String, Object?>>>>> getNewestTimestamps() async {
    final Map<String, Either<RepositoryFailures, List<Map<String, Object?>>>> resultList = {};

    var result = await _localRepository.query(
      VehicleDBFields.tableName,
      distinct: true,
      columns: [VehicleDBFields.dateTimeMod],
      where: "${VehicleDBFields.dateTimeMod} in (SELECT max(${VehicleDBFields.dateTimeMod}) FROM ${VehicleDBFields.tableName})",
      limit: 1
    );
    resultList.putIfAbsent(VehicleDBFields.tableName, () => result);
    result = await _localRepository.query(
      ModelAndFuelDBFields.tableName,
      distinct: true,
      columns: [ModelAndFuelDBFields.dateTimeRep],
      where: "${ModelAndFuelDBFields.dateTimeRep} in (SELECT max(${ModelAndFuelDBFields.dateTimeRep}) FROM ${ModelAndFuelDBFields.tableName})",
      limit: 1
    );
    resultList.putIfAbsent(ModelAndFuelDBFields.tableName, () => result);
    result = await _localRepository.query(
      SensorDBFields.tableName,
      distinct: true,
      columns: [SensorDBFields.dateTimeMod],
      where: "${SensorDBFields.dateTimeMod} in (SELECT max(${SensorDBFields.dateTimeMod}) FROM ${SensorDBFields.tableName})",
      limit: 1
    );
    resultList.putIfAbsent(SensorDBFields.tableName, () => result);
    result = await _localRepository.query(
      DistanceDBFields.tableName,
      distinct: true,
      columns: [DistanceDBFields.dateTimeMod],
      where: "${DistanceDBFields.dateTimeMod} in (SELECT max(${DistanceDBFields.dateTimeMod}) FROM ${DistanceDBFields.tableName})",
      limit: 1
    );
    resultList.putIfAbsent(DistanceDBFields.tableName, () => result);
    result = await _localRepository.query(
      SiteDBFields.tableName,
      distinct: true,
      columns: [SiteDBFields.dateTimeMod],
      where: "${SiteDBFields.dateTimeMod} in (SELECT max(${SiteDBFields.dateTimeMod}) FROM ${SiteDBFields.tableName})",
      limit: 1
    );
    resultList.putIfAbsent(SiteDBFields.tableName, () => result);

    return resultList;
  }

  String validTableName(String tableName){
    final List<String> validNames = [
      "Vehicle",
      "Distance",
      "Model_n_Fuel",
      "Sensor",
      "Site"
    ];

    if (validNames.contains(tableName)){
      return tableName;
    }
    else {
      throw FormatException("Invalid table name given: $tableName.");
    }
  }

}

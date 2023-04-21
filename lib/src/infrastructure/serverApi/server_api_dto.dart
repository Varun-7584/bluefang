
// ignore_for_file: avoid_unused_constructor_parameters


import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// For storing the data returned or to be sent to the DataUpdate Web API. 
/// 
/// Overrides '==', hashCode, and toString(), meaning two objects of this type can be compared using '==' and that using hashCode or toString() will provide accurate details about the object.
class ServerApiDto {
  final String? cid;
  final String? tableName;
  final int rowCount;
  final List<String>? columns;
  int batchNumber;
  final List<List<String>>? data;
  /// Starts at 0
  static int _currentBatchNumber = 0;

  /// Mirrors the JSON data transfer format used by the Bluefang Web API.
  /// 
  /// All of the objects that are class members are nullable so that empty can be used as a valid state.
  /// The integers are not nullable because negative numbers can be used as their invalid states.
  ServerApiDto._internal({
    required this.cid, 
    required this.tableName, 
    required this.rowCount,
    required this.columns,
    required this.batchNumber,
    required this.data
  });

  /// Creates a DataUpdateDto from a map representation of a JSON string.
  /// 
  /// Increases the current batch number if the batch number received from the JSON 
  factory ServerApiDto.fromJson(Map<String, dynamic> json){
    //log("JSON received: $json");
    //If the current batch number is less than the batch number we just received, set the current number to the received one
    if ((json["batchNumber"] as int? ?? -1) > _currentBatchNumber){
      //If the json field was null, the comparison should have failed; assume it was not null.
      _currentBatchNumber = json["batchNumber"] as int;
    }
    final theData = List<List<String>>.from((json["data"] as Iterable).map((e) => (e as List<dynamic>).cast<String>()));

    return ServerApiDto._internal(
      cid: json["cid"] as String?,
      tableName: json["tableName"] as String?,
      rowCount: (json["rowCount"] as int?) ?? -1,
      columns: (json["columns"] as List<dynamic>).cast<String>(),
      batchNumber: (json["batchNumber"] as int?) ?? -1,
      data: theData
    );
  }

  /// Create a new [ServerApiDto] by filling in the parameters. 
  /// 
  /// [batchNumber] is autofilled based on the current batch number. 
  factory ServerApiDto.fromParameters({
    required String cid,
    required String tableName,
    required int rowCount,
    required List<String> columns,
    required List<List<String>> data
  }){
    return ServerApiDto._internal(
      cid: cid,
      tableName: tableName,
      rowCount: rowCount,
      columns: columns,
      batchNumber: _currentBatchNumber++,
      data: data
    );
  }

  /// Creates a new, empty [ServerApiDto] using the default values and a valid batch number. 
  /// 
  factory ServerApiDto.empty() => ServerApiDto._internal(
      cid: "",
      tableName: "",
      rowCount: 0,
      columns: [],
      batchNumber: _currentBatchNumber++,
      data: [],
    );
  
  ///Determines whether or not the current DTO is empty.
  ///
  ///This depends on the rowCount, columns, and data fields. The CID and tableName may be filled to indicate which company and table this is for. 
  bool isEmpty(){
    final ServerApiDto emptyDto = ServerApiDto.empty();
    if (
      emptyDto.rowCount == rowCount
      && emptyDto.columns == columns
      && emptyDto.data == data
    ){
      return true;
    }
    return false;
  }

  /// Determines whether or not this instance is valid. 
  /// 
  /// An instance is valid if none of the fields are null or have a value < 0 (number fields only), 
  /// each data row and the column array have the same length, and the number of data rows matches the rowCount field.
  bool isValid(){
    if (
      rowCount < 0
      || batchNumber < 0
      || cid == null
      || tableName == null
      || columns == null
      || data == null
    ){
      return false;
    }

    if (data![0].length != columns!.length){
      return false;
    }

    if (data!.length != rowCount){
      return false;
    }

    return true;
  }

  /// Converts the current [ServerApiDto] to a JSON-convertable map and returns it. 
  /// 
  /// Every value is sent as a string for ease of parsing and to prevent network issues. 
  Map<String, dynamic> toJson(){
    final jsonMap = {
      "cid" : cid,
      "tableName" : tableName,
      "rowCount" : rowCount.toString(),
      "columns" : columns,
      "batchNumber" : _currentBatchNumber.toString(),
      "data" : data
    };

    return jsonMap;
  }

  @override
  String toString(){
    return "DataUpdateDto: {cid: $cid, tableName: $tableName, rowCount: $rowCount, columns: $columns, batchNumber: $_currentBatchNumber, data: $data}";
  }

  @override
  int get hashCode => Object.hashAll([cid, tableName, rowCount, columns, batchNumber, data]);
  
  @override
  bool operator ==(Object other) {
    const DeepCollectionEquality deepEqualsObj = DeepCollectionEquality();
    if (other is! ServerApiDto){
      return false;
    }
    else {
      if (
        other.cid == cid
        && other.tableName == tableName
        && listEquals(other.columns, columns)
        && other.rowCount == rowCount
        && other.batchNumber == batchNumber
        && deepEqualsObj.equals(other.data, data)
      ){
        return true;
      }
      else {
        return false;
      }
    }
  }

}

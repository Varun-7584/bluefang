// ignore_for_file: body_might_complete_normally_nullable, unused_field, cast_nullable_to_non_nullable

import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/vinParsing/vin_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class VinParsingRepository {
  final ICache _localRepository;
  VinParsingRepository(this._localRepository);

  Future<VinDTO?> getMakeNoAndVehType({required String wmi}) async {
    try {
      final result = await _localRepository.query(
        VinTablesDBFields.makeTypeTableName, 
        columns: [VinTablesDBFields.makeColumn, VinTablesDBFields.vehicleTypeColumn],
        where: "${VinTablesDBFields.makeTypeWmiColumn} = ?",
        whereArgs: [wmi]
      );

      final List<Map<String, Object?>> map = result.getOrElse(() => [{"" : null}]);
      //Relies on short-circuiting. If the map or either column is null, return null (because we didn't find what we needed).
      if (map.first.values.first == null || map.first[VinTablesDBFields.makeColumn] == null || map.first[VinTablesDBFields.vehicleTypeColumn] == null){
        return null;
      } 
      else {
        return VinDTO(makeNo: map.first[VinTablesDBFields.makeColumn] as int, vehType: map.first[VinTablesDBFields.vehicleTypeColumn] as int);
      }

    }
    catch(err){
      return null;
    }
  }

  Future<String?> getWmi({required int makeNumber, required int vehicleType}) async {
    try {
      final result = await _localRepository.query(
        VinTablesDBFields.makeTypeTableName, 
        columns: [VinTablesDBFields.makeTypeWmiColumn], 
        where: "${VinTablesDBFields.makeColumn} = ? AND ${VinTablesDBFields.vehicleTypeColumn} = ?",
        whereArgs: [makeNumber, vehicleType],
      );
      //log("Result: $result", name: "vin_suggestions_repository.dart");
      final map = result.getOrElse(() => [{VinTablesDBFields.makeTypeWmiColumn : null}]);
      return map.first[VinTablesDBFields.makeTypeWmiColumn] as String?;
    } catch (err){
      return null;
    }
  }

  Future<List<String>> getPossibleChars({required String wmi, required int year, required int position}) async {
    final List<String> charList = [];
    //Return next character of WMI if the position is less than 4
    if (position < 4){
      return [wmi[position - 1]];
    } else {
      try {
        final result = await _localRepository.query(
          VinTablesDBFields.suggestionsTableName, 
          columns: [VinTablesDBFields.suggestionsCharColumn], 
          where: "${VinTablesDBFields.suggestionsWmiColumn} = ? AND ${VinTablesDBFields.suggestionsYearColumn} = ? AND ${VinTablesDBFields.suggestionsPositionColumn} = ?",
          whereArgs: [wmi, year, position],
        );
        //log("Result: $result", name: "vin_suggestions_repository.dart");
        final List<Map<String, Object?>> map = result.fold((l) => [{VinTablesDBFields.suggestionsCharColumn : null}], (r) => r);
        for (final element in map) {
          //log(element.toString());
          charList.add(element[VinTablesDBFields.suggestionsCharColumn].toString());
        }
        //log("Char list: $charList", name: "vin_suggestions_repository.dart");
        return charList;
      } catch (err){
        return [];
      }
    }
  }  
}

class VinTablesDBFields {
  static const makeTypeTableName = "MakeType";
  static const suggestionsTableName = "UsedTypesWMIYearValidChars";
  static const makeTypeWmiColumn = "wmi";
  static const makeColumn = "makeNo";
  static const vehicleTypeColumn = "vehicleTypeNo";
  static const suggestionsWmiColumn = "WMI";
  static const suggestionsYearColumn = "Year";
  static const suggestionsPositionColumn = "Position";
  static const suggestionsCharColumn = "Char";
}

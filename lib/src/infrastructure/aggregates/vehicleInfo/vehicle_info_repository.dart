// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:bluefang/src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/aggregates/vehicleInfo/vehicle_info_dtos.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IVehicleInfoRepository)
class VehicleInfoRepository implements IVehicleInfoRepository {
  final ICache _localRepository;
  VehicleInfoRepository(this._localRepository);

  @override
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findAll() async {
    try {

      const String getVehicleInfo =
          """SELECT vehId, vehCustomJpg, vehStockJpg,dtUom, dtLifeMiles,vehModelId,vehType, Model_n_Fuel.vehMake, Model_n_Fuel.vehYear, Model_n_Fuel.vinId9 ,  Make.makeName, Sensor.dateTimeMod,Sensor.dateTimeRep, Vehicle.dtId,Model_n_Fuel.vinId9 FROM Vehicle JOIN Model_n_Fuel on trim(substr(Vehicle.vinId,1,8))||trim(substr(Vehicle.vinId,10,1)) = Model_n_Fuel.vinId9 JOIN Distance on Distance.dtId = Vehicle.dtId  JOIN Sensor on Sensor.dtId = Vehicle.dtId JOIN Make on Make.makeNo = Model_n_Fuel.vehMake""";

      final result = await _localRepository.rawQuery(getVehicleInfo);
      //log("Number of vehicles gotten: ${result.getOrElse(() => []).length}");
      final list = result
          .map((jsonList) => jsonList.map((json) {
                final Map<String, dynamic> newJSON =
                    Map<String, dynamic>.from(json);
                final veh = VehicleInfoDto.fromJson(newJSON).toDomain();
                //log("Got vehicle id from database: ${veh.vehId}", name: "vehicle_info_repository.dart");
                return veh;
          }).toImmutableList()).getOrElse(() {
            log("Error mapping vehicle info to list.", name: "vehicle_info_repository.dart");
            return throw 'Error while mapping to list';
          });
      return right(list);
    } catch (err) {
      log("Error getting all vehicle info: $err", name: "vehicle_info_repository.dart");
      return left(ValueFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findAllActive() async {
    try {
      final String getVehicleInfo =
          """SELECT vehId, vehCustomJpg, vehStockJpg,dtUom, dtLifeMiles,vehModelId,vehType, Model_n_Fuel.vehMake, Model_n_Fuel.vehYear, Model_n_Fuel.vinId9 ,  Make.makeName, Sensor.dateTimeMod, Sensor.dateTimeRep, Vehicle.dtId,Model_n_Fuel.vinId9 FROM Vehicle JOIN Model_n_Fuel on trim(substr(Vehicle.vinId,1,8))||trim(substr(Vehicle.vinId,10,1)) = Model_n_Fuel.vinId9 JOIN Distance on Distance.dtId = Vehicle.dtId  JOIN (SELECT * FROM Sensor WHERE Sensor.dateTimeRep > ${DateTime.now().millisecondsSinceEpoch - Duration(minutes: 5).inMilliseconds}) as Sensor on Sensor.dtId = Vehicle.dtId JOIN Make on Make.makeNo = Model_n_Fuel.vehMake""";

      final result = await _localRepository.rawQuery(getVehicleInfo);
      final list = result
          .map((jsonList) => jsonList.map((json) {
                final Map<String, dynamic> newJSON =
                    Map<String, dynamic>.from(json);
                final veh = VehicleInfoDto.fromJson(newJSON).toDomain();
                //log("Got vehicle id from database: ${veh.vehId}", name: "vehicle_info_repository.dart");
                return veh;
          }).toImmutableList()).getOrElse(() {
            log("Error mapping vehicle info to list.", name: "vehicle_info_repository.dart");
            return throw 'Error while mapping to list';
          });
      return right(list);
    } catch (err) {
      log("Error getting all active vehicle info: $err", name: "vehicle_info_repository.dart");
      return left(ValueFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findByVinId9(
      {required VinID9 vinID9}) async {
    try {
      final String getVehicleInfo =
          """SELECT vehId, vehCustomJpg, dtLifeMiles,vehModelId, Vehicle.dtId,Model_n_Fuel.vinId9 FROM Vehicle LEFT JOIN Model_n_Fuel on trim(substr(Vehicle.vinId,1,8))||trim(substr(Vehicle.vinId,10,1)) = Model_n_Fuel.vinId9 LEFT JOIN Distance on Distance.dtId = Vehicle.dtId WHERE Model_n_Fuel.vinId9 = ${vinID9.getOrCrash()}""";

      final result = await _localRepository.rawQuery(getVehicleInfo);
      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = VehicleInfoDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList()
          )
          .getOrElse(() {
            log("Error mapping vehicle info to list.", name: "vehicle_info_repository.dart");
            return throw 'Error while mapping to list';
          });
      return right(list);
    } catch (err) {
      log("Error finding vehicle info by VIN9.", name: "vehicle_info_repository.dart");
      return left(ValueFailure.databaseError(err: err));
    }
  }
}

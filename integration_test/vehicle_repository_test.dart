import 'dart:developer';
import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;

Future<void> main() async {
  Future<void> initDbManagers() async {
    await usersDbManager.init();
  }

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDbManagers();
    await configureInjection(injectable.Environment.prod);
  });

  log('❤️ Done with Getit');
  final vehicleRepo = getIt<IVehicleRepository>();
  group('CRUD test', () {
    group('Vehicle Test', () {
      test('Insert vehicle', () async {
        final Vehicle vehicle = Vehicle(
          vehId: VehID('input'),
          vehPlateId: VehPlateID('input'),
          vinId: VinID('1FADP3F28EL193257'),
          siteId: SiteID(5),
          dtId: DtID(1771095780),
          userIdMod: UserID(1234),
          dateTimeMod: DateTimeMod(DateTime.now()),
          userIdRep: UserID(1234),
          dateTimeRep: DateTimeMod(DateTime.now()),
        );
        final result = await vehicleRepo.add(vehicle: vehicle);
        log('🔒 $result', name: 'vehicle_repository_test.dart');
        expect(result.isRight(), true);
      });
      test('Inserting vehicle with wrong values should fail', () async {
        final Vehicle vehicle = Vehicle(
          vehId: VehID('input'),
          vehPlateId: VehPlateID('input'),
          vinId: VinID('1FADP3F28EL7'),
          siteId: SiteID(5),
          dtId: DtID(1771095780),
          userIdMod: UserID(1234),
          dateTimeMod: DateTimeMod(DateTime.now()),
          userIdRep: UserID(1234),
          dateTimeRep: DateTimeMod(DateTime.now()),
        );
        final result = await vehicleRepo.add(vehicle: vehicle);
        log('🔒 $result', name: 'vehicle_repository_test.dart');
        expect(result.isLeft(), true);
      });
      test(
          'Adding multiple vehicles when one of them has wrong values should fail',
          () async {
        final Vehicle vehicle = Vehicle(
          vehId: VehID('input 🔥'),
          vehPlateId: VehPlateID('input'),
          vinId: VinID('1FADP3F28EL193257'),
          siteId: SiteID(5),
          dtId: DtID(1771095780),
          userIdMod: UserID(1234),
          dateTimeMod: DateTimeMod(DateTime.now()),
          userIdRep: UserID(1234),
          dateTimeRep: DateTimeMod(DateTime.now()),
        );
        final Vehicle vehicle2 = Vehicle(
          vehId: VehID('input 🦄'),
          vehPlateId: VehPlateID('input'),
          vinId: VinID('1QADP3F28EL193257'),
          siteId: SiteID(5),
          dtId: DtID(1771095780),
          userIdMod: UserID(1234),
          dateTimeMod: DateTimeMod(DateTime.now()),
          userIdRep: UserID(1234),
          dateTimeRep: DateTimeMod(DateTime.now()),
        );
        final Vehicle vehicle3 = Vehicle(
          vehId: VehID('input 😛'),
          vehPlateId: VehPlateID('input'),
          vinId: VinID('1JADP3F28EL193257'),
          siteId: SiteID(5),
          dtId: DtID(1771095780),
          userIdMod: UserID(1234),
          dateTimeMod: DateTimeMod(DateTime.now()),
          userIdRep: UserID(1234),
          dateTimeRep: DateTimeMod(DateTime.now()),
        );
        try {
          await vehicleRepo.add(vehicle: vehicle);
          await vehicleRepo.add(vehicle: vehicle2);
          final result = await vehicleRepo.add(vehicle: vehicle3);

          expect(result.isRight(), true);
        } catch (e) {
          rethrow;
        }
      });

      test('should fetch all vehicles 🚊🚊🚊', () async {
        final result = await vehicleRepo.fetchAll();

        expect(result.isRight(), true);
      });

      test('should return a vehicle for an id', () async {
        final result = await vehicleRepo.find(dtID: DtID(1771095780));
        // final expectedResult = {dtID: 1d8fe224, siteID: 0, vehID: 3507, vehPlateID: 1553556, vinID: 1FDGF5GY4JEB75728, userIDMod: 811, dateTimeMod: 1627614966, userIDRep: 811, dateTimeRep: 1627614966};
        // print(result.getOrElse(() => throw 'Error'));
        expect(result.isRight(), true);
      });
    });
  });
}


// Code for initializing and registering databases manually.
  // await usersDbManager.init();
  // final db = await usersDbManager.db;
  // getIt.registerLazySingleton<LocalRepository>(() => LocalRepository(db));
  // getIt.registerLazySingleton<VehicleRepository>(
  //     () => VehicleRepository(getIt<LocalRepository>()));

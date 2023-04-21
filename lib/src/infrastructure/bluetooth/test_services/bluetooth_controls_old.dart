// import 'dart:async';

// import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
// import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
// import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
// import 'package:bluefang/src/domain/bluetooth/core/bluetooth_repository_failure.dart';
// import 'package:bluefang/src/domain/bluetooth/i_bluetooth_controls.dart';
// import 'package:bluefang/src/domain/bluetooth/i_bluetooth_service.dart';
// import 'package:bluefang/src/domain/core/i_repository.dart';
// import 'package:bluefang/src/domain/core/mt_changed_values.dart';
// import 'package:bluefang/src/domain/distance/distance.dart';
// import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
// import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
// import 'package:bluefang/src/domain/sensor/sensor.dart';
// import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
// import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
// import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
// import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/dtos/beacon_byte_compare_dtos.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/dtos/bfbluetoothscanresult_dtos.dart';
// import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
// import 'package:bluefang/src/infrastructure/distance/distance_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
// import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
// import 'package:bluefang/src/infrastructure/sensor/sensor_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/site/site_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
// import 'package:dartz/dartz.dart';

// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:injectable/injectable.dart';

// @dev
// @LazySingleton(as: IBluetoothControls)
// class BluetoothControlsOld with BitManipulation implements IBluetoothControls {
//   final IBluetoothService _bluetoothService;
//   final ISensorRepository _sensorRepository;
//   final IDistanceRepository _distanceRepository;
//   final IVehicleRepository _vehicleRepository;
//   final IRepository _iRepository;
//   final BeaconFactory _beaconFactory;

//   BluetoothControlsOld(
//       this._bluetoothService,
//       this._sensorRepository,
//       this._distanceRepository,
//       this._iRepository,
//       this._vehicleRepository,
//       this._beaconFactory);
//   @override
//   Either<BluetoothFailure, Stream<BFBluetoothScanResult>> returnScanResults() {
//     try {
//       // Start Scanning
//       Future.delayed(const Duration(milliseconds: 100), () {
//         _bluetoothService.stopScan();
//         _bluetoothService.startScan(
//           timeout: const Duration(seconds: 10),
//         );
//       });

//       final Stream<List<ScanResult>> scanResults =
//           _bluetoothService.returnScanResults() as Stream<List<ScanResult>>;
//       final Stream<BFBluetoothScanResult> bfScanResultStream =
//           scanResults.map((scanResultsList) {
//         if (scanResultsList.isEmpty) {
//           return BFBluetoothScanResult.nonStemcoBeacon();
//         } else {
//           final ScanResult scanResult = scanResultsList.last;
//           final BFBluetoothScanResult bfBluetoothScanResult =
//               BFBluetoothScanResultDtos.fromScanResults(scanResult).toDomain();
//           return bfBluetoothScanResult;
//         }
//       });

//       return right(bfScanResultStream);
//     } catch (err) {
//       return left(const BluetoothFailure.deviceNotFound());
//     }
//   }

//   @override
//   Either<dynamic, IBeacon> emitBeacons(
//       {required BFBluetoothScanResult scanResult}) {
//     try {
//       final Either<dynamic, IBeacon> beacon =
//           _beaconFactory.createBeacons(scanResult);
//       return beacon;
//     } catch (err) {
//       return left(
//           BluetoothRepositoryFailure.errorEmittingBeacons(err.toString()));
//     }
//   }

//   @override
//   Future<Either<SensorFailure, Sensor>> alreadyInSensor(DtID dtId) {
//     return _sensorRepository.isNewSensor(dtID: dtId);
//   }

//   @override
//   Future<Either<dynamic, Unit>> processStandardBeacon({
//     required StandardBeacon incomingStandardBeacon,
//     required StandardBeacon existingStandardBeacon,
//   }) async {
//     // Here, we are converting the current dtBtRaw value to full hex value so we can perform operations on it. s
//     try {
//       final DtID dtID = incomingStandardBeacon.dtID;
//       final String dtBtRaw = existingStandardBeacon.mtSensor.dtBtRaw;
//       final String currentDtIdInHex =
//           BitManipulation.intToHex(incomingStandardBeacon.dtID.getOrCrash());
//       final String currentHex =
//           "9706${currentDtIdInHex}00${existingStandardBeacon.mtSensor.dtBtRaw}00000";
//       final currentDtId = dtID.getOrCrash().toString();

//       final StandardBeaconByteCompareDto incomingHex =
//           StandardBeaconByteCompareDto.fromHex(incomingStandardBeacon.hex);
//       final StandardBeaconByteCompareDto existingDtBtRaw =
//           StandardBeaconByteCompareDto.fromDtBtRaw(
//               dtBtRaw: existingStandardBeacon.mtSensor.dtBtRaw,
//               dtId: incomingHex.dtId);

//       // Getting the vehicle which the beacon is associated with.

//       if (incomingHex.dtBtRaw != existingDtBtRaw.dtBtRaw) {
//         final vehicleResults = await _vehicleRepository.find(dtID: dtID);
//         final vehicle = vehicleResults
//             .getOrElse(() => throw Exception("Error getting vehicle"));
//         final value = await _distanceRepository.find(dtID: dtID);
//         final Distance distance = value.getOrElse(() => throw Exception(
//             '🥶: Error creating Distance Entity for dtID: $dtID. Value was retrieved from the database.'));
//         // Get
//         final int datetime = distance.dateTimeRep.getOrCrash();
//         final DateTime dateTimeRep =
//             DateTime.fromMillisecondsSinceEpoch(datetime);
//         final MTDistanceDto currentMTDistance = MTDistanceDto.fromHex(
//           currentHex,
//           distance.gpsLon.getOrCrash(),
//           distance.gpsLat.getOrCrash(),
//           distance.userIdMod.getOrCrash(),
//           distance.userIdRep.getOrCrash(),
//           distance.dateTimeMod.getOrCrash(),
//           distance.dateTimeRep.getOrCrash(),
//         );
//         if (incomingHex.stuatusRPD != existingDtBtRaw.stuatusRPD) {
//           final currSensor = await _sensorRepository.find(dtID: dtID);
//           final sensor =
//               currSensor.getOrElse(() => throw "Error getting sensor");

//           final MTSensorDto currentSensorHex = MTSensorDto.fromHex(
//               hex: currentHex,
//               userIdMod: 1234,
//               dateTimeMod: sensor.dateTimeMod.getOrCrash());
//           final MTSensorDto incomingSensorHex = MTSensorDto.fromHex(
//               hex: incomingStandardBeacon.hex,
//               userIdMod: 10,
//               dateTimeMod: DateTime.now().millisecondsSinceEpoch);
//           final MTChangedValues changedValues =
//               currentSensorHex.mtChangedValues(newValue: incomingSensorHex);

//           await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: SensorDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: SensorDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }

//         if (dateTimeRep.difference(DateTime.now()) > const Duration(hours: 6)) {
//           final MTDistanceDto incomingMTDistance = MTDistanceDto.fromHex(
//               incomingHex.hex,
//               10, // placeholder value for GPS lon
//               10, // placeholder value for GPS lat
//               1234, // UserIDMod value
//               1234, // UserIDRep value
//               DateTime.now().millisecondsSinceEpoch,
//               DateTime.now().millisecondsSinceEpoch);
//           final MTChangedValues changedValues =
//               currentMTDistance.mtChangedValues(newValue: incomingMTDistance);
//           await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: DistanceDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: DistanceDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }

//         if (incomingHex.fuelTypeAndCap != existingDtBtRaw.fuelTypeAndCap) {
//           final MTModelAndFuelDto currentModelAndFuel =
//               MTModelAndFuelDto.fromHex(
//                   hex: currentHex,
//                   userIdRep: 1234,
//                   dateTimeRep: DateTime.now().millisecondsSinceEpoch);
//           final MTModelAndFuelDto incomingModelAndFuel =
//               MTModelAndFuelDto.fromHex(
//                   hex: incomingHex.hex,
//                   userIdRep: 1234,
//                   dateTimeRep: DateTime.now().millisecondsSinceEpoch);

//           final MTChangedValues changedValues = currentModelAndFuel
//               .mtChangedValues(newValue: incomingModelAndFuel);

//           await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: ModelAndFuelDBFields.tableName,
//             primaryId: ModelAndFuelDBFields.primaryKey,
//             primaryIdValue:
//                 VinID9.fromVinId(vehicle.vinId.getOrCrash()).getOrCrash(),
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }

//         if (incomingHex.siteId != existingDtBtRaw.siteId) {
//           final MTSiteDto currentSiteValues = MTSiteDto.fromHex(
//             hex: currentHex,
//             userIdMod: 1234,
//             dateTimeRep: DateTime.now().millisecondsSinceEpoch,
//           );
//           final MTSiteDto incomingSiteValues = MTSiteDto.fromHex(
//             hex: incomingHex.hex,
//             userIdMod: 1234,
//             dateTimeRep: DateTime.now().millisecondsSinceEpoch,
//           );
//           final MTChangedValues changedValues =
//               currentSiteValues.mtChangedValues(newValue: incomingSiteValues);

//           await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: VehicleDBFields.tableName,
//             primaryId: VehicleDBFields.primaryKey,
//             primaryIdValue: currentDtId,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }
//         if (incomingHex.dtBtRaw != dtBtRaw) {
//           final Map<Object, List<Object?>> changedValues = {
//             SensorDBFields.dtBtRaw: [dtBtRaw, incomingHex.dtBtRaw]
//           };
//           final MTChangedValues mtChangedValues =
//               MTChangedValues(changedValues);
//           await _iRepository.scribeRoutine(
//             changedFields: mtChangedValues,
//             table: SensorDBFields.tableName,
//             primaryId: SensorDBFields.primaryKey,
//             primaryIdValue: currentDtId,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }
//         if (incomingHex.dtLifeMiles != existingDtBtRaw.dtLifeMiles) {
//           final MTDistanceDto incomingMTDistance = MTDistanceDto.fromHex(
//               incomingHex.hex,
//               10, // placeholder value for GPS lon
//               10, // placeholder value for GPS lat
//               1234, // UserIDMod value
//               1234, // UserIDRep value
//               DateTime.now().millisecondsSinceEpoch,
//               DateTime.now().millisecondsSinceEpoch);
//           final MTChangedValues changedValues =
//               currentMTDistance.mtChangedValues(newValue: incomingMTDistance);

//           await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: DistanceDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: DistanceDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId,
//           );
//         }
//       }

//       return right(unit);
//     } catch (err) {
//       return left(Exception(err));
//     }
//   }

//   @override
//   Future<Either<dynamic, Unit>> processBtBeacon3To6(
//       IVehicleBeacon beacon) async {
//     try {
//       final DtID dtId = beacon.dtID;
//       final String dtIdValue = dtId.getOrCrash().toString();
//       final vehicleOption = await _vehicleRepository.find(dtID: dtId);
//       final currVehicle = vehicleOption.getOrElse(() => throw Exception(
//           "[Bluetooth_controls]: Error retrieving vehicle value in processBtBeacon3To6 function."));
//       final BeaconType type = beacon.beaconTypes;
//       if (type == BeaconType.licensePlateNumberBeacon) {
//         final currentLicensePlate = currVehicle.vehPlateId.getOrCrash();
//         if (currentLicensePlate != beacon.payload) {
//           final MTChangedValues changedValues = MTChangedValues({
//             "vehPlateId": [currentLicensePlate, beacon.payload]
//           });
//           _iRepository.scribeRoutine(
//               changedFields: changedValues,
//               table: VehicleDBFields.tableName,
//               primaryId: VehicleDBFields.primaryKey,
//               primaryIdValue: dtIdValue,
//               dtID: dtId,
//               vehID: currVehicle.vehId);
//         }
//         return right(unit);
//       }
//       if (type == BeaconType.vehicleNumberBeacon) {
//         final vehicleNumber = currVehicle.vehId.getOrCrash();
//         if (vehicleNumber != beacon.payload) {
//           final MTChangedValues changedValues = MTChangedValues({
//             VehicleDBFields.vehId: [vehicleNumber, beacon.payload]
//           });
//           _iRepository.scribeRoutine(
//               changedFields: changedValues,
//               table: VehicleDBFields.tableName,
//               primaryId: VehicleDBFields.primaryKey,
//               primaryIdValue: dtIdValue,
//               dtID: dtId,
//               vehID: currVehicle.vehId);
//         }
//         return right(unit);
//       }
//       if (type == BeaconType.vinNumberBeacon) {
//         final vinNumber = currVehicle.vinId.getOrCrash();
//         if (vinNumber != beacon.payload) {
//           final MTChangedValues changedValues = MTChangedValues({
//             VehicleDBFields.vehId: [vinNumber, beacon.payload]
//           });
//           _iRepository.scribeRoutine(
//               changedFields: changedValues,
//               table: VehicleDBFields.tableName,
//               primaryId: VehicleDBFields.primaryKey,
//               primaryIdValue: dtIdValue,
//               dtID: dtId,
//               vehID: currVehicle.vehId);
//         }
//         return right(unit);
//       }
//       if (type == BeaconType.comboBeacon) {
//         //TODO need to implement this.
//         throw UnimplementedError();
//       } else {
//         return left(Exception("Wrong Beacon Type passed"));
//       }
//     } catch (err) {
//       return left(Exception(err));
//     }
//   }

//   @override
//   void stopScanning() {
//     _bluetoothService.stopScan();
//   }

//   @override
//   Future<Either<dynamic, Unit>> processNewBeacon(
//       {required StandardBeacon incomingStandardBeacon}) {
//     // TODO: implement processNewBeacon
//     throw UnimplementedError();
//   }
// }

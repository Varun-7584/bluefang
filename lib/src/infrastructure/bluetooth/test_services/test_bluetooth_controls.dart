// import 'package:bluefang/injection.dart';
// import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
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
// import 'package:bluefang/src/domain/location/bf_location_data.dart';
// import 'package:bluefang/src/domain/location/i_location_service.dart';
// import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
// import 'package:bluefang/src/domain/sensor/sensor.dart';
// import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
// import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
// import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
// import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/dtos/beacon_byte_compare_dtos.dart';
// import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
// import 'package:bluefang/src/infrastructure/distance/distance_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
// import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
// import 'package:bluefang/src/infrastructure/sensor/sensor_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/site/site_mt_dtos.dart';
// import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// @dev
// @LazySingleton(as: IBluetoothControls)
// class TestBluetoothControls with BitManipulation implements IBluetoothControls {
//   final IBluetoothService _bluetoothService;
//   final ISensorRepository _sensorRepository;
//   final IDistanceRepository _distanceRepository;
//   final IVehicleRepository _vehicleRepository;
//   final IRepository _iRepository;
//   final BeaconFactory _beaconFactory;

//   // These variables are used to control how many beacons we process.
//   // ignore: non_constant_identifier_names
//   final int NUMBER_OF_BEACONS = 1000;
//   int count = 0;

//   TestBluetoothControls(
//       this._bluetoothService,
//       this._sensorRepository,
//       this._distanceRepository,
//       this._iRepository,
//       this._vehicleRepository,
//       this._beaconFactory);
//   @override
//   Future<Either<SensorFailure, Sensor>> alreadyInSensor(DtID dtId) {
//     return _sensorRepository.isNewSensor(dtID: dtId);
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
//   Future<Either<dynamic, Unit>> processStandardBeacon({
//     required StandardBeacon incomingStandardBeacon,
//     required StandardBeacon existingStandardBeacon,
//   }) async {
//     try {
//       if (count < NUMBER_OF_BEACONS) {
//         count += 1;
//         processBtBeacon2(
//             standardBeacon: incomingStandardBeacon,
//             dtBtRaw: existingStandardBeacon.mtSensor.dtBtRaw);
//       }
//       return right(unit);
//     } catch (err) {
//       throw Exception("err");
//     }
//   }

//   Future<Either<dynamic, Unit>> processBtBeacon2({
//     required IBeacon standardBeacon,
//     required String dtBtRaw,
//   }) async {
//     // Here, we are converting the current dtBtRaw value to full hex value so we can perform operations on it. s
//     final String currentHex =
//         "9706${BitManipulation.intToHex(standardBeacon.dtID.getOrCrash())}00${dtBtRaw}00000";
//     final currentDtId = standardBeacon.dtID.getOrCrash().toString();
//     final int currentTimeInInt = DateTime.now().millisecondsSinceEpoch;
//     final StandardBeaconByteCompareDto incomingHex =
//         StandardBeaconByteCompareDto.fromHex(standardBeacon.hex);
//     final StandardBeaconByteCompareDto existingDtBtRaw =
//         StandardBeaconByteCompareDto.fromDtBtRaw(
//             dtBtRaw: dtBtRaw,
//             dtId: standardBeacon.dtID.getOrCrash().toString());

//     // Getting the vehicle which the beacon is associated with.
//     final vehicleResults =
//         await _vehicleRepository.find(dtID: standardBeacon.dtID);
//     final vehicle = vehicleResults
//         .getOrElse(() => throw Exception("Error getting vehicle"));
//     final BFLocationData bfLocationData =
//         await getIt<ILocationService>().getCurrentLocation();
//     if (incomingHex.dtBtRaw != existingDtBtRaw.dtBtRaw) {
//       final value = await _distanceRepository.find(dtID: standardBeacon.dtID);
//       final Distance distance = value.getOrElse(() => throw Exception(
//           '🥶: Error creating Distance Entity for dtID: ${standardBeacon.dtID}. Value was retrieved from the database.'));
//       // Get
//       final int datetime = distance.dateTimeRep.getOrCrash();
//       final DateTime dateTimeRep =
//           DateTime.fromMillisecondsSinceEpoch(datetime);
//       final MTDistanceDto currentMTDistance = MTDistanceDto.fromHex(
//         currentHex,
//         distance.gpsLon.getOrCrash(),
//         distance.gpsLat.getOrCrash(),
//         distance.userIdMod.getOrCrash(),
//         distance.userIdRep.getOrCrash(),
//         distance.dateTimeMod.getOrCrash(),
//         distance.dateTimeRep.getOrCrash(),
//       );

//       if (dateTimeRep.difference(DateTime.now()) > const Duration(hours: 6)) {
//         final MTDistanceDto incomingMTDistance = MTDistanceDto.fromHex(
//             incomingHex.hex,
//             bfLocationData.longitude, // placeholder value for GPS lon
//             bfLocationData.latitude, // placeholder value for GPS lat
//             1234, // UserIDMod value
//             1234, // UserIDRep value
//             currentTimeInInt,
//             currentTimeInInt);
//         final MTChangedValues changedValues =
//             currentMTDistance.mtChangedValues(newValue: incomingMTDistance);
//         await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: DistanceDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: DistanceDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }

//       if (incomingHex.dtLifeMiles != existingDtBtRaw.dtLifeMiles) {
//         final MTDistanceDto incomingMTDistance = MTDistanceDto.fromHex(
//             incomingHex.hex,
//             bfLocationData.longitude, // placeholder value for GPS lon
//             bfLocationData.latitude, // placeholder value for GPS lat
//             1234, // UserIDMod value
//             1234, // UserIDRep value
//             currentTimeInInt,
//             currentTimeInInt);
//         final MTChangedValues changedValues =
//             currentMTDistance.mtChangedValues(newValue: incomingMTDistance);

//         await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: DistanceDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: DistanceDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }

//       if (incomingHex.stuatusRPD != existingDtBtRaw.stuatusRPD) {
//         final currSensor =
//             await _sensorRepository.find(dtID: standardBeacon.dtID);
//         final sensor = currSensor.getOrElse(() => throw "Error getting sensor");

//         final MTSensorDto currentSensorHex = MTSensorDto.fromHex(
//             hex: currentHex,
//             userIdMod: 1234,
//             dateTimeMod: sensor.dateTimeMod.getOrCrash());
//         final MTSensorDto incomingSensorHex = MTSensorDto.fromHex(
//             hex: incomingHex.hex,
//             userIdMod: 1234,
//             dateTimeMod: DateTime.now().millisecondsSinceEpoch);
//         final MTChangedValues changedValues =
//             currentSensorHex.mtChangedValues(newValue: incomingSensorHex);

//         await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: SensorDBFields.tableName,
//             primaryIdValue: currentDtId,
//             primaryId: SensorDBFields.primaryKey,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }

//       if (incomingHex.fuelTypeAndCap != existingDtBtRaw.fuelTypeAndCap) {
//         final MTModelAndFuelDto currentModelAndFuel = MTModelAndFuelDto.fromHex(
//             hex: currentHex, userIdRep: 1234, dateTimeRep: currentTimeInInt);
//         final MTModelAndFuelDto incomingModelAndFuel =
//             MTModelAndFuelDto.fromHex(
//                 hex: incomingHex.hex,
//                 userIdRep: 1234,
//                 dateTimeRep: currentTimeInInt);

//         final MTChangedValues changedValues =
//             currentModelAndFuel.mtChangedValues(newValue: incomingModelAndFuel);

//         await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: ModelAndFuelDBFields.tableName,
//             primaryId: ModelAndFuelDBFields.primaryKey,
//             primaryIdValue:
//                 VinID9.fromVinId(vehicle.vinId.getOrCrash()).getOrCrash(),
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }

//       if (incomingHex.siteId != existingDtBtRaw.siteId) {
//         final MTSiteDto currentSiteValues = MTSiteDto.fromHex(
//           hex: currentHex,
//           userIdMod: 1234,
//           dateTimeRep: currentTimeInInt,
//         );
//         final MTSiteDto incomingSiteValues = MTSiteDto.fromHex(
//           hex: incomingHex.hex,
//           userIdMod: 1234,
//           dateTimeRep: currentTimeInInt,
//         );
//         final MTChangedValues changedValues =
//             currentSiteValues.mtChangedValues(newValue: incomingSiteValues);
//         await _iRepository.scribeRoutine(
//             changedFields: changedValues,
//             table: VehicleDBFields.tableName,
//             primaryId: VehicleDBFields.primaryKey,
//             primaryIdValue: currentDtId,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }
//       if (incomingHex.dtBtRaw != dtBtRaw) {
//         final Map<Object, List<Object?>> changedValues = {
//           SensorDBFields.dtBtRaw: [dtBtRaw, incomingHex.dtBtRaw]
//         };
//         final MTChangedValues mtChangedValues = MTChangedValues(changedValues);
//         await _iRepository.scribeRoutine(
//             changedFields: mtChangedValues,
//             table: SensorDBFields.tableName,
//             primaryId: SensorDBFields.primaryKey,
//             primaryIdValue: currentDtId,
//             dtID: vehicle.dtId,
//             vehID: vehicle.vehId);
//       }
//     }

//     return right(unit);
//   }

//   @override
//   Future<Either<dynamic, Unit>> processBtBeacon3To6(IBeacon hexBeacon) {
//     throw UnimplementedError();
//   }

//   @override
//   Either<BluetoothFailure, Stream<BFBluetoothScanResult>> returnScanResults() {
//     final Stream<List<BFBluetoothScanResult>> scanResults = _bluetoothService
//         .returnScanResults() as Stream<List<BFBluetoothScanResult>>;
//     final Stream<BFBluetoothScanResult> bfScanResultStream =
//         scanResults.map((scanResultsList) {
//       if (scanResultsList.isEmpty) {
//         return BFBluetoothScanResult.nonStemcoBeacon();
//       } else {
//         final BFBluetoothScanResult scanResult = scanResultsList.last;
//         return scanResult;
//       }
//     });
//     return right(bfScanResultStream);
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

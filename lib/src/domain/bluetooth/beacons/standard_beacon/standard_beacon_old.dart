// import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
// import 'package:bluefang/src/domain/core/failures.dart';
// import 'package:bluefang/src/domain/core/mt_mixin.dart';
// import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
// import 'package:bluefang/src/domain/site/site_value_objects.dart';
// import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
// import 'package:dartz/dartz.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'standard_beacon.freezed.dart';

// @freezed
// class StandardBeacon with _$StandardBeacon, MTMixin implements IBeacon {
//   const StandardBeacon._();
//   const factory StandardBeacon({
//     required String hexValue,
//     required int manufacturerId, // 0-1 Byte
//     required DtID dtId, // 2-5 bytes
//     // tells the parser what the format of the rest of the beacon is (4 bits)
//     required BeaconType beaconType,
//     // Real time data. Not stored in SQLlite db
//     required int directionOfRotation,
//     required int motionBit, // Real time data. Not stored in SQLlite db
//     required bool dirValid, // Real time data. Not stored in SQLlite db
//     // Byte 7
//     required bool vehicleBeaconEnabled,
//     required bool licensePlateBeaconEnabled,
//     required bool vinBeaconEnabled,
//     required DtReprogrammable dtReprogrammable,
//     required DtLocked dtLocked,
//     required DtSecure dtSecure,
//     required DtLoBat dtLoBat,
//     required DtUOM dtUom,
//     // Byte 8
//     required DtModCount dtModCount,
//     required DtRPD dtRpd, // Byte 9-10a (4 bits)
//     required DtFirmVerBT5Ap dtFirmVerBT5Ap, //Byte 10b. (4 bits)
//     required DtFirmVerBT5Sdk dtFirmVerBT5Sdk, // Byte 11a (4 bits)
//     required VehFuelType vehFuelType, // Byte 11 b (4 bits)
//     required VehFuelCapacity vehFuelCapacity, // Byte 12-13
//     required SiteID siteID, // Byte 14
//     required DtLifeMiles dtLifeMiles, // Byte 15-17
//     // Byte 18-19. This denotes the company ID that is eligible to program this device - part of the security solution.
//     required int companyId,
//     // Byte 20a. MSP430 Firmware Version (4 bits)
//     required DtFirmVerMsp dtFirmVerMsp,
//     // Byte 20b-21. This is a 12 bit value of the rotational frequency. realtime only. Not stored in DB.
//     required int rotationalFrequency,
//     // Byte 22. Rotational Angle. Realtime only. Not stored in DB.
//     required int rotationalAngle,
//   }) = _StandardBeacon;

//   factory StandardBeacon.fromJson(Map<String, Object> json) {
//     return StandardBeacon(
//       hexValue: json["hexValue"].toString(),
//       manufacturerId: int.parse(json["manufacturerId"].toString()),
//       dtId: DtID(int.parse(json["dtId"].toString())),
//       beaconType: BeaconType.standardBeacon,
//       directionOfRotation: int.parse(json["directionOfRotation"].toString()),
//       motionBit: int.parse(json["motionBit"].toString()),
//       dirValid: int.parse(json["dirValid"].toString()) == 1 && true,
//       vehicleBeaconEnabled:
//           int.parse(json["vehicleBeaconEnabled"].toString()) == 1 && true,
//       licensePlateBeaconEnabled:
//           int.parse(json["licensePlateBeaconEnabled"].toString()) == 1 && true,
//       vinBeaconEnabled:
//           int.parse(json["vinBeaconEnabled"].toString()) == 1 && true,
//       dtreprogrammable:
//           Dtreprogrammable(int.parse(json["dtReprogrammable"].toString())),
//       dtLocked: DtLocked(int.parse(json["dtLocked"].toString())),
//       dtSecure: DtSecure(int.parse(json["dtSecure"].toString())),
//       dtLoBat: DtLoBat(int.parse(json["dtLoBat"].toString())),
//       dtUom: DtUOM(int.parse(json["dtUom"].toString())),
//       dtModCount: DtModCount(int.parse(json["dtModCount"].toString())),
//       dtRpd: DtRPD(int.parse(json["dtRpd"].toString())),
//       dtFirmVerBT5Ap:
//           DtFirmVerBT5Ap(int.parse(json["dtFirmVerBT5Ap"].toString())),
//       dtFirmVerBT5Sdk:
//           DtFirmVerBT5Sdk(int.parse(json["dtFirmVerBT5Sdk"].toString())),
//       vehFuelType: VehFuelType(int.parse(json["vehFuelType"].toString())),
//       vehFuelCapacity:
//           VehFuelCapacity(double.parse(json["vehFuelCapacity"].toString())),
//       siteID: SiteID(int.parse(json["siteId"].toString())),
//       dtLifeMiles: DtLifeMiles(int.parse(json["dtLifeMiles"].toString())),
//       companyId: int.parse(json["companyId"].toString()),
//       dtFirmVerMsp: DtFirmVerMsp(int.parse(json["dtFirmVerMsp"].toString())),
//       rotationalFrequency: int.parse(json["rotationalFrequency"].toString()),
//       rotationalAngle: int.parse(json["rotationalAngle"].toString()),
//     );
//   }

//   Option<ValueFailure<dynamic>> get failureOption {
//     return dtId.failureOrUnit
//         .andThen(dtLifeMiles.failureOrUnit)
//         .andThen(dtSecure.failureOrUnit)
//         .andThen(dtLocked.failureOrUnit)
//         .andThen(dtreprogrammable.failureOrUnit)
//         .andThen(dtLoBat.failureOrUnit)
//         .andThen(dtUom.failureOrUnit)
//         .andThen(dtModCount.failureOrUnit)
//         .andThen(siteID.failureOrUnit)
//         .andThen(dtLifeMiles.failureOrUnit)
//         .andThen(dtRpd.failureOrUnit)
//         .andThen(dtFirmVerMsp.failureOrUnit)
//         .andThen(dtFirmVerBT5Ap.failureOrUnit)
//         .andThen(dtFirmVerBT5Sdk.failureOrUnit)
//         .andThen(vehFuelType.failureOrUnit)
//         .andThen(vehFuelCapacity.failureOrUnit)
//         .fold(
//           (f) => some(f),
//           (r) => none(),
//         );
//   }

//   @override
//   DtID get dtID => dtId;
//   @override
//   BeaconType get beaconTypes => beaconType;

//   void processBeacon(IBeacon previousBeacon) {
//     // TODO: implement processBeacon
//   }

//   @override
//   // TODO: implement mtTracked
//   List<Object> get mtTracked => toJson().keys.toList();

//   @override
//   Map<String, Object?> toJson() {
//     return {
//       'hex': hexValue,
//       'manufacturerId': manufacturerId,
//       'dtId': dtID,
//       'beaconType': beaconType,
//       'directionOfRotation': directionOfRotation,
//       'motionBit': motionBit,
//       'dirValid': dirValid,
//       'licensePlateBeaconEnabled': licensePlateBeaconEnabled,
//       'vehicleBeaconEnabled': vehicleBeaconEnabled,
//       'vinBeaconEnabled': vinBeaconEnabled,
//       'dtReprogrammable': dtreprogrammable.getOrCrash(),
//       'dtLocked': dtLocked.getOrCrash(),
//       'dtSecure': dtSecure.getOrCrash(),
//       'dtLoBat': dtLoBat.getOrCrash(),
//       'dtUom': dtUom.getOrCrash(),
//       'dtModCount': dtModCount.getOrCrash(),
//       'dtRpd': dtRpd.getOrCrash(),
//       'dtFirmVerBT5Ap': dtFirmVerBT5Ap.getOrCrash(),
//       'dtFirmVerBT5Sdk': dtFirmVerBT5Sdk.getOrCrash(),
//       'vehFuelType': vehFuelType.getOrCrash(),
//       'vehFuelCapacity': vehFuelCapacity.getOrCrash(),
//       'siteId': siteID.getOrCrash(),
//       'dtLifeMiles': dtLifeMiles.getOrCrash(),
//       'companyId': companyId,
//       'dtFirmVerMsp': dtFirmVerMsp.getOrCrash(),
//       'rotationalFrequency': rotationalFrequency,
//       'rotationalAngle': rotationalAngle,
//     };
//   }

//   @override
//   // TODO: implement hex
//   String get hex => hexValue;
// }

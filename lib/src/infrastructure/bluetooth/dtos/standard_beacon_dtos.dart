// import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
// import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon.dart';
// import 'package:bluefang/src/domain/site/site_value_objects.dart';
// import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../domain/sensor/sensor_value_objects.dart';

// part 'standard_beacon_dtos.freezed.dart';

// @freezed
// class StandardBeaconDto with _$StandardBeaconDto, BitManipulation {
//   const StandardBeaconDto._();
//   const factory StandardBeaconDto({
//     required String manufacturerId,
//     required String dtId,
//     required String beaconType,
//     required String directionOfRotation,
//     required String motionBit,
//     required bool dirValid,
//     required bool vehicleBeaconEnabled,
//     required bool licensePlateBeaconEnabled,
//     required bool vinBeaconEnabled,
//     required String dtreprogrammable,
//     required String dtLocked,
//     required String dtSecure,
//     required String dtLoBat,
//     required String dtUom,
//     required String dtModCount,
//     required String dtRpd,
//     required String dtFirmVerBT5Ap,
//     required String dtFirmVerBT5Sdk,
//     required String vehFuelType,
//     required String vehFuelCapacity,
//     required String siteId,
//     required String dtLifeMiles,
//     required String companyId,
//     required String dtFirmVerMsp,
//     required String rotationalFrequency,
//     required String rotationalAngle,
//   }) = _StandardBeaconDto;

//   factory StandardBeaconDto.fromDomain(StandardBeacon standardBeacon) {
//     return StandardBeaconDto(
//       manufacturerId: standardBeacon.manufacturerId.toString(),
//       dtId: standardBeacon.dtId.getOrCrash().toString(),
//       beaconType: standardBeacon.beaconType.toString(),
//       directionOfRotation: standardBeacon.directionOfRotation.toString(),
//       motionBit: standardBeacon.motionBit.toString(),
//       dirValid: standardBeacon.dirValid,
//       vehicleBeaconEnabled: standardBeacon.vehicleBeaconEnabled,
//       licensePlateBeaconEnabled: standardBeacon.licensePlateBeaconEnabled,
//       vinBeaconEnabled: standardBeacon.vinBeaconEnabled,
//       dtreprogrammable: standardBeacon.dtreprogrammable.getOrCrash().toString(),
//       dtLocked: standardBeacon.dtLocked.getOrCrash().toString(),
//       dtSecure: standardBeacon.dtSecure.getOrCrash().toString(),
//       dtLoBat: standardBeacon.dtLoBat.getOrCrash().toString(),
//       dtUom: standardBeacon.dtUom.getOrCrash().toString(),
//       dtModCount: standardBeacon.dtModCount.getOrCrash().toString(),
//       dtRpd: standardBeacon.dtRpd.getOrCrash().toString(),
//       dtFirmVerBT5Ap: standardBeacon.dtFirmVerBT5Ap.getOrCrash().toString(),
//       dtFirmVerBT5Sdk: standardBeacon.dtFirmVerBT5Sdk.getOrCrash().toString(),
//       vehFuelType: standardBeacon.vehFuelType.getOrCrash().toString(),
//       vehFuelCapacity: standardBeacon.vehFuelCapacity.getOrCrash().toString(),
//       siteId: standardBeacon.siteID.getOrCrash().toString(),
//       dtLifeMiles: standardBeacon.dtLifeMiles.getOrCrash().toString(),
//       companyId: standardBeacon.companyId.toString(),
//       dtFirmVerMsp: standardBeacon.dtFirmVerMsp.getOrCrash().toString(),
//       rotationalFrequency: standardBeacon.rotationalFrequency.toString(),
//       rotationalAngle: standardBeacon.rotationalAngle.toString(),
//     );
//   }

//   StandardBeacon toDomain() {
//     return StandardBeacon(
//       hexValue: ,
//       manufacturerId: int.parse(manufacturerId),
//       dtId: DtID(int.parse(dtId)),
//       beaconType: BeaconType.standardBeacon,
//       directionOfRotation: int.parse(directionOfRotation),
//       motionBit: int.parse(motionBit),
//       dirValid: dirValid,
//       vehicleBeaconEnabled: vehicleBeaconEnabled,
//       licensePlateBeaconEnabled: licensePlateBeaconEnabled,
//       vinBeaconEnabled: vinBeaconEnabled,
//       dtReprogrammable: DtReprogrammable(int.parse(dtReprogrammable)),
//       dtLocked: DtLocked(int.parse(dtLocked)),
//       dtSecure: DtSecure(int.parse(dtSecure)),
//       dtLoBat: DtLoBat(int.parse(dtLoBat)),
//       dtUom: DtUOM(int.parse(dtUom)),
//       dtModCount: DtModCount(int.parse(dtModCount)),
//       dtRpd: DtRPD(int.parse(dtRpd)),
//       dtFirmVerBT5Ap: DtFirmVerBT5Ap(int.parse(dtFirmVerBT5Ap)),
//       dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(int.parse(dtFirmVerBT5Sdk)),
//       vehFuelType: VehFuelType(int.parse(vehFuelType)),
//       vehFuelCapacity: VehFuelCapacity(int.parse(vehFuelCapacity) / 10),
//       siteID: SiteID(int.parse(siteId)),
//       dtLifeMiles: DtLifeMiles(int.parse(dtLifeMiles)),
//       companyId: int.parse(companyId),
//       dtFirmVerMsp: DtFirmVerMsp(int.parse(dtFirmVerMsp)),
//       rotationalFrequency: int.parse(rotationalFrequency),
//       rotationalAngle: int.parse(rotationalAngle),
//     );
//   }

//   factory StandardBeaconDto.fromBitJson(Map<String, dynamic> json) {
//     return StandardBeaconDto(
      
//       manufacturerId:
//           int.parse(json['manufacturerId'].toString(), radix: 2).toString(),
//       dtId: int.parse(json['dtId'].toString(), radix: 2).toString(),
//       beaconType: int.parse(json['beaconType'].toString(), radix: 2).toString(),
//       directionOfRotation: json['directionOfRotation'].toString(),
//       motionBit: json['motionBit'].toString(),
//       dirValid: json['dirValid'] == 1 && true,
//       licensePlateBeaconEnabled: json['licensePlateBeaconEnabled'] == 1 && true,
//       vehicleBeaconEnabled: json['vehicleBeaconEnabled'] == 1 && true,
//       vinBeaconEnabled: json['vinBeaconEnabled'] == 1 && true,
//       dtreprogrammable: json['dtreprogrammable'].toString(),
//       dtLocked: json['dtLocked'].toString(),
//       dtSecure: json['dtSecure'].toString(),
//       dtLoBat: json['dtLoBat'].toString(),
//       dtUom: int.parse(json['dtUom'].toString(), radix: 2).toString(),
//       dtModCount: int.parse(json['dtModCount'].toString(), radix: 2).toString(),
//       dtRpd: int.parse(json['dtRpd'].toString(), radix: 2).toString(),
//       dtFirmVerBT5Ap:
//           int.parse(json['dtFirmVerBT5Ap'].toString(), radix: 2).toString(),
//       dtFirmVerBT5Sdk:
//           int.parse(json['dtFirmVerBT5Sdk'].toString(), radix: 2).toString(),
//       vehFuelType:
//           int.parse(json['vehFuelType'].toString(), radix: 2).toString(),
//       vehFuelCapacity:
//           int.parse(json['vehFuelCapacity'].toString(), radix: 2).toString(),
//       siteId: int.parse(json['siteId'].toString(), radix: 2).toString(),
//       dtLifeMiles:
//           int.parse(json['dtLifeMiles'].toString(), radix: 2).toString(),
//       companyId: int.parse(json['companyId'].toString(), radix: 2).toString(),
//       dtFirmVerMsp:
//           int.parse(json['dtFirmVerMsp'].toString(), radix: 2).toString(),
//       rotationalFrequency:
//           int.parse(json['rotationalFrequency'].toString(), radix: 2)
//               .toString(),
//       rotationalAngle:
//           int.parse(json['rotationalAngle'].toString(), radix: 2).toString(),
//     );
//   }

//   Map<String, Object?> toJson() => {
//         'manufacturerId': manufacturerId,
//         'dtId': dtId,
//         'beaconType': beaconType,
//         'directionOfRotation': directionOfRotation,
//         'motionBit': motionBit,
//         'dirValid': dirValid,
//         'licensePlateBeaconEnabled': licensePlateBeaconEnabled,
//         'vehicleBeaconEnabled': vehicleBeaconEnabled,
//         'vinBeaconEnabled': vinBeaconEnabled,
//         'dtreprogrammable': dtreprogrammable,
//         'dtLocked': dtLocked,
//         'dtSecure': dtSecure,
//         'dtLoBat': dtLoBat,
//         'dtUom': dtUom,
//         'dtModCount': dtModCount,
//         'dtRpd': dtRpd,
//         'dtFirmVerBT5Ap': dtFirmVerBT5Ap,
//         'dtFirmVerBT5Sdk': dtFirmVerBT5Sdk,
//         'vehFuelType': vehFuelType,
//         'vehFuelCapacity': vehFuelCapacity,
//         'siteId': siteId,
//         'dtLifeMiles': dtLifeMiles,
//         'companyId': companyId,
//         'dtFirmVerMsp': dtFirmVerMsp,
//         'rotationalFrequency': rotationalFrequency,
//         'rotationalAngle': rotationalAngle,
//       };
// }

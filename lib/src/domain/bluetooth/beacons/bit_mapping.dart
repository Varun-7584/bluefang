// import 'package:bluefang/src/domain/bluetooth/beacons/byte_extractor.dart';

// // ignore: avoid_classes_with_only_static_members
// class StandardBeaconBitMapping {
//   static ByteInterval manufacturerId =
//       ByteInterval(startNumber: 0, endNumber: 1, endSide: 2);
//   static ByteInterval dtId =
//       ByteInterval(startNumber: 2, endNumber: 5, endSide: 2);
//   static HalfByte beaconType = HalfByte(number: 6, side: 1);
//   static StatusBits directionOfRotation = StatusBits(byte: 6.5, position: 1);
//   static StatusBits motionBit = StatusBits(byte: 6.5, position: 2);
//   static StatusBits dirValid = StatusBits(byte: 6.5, position: 3);
//   static StatusBits licensePlateBeaconEnabled =
//       StatusBits(byte: 6.5, position: 4);
//   static StatusBits vehicleBeaconEnabled = StatusBits(byte: 7, position: 1);
//   static StatusBits vinBeaconEnabled = StatusBits(byte: 7, position: 2);
//   static StatusBits dtReprogrammable = StatusBits(byte: 7, position: 3);
//   static StatusBits dtLocked = StatusBits(byte: 7, position: 4);
//   static StatusBits dtSecure = StatusBits(byte: 7, position: 5);
//   static StatusBits lowBat = StatusBits(byte: 7, position: 6);
//   static StatusBits dtUom = StatusBits(byte: 7, position: 7, numberOfBits: 2);
//   static ByteInterval dtModCount = ByteInterval(
//     startNumber: 8,
//     endNumber: 8,
//     endSide: 2,
//   );
//   static ByteInterval dtRpd =
//       ByteInterval(startNumber: 9, endNumber: 10, endSide: 1);
//   static HalfByte dtFirmVerBT5Ap = HalfByte(number: 10, side: 2);
//   static HalfByte dtFirmVerBT5Sdk = HalfByte(number: 11, side: 1);
//   static HalfByte vehFuelType = HalfByte(number: 11, side: 2);
//   static ByteInterval vehFuelCapacity =
//       ByteInterval(startNumber: 12, endNumber: 13, endSide: 2);
//   static ByteInterval siteId = ByteInterval(
//     startNumber: 14,
//     endNumber: 14,
//     endSide: 2,
//   );
//   static ByteInterval dtLifeMiles =
//       ByteInterval(startNumber: 15, endNumber: 17, endSide: 2);
//   static ByteInterval companyId =
//       ByteInterval(startNumber: 18, endNumber: 19, endSide: 2);
//   static HalfByte dtFirmVerMsp = HalfByte(number: 20, side: 1);
//   static ByteInterval rotationalFrequency =
//       ByteInterval(startNumber: 20, startSide: 2, endNumber: 21, endSide: 2);
//   static ByteInterval rotationalAngle =
//       ByteInterval(startNumber: 22, endNumber: 22, endSide: 2);
// }

// // ignore: avoid_classes_with_only_static_members
// class InfoBeaconBitMapping {
//   static ByteInterval manufacturerId =
//       ByteInterval(startNumber: 0, endNumber: 1, endSide: 2);
//   static ByteInterval dtId =
//       ByteInterval(startNumber: 2, endNumber: 5, endSide: 2);
//   static HalfByte beaconType = HalfByte(number: 6, side: 1);
//   static HalfByte stringLength = HalfByte(number: 6, side: 2);
//   static ByteInterval payload =
//       ByteInterval(startNumber: 7, endNumber: 23, endSide: 2);
// }

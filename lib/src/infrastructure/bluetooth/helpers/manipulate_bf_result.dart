import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ManipulateBFResult with BitManipulation {
  String bfScanResultToHex(BFBluetoothScanResult scanResult) {
    final Map<int, List<int>> mapOfBytes =
        scanResult.advertisementData.manufacturerData;
    final List<int> listOfBytes = mapOfBytes.entries.first.value;
    // if (kDebugMode) {
    //   print('🪵 [manipulate_bf_result] listOfBytes: $listOfBytes');
    // }
    final String partialHexWithoutIdentifier =
        BitManipulation.listOfBytesToHex(listOfBytes);
    const String stemcoIdentifierNumber = "9706";
    final String completeHexDataFromBeacon =
        "$stemcoIdentifierNumber$partialHexWithoutIdentifier";
    return completeHexDataFromBeacon;
  }

  // Map<String, Object?> bfResultToJson(
  //     BFBluetoothScanResult scanResult, BfJsonOutputType type) {
  //   final String hex = bfScanResultToHex(scanResult);
  //   final binary = BitManipulation.hexToBinary(hex);
  //   // if (kDebugMode) {
  //   //   print(hex);
  //   // }
  //   if (type == BfJsonOutputType.bit) {
  //     // TODO: fix this
  //     // return binaryToJson(binary);
  //     return {};
  //   } else {
  //     // return hexToJson(hex);
  //     return {};
  //   }
  // }
}

enum BfJsonOutputType { bit, hex }

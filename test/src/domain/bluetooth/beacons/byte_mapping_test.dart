import 'package:bluefang/src/domain/bluetooth/beacons/byte_mapping.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('half bytes', () {
    test("half bytes addition feature", () {
      const Map<String, String> listOfbytes = {
        "0": "97",
        "1": "06",
        "2": "0E",
        "3": "58",
        "4": "8B",
        "5": "76",
        "6": "1A",
        "7": "3A",
        "8": "01",
        "9": "1D",
        "10": "B0",
        "11": "04",
        "12": "0E",
        "13": "C9",
        "14": "00",
        "15": "00",
        "16": "02",
        "17": "A6",
        "18": "00",
        "19": "00",
        "20": "00",
        "21": "00",
        "22": "7B"
      };
      final BeaconBytesRepresentation bytesRepresentation =
          BeaconBytesRepresentation(listOfbytes);
      final halfByteRep = bytesRepresentation.halfByte(
          number: 10, side: ByteSide.firstHalf, parse: false);
      final intervalRep =
          bytesRepresentation.byteInterval(start: 9, end: 9, parse: false);
      final String valueRep = intervalRep + halfByteRep;
      expect(valueRep, "1DB");
    });
  });
}

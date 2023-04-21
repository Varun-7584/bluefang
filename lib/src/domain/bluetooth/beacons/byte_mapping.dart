import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/failures.dart';

class BeaconBytesRepresentation {
  late Map<String, String> listOfBytes;

  BeaconBytesRepresentation(Map<String, String> bytes) {
    if (bytes.isEmpty) {
      throw InvalidValue(failedValue: bytes);
    }
    listOfBytes = bytes;
  }

  Map<String, String> generateByteToHexMap(String hexValue) {
    final Map<String, String> byteMap = {};
    int byteNumber = 0;
    for (int i = 0; i < hexValue.length; i = i + 2) {
      byteMap.putIfAbsent(
          byteNumber.toString(), () => hexValue.substring(i, i + 2));
      byteNumber += 1;
    }
    return byteMap;
  }

  String halfByte({required int number, required ByteSide side, bool? parse}) {
    final bool parseValue = parse ?? true;
    return HalfByte(listOfBytes, number: number, side: side, parse: parseValue)
        .extractValue();
  }

  String byteInterval({required int start, required int end, bool? parse}) {
    final bool parseValue = parse ?? true;
    return ByteInterval(listOfBytes, start: start, end: end, parse: parseValue)
        .extractValue();
  }

  String partialBits(
      {required int byteNumber,
      required int startBit,
      required int numberOfBits}) {
    return PartialBits(listOfBytes,
            byteNumber: byteNumber,
            numberOfBits: numberOfBits,
            startBit: startBit)
        .extractValue();
  }
}

abstract class BytesRepresentation {
  String extractValue();

  String getHexValueFromListOfBytes();

  String operator +(BytesRepresentation anotherByte) {
    final String extractedValue = extractValue() + anotherByte.extractValue();
    return extractedValue;
  }
}

class HalfByte extends BeaconBytesRepresentation
    implements BytesRepresentation {
  int number;
  ByteSide side;
  bool parse;

  HalfByte(Map<String, String> listOfBytes,
      {required this.number, required this.side, required this.parse})
      : super(listOfBytes);

  @override
  String getHexValueFromListOfBytes() {
    final String key = number.toString();
    if (listOfBytes.containsKey(key)) {
      assert(listOfBytes[key]?.length == 2);
      if (side == ByteSide.firstHalf) {
        return listOfBytes[key]![0];
      }
      if (side == ByteSide.secondHalf) {
        return listOfBytes[key]![1];
      } else {
        throw Exception(
            "Incorrect Side Passed. StackTrace: ${StackTrace.current}");
      }
    } else {
      throw Exception("Key $key doesn't exist");
    }
  }

  @override
  String extractValue() {
    final String hexHalfByte = getHexValueFromListOfBytes();
    final String decimalValue =
        BitManipulation.hexToDecimal(hexHalfByte).toString();
    final String output = parse ? decimalValue : hexHalfByte;
    return output;
  }

  @override
  String operator +(BytesRepresentation anotherByte) {
    return anotherByte.extractValue() + extractValue();
  }
}

class PartialBits extends BeaconBytesRepresentation
    implements BytesRepresentation {
  int byteNumber;
  int startBit;
  int numberOfBits;

  PartialBits(
    Map<String, String> listOfBytes, {
    required this.byteNumber,
    required this.startBit,
    required this.numberOfBits,
  }) : super(listOfBytes);

  @override
  String extractValue() {
    final String hexValue = getHexValueFromListOfBytes();
    final String binaryRepresentationOfHex =
        BitManipulation.hexToBinary(hexValue);
    final outputBuffer = StringBuffer();
    //this is because we assume the bytes to go from 1 to 8. But they are stored in the array from 0 to 7.
    int indexOfBitToAdd = startBit - 1;
    for (int i = 0; i < numberOfBits; i++) {
      outputBuffer.write(binaryRepresentationOfHex[indexOfBitToAdd]);
      indexOfBitToAdd += 1;
    }
    return BitManipulation.binaryToDecimal(outputBuffer.toString()).toString();
  }

  @override
  String operator +(BytesRepresentation anotherByte) {
    return anotherByte.extractValue() + extractValue();
  }

  @override
  String getHexValueFromListOfBytes() {
    final String key = byteNumber.toString();
    if (listOfBytes.containsKey(key)) {
      return listOfBytes[key]!;
    } else {
      throw Exception("Key $key doesn't exist");
    }
  }
}

enum ByteSide { firstHalf, secondHalf }

// BYTE INTERVAL CLASS.
class ByteInterval extends BeaconBytesRepresentation
    implements BytesRepresentation {
  int start;
  int end;
  bool parse;
  ByteInterval(Map<String, String> listOfBytes,
      {required this.start, required this.end, required this.parse})
      : super(listOfBytes);

  @override
  String extractValue() {
    final String hexValue = getHexValueFromListOfBytes();

    if (parse) {
      final String decimalValue =
          BitManipulation.hexToDecimal(hexValue).toString();
      return decimalValue;
    } else {
      return hexValue;
    }
  }

  @override
  String operator +(BytesRepresentation anotherByte) {
    return anotherByte.extractValue() + extractValue();
  }

  @override
  String getHexValueFromListOfBytes() {
    final outputBuffer = StringBuffer();
    final int endValue =
        end > listOfBytes.length ? listOfBytes.length - 1 : end;
    for (int i = start; i <= endValue; i += 1) {
      final String key = i.toString();
      if (listOfBytes.containsKey(key)) {
        outputBuffer.write(listOfBytes[key]);
      } else {
        throw Exception("Key $i doesn't exist");
      }
    }
    return outputBuffer.toString();
  }
}

// ignore_for_file:  use_string_buffers, unnecessary_string_interpolations, avoid_classes_with_only_members

import 'dart:developer';

import 'package:convert/convert.dart' as convert;
import 'package:sqflite/utils/utils.dart';

// ignore: avoid_classes_with_only_static_members
class BitManipulation {
  /// Takes part of a beacon from the DataTrac and converts it from 6-bit to 8-bit ASCII.
  ///
  /// author: Bailie Livingston
  ///
  /// Expects beaconPiece to be a hex string. First character must be the beacon type.
  /// Beacon length cannot be more than one character (or three characters for the combo beacon, one for each part).
  static String getASCIIValuesForBeaconPiece(String beaconPiece) {
    int beaconType;
    String translated = "";
    int vehNumLength;
    int vinLength;
    int licensePlateLength;

    //Determine beacon type - this affects the rest of the process
    beaconType = int.parse(beaconPiece[0]);

    //Combo beacon
    if (beaconType == 6) {
      //Vehicle number
      //Get length of beacon payload.
      //Every three hex numbers = 2 6-bit ASCII chars; multiply by 3 and divide by 2 to get number of hex chars; round up
      vehNumLength = (int.parse("0x${beaconPiece[1]}") * 3 / 2).ceil();
      log("Vehicle number length: $vehNumLength");
      translated += ascii6To8(beaconPiece.substring(4, 4 + vehNumLength));

      //VIN
      //Get length of beacon payload.
      //Every three hex numbers = 2 6-bit ASCII chars; multiply by 3 and divide by 2 to get number of hex chars; round up
      vinLength = ((int.parse("0x${beaconPiece[2]}") + 16) * 3 / 2).ceil();
      log("VIN length: $vinLength\nNumber of chars: ${int.parse("0x${beaconPiece[2]}") + 16}");
      translated += ascii6To8(beaconPiece.substring(
          4 + vehNumLength, 4 + vehNumLength + vinLength));

      //License plate
      //Get length of beacon payload.
      //Every three hex numbers = 2 6-bit ASCII chars; multiply by 3 and divide by 2 to get number of hex chars; round up
      licensePlateLength = (int.parse("0x${beaconPiece[3]}") * 3 / 2).ceil();
      log("License plate length: $licensePlateLength");
      translated += ascii6To8(beaconPiece.substring(
          4 + vehNumLength + vinLength,
          4 + vehNumLength + vinLength + licensePlateLength));
    }
    //Vehicle number, VIN, or license plate beacons
    else if (beaconType == 3 || beaconType == 4 || beaconType == 5) {
      translated += ascii6To8(beaconPiece.substring(2));
    }
    //Standard
    else if (beaconType & 0x1 == 1) {
      //Standard beacon doesn't use 6-bit ASCII, so nothing needs to change
      return beaconPiece;
    }

    return translated;
  }

  static String _convertAsciiToCharacters(String listOfASCII) {
    String output = "";
    final messageList = listOfASCII.split(" ");
    messageList.removeLast();
    for (final String value in messageList) {
      final String char = String.fromCharCode(int.parse(value));
      output += char;
    }
    return output;
  }

  static String getPayloadFromVehBeacons(String beacon) {
    final String beaconPiece = beacon.substring(12, beacon.length);
    final String listOfAscii = getASCIIValuesForBeaconPiece(beaconPiece);
    final String output = _convertAsciiToCharacters(listOfAscii);
    return output;
  }

  /// Designed specifically for hex strings too long to directly convert to binary
  static String hexToBinary(String hexStr) {
    String binStr = "";

    //log("Hex string: $hexStr", name: "hexToBinary");
    assert(hexStr.length.isEven);
    if (hexStr.length.isOdd) {
      log("Error: expected length to be an even number.",
          level: 1, name: "hexToBinary");
      return "Error: expected length to be an even number";
      //Try not returning the error as a string. Very hard for debugging.
    }
    //Two hex chars make 1 byte
    for (int i = 0; i < hexStr.length; i += 2) {
      binStr += (int.parse("${hexStr[i]}${hexStr[i + 1]}", radix: 16))
          .toRadixString(2)
          .padLeft(8, "0");
      //log("Hex char pair: ${hexStr[i]}${hexStr[i+1]}; binary char: ${(int.parse("${hexStr[i]}${hexStr[i + 1]}", radix: 16)).toRadixString(2)}");
      //binStr += int.parse(tempStr, radix: 2).toString();
    }

    return binStr;
  }

  static String intToHex(int integer) {
    return integer.toRadixString(16);
  }

  static String hexToBinaryDefault(String hex) {
    return int.parse(hex, radix: 16).toRadixString(2);
  }

  static int hexToDecimal(String hex) {
    return int.parse(hex, radix: 16);
  }

  static int binaryToDecimal(String binary) {
    return int.parse(binary, radix: 2);
  }

  static String listOfBytesToHex(List<int> bytes) {
    return hex(bytes);
  }

  static List<int> hexToListOfBytes(String hexValue) {
    return convert.hex.decode(hexValue);
  }

  /// Converts from 6-bit ASCII to 8-bit ASCII (standard ASCII).
  ///
  /// Expects beaconPiece to be a hex string. First character must be the beacon type.
  /// Beacon length cannot be more than one character.
  ///
  /// Every three hex characters are translated into two ASCII characters.
  /// If there are fewer than three hex characters left, the remaining characters are treated as a single ASCII character.
  static String ascii6To8(String input) {
    String eightBit = "";
    int inputLen = 0;
    String temp;
    int parseResult;
    const int offset = 32;

    inputLen = input.length;
    try {
      log("Input: $input", name: "ascii6To8");
      //Every three hex characters make up 2 6-bit groups
      for (int i = 0; i < inputLen; i += 3) {
        if (inputLen - i < 3) {
          temp = (int.parse("0x${input.substring(i)}")).toRadixString(2);
          log("Temp: $temp");
          //Check if Flutter dropped the leadng 0 when converting to binary
          if (temp.length % 2 != 0) {
            log("Leading 0 dropped.");
            eightBit +=
                (int.parse(temp.substring(0, 5), radix: 2) + offset).toString();
            eightBit += " ";
            parseResult = int.parse(temp.substring(5), radix: 2) + offset;
            // If parseResult <= offset, then the number was 0 or negative, meaning invalid
            if (parseResult > offset) {
              eightBit += parseResult.toString();
              eightBit += " ";
            }
          } else {
            log("Leading 0 not dropped.");
            eightBit +=
                (int.parse(temp.substring(0, 6), radix: 2) + offset).toString();
            eightBit += " ";
            parseResult = int.parse(temp.substring(6), radix: 2) + offset;
            // If parseResult <= offset, then the number was 0 or negative, meaning invalid
            if (parseResult > offset) {
              eightBit += parseResult.toString();
              eightBit += " ";
            }
          }
        } else {
          temp = (int.parse("0x${input.substring(i, i + 3)}")).toRadixString(2);
          log("Temp: $temp");
          //Check if Flutter dropped the leadng 0 when converting to binary
          if (temp.length < 12) {
            log("Leading 0 dropped.");
            eightBit +=
                (int.parse(temp.substring(0, 5), radix: 2) + offset).toString();
            eightBit += " ";
            parseResult = int.parse(temp.substring(5), radix: 2) + offset;
            // If parseResult <= offset, then the number was 0 or negative, meaning invalid
            if (parseResult > offset) {
              eightBit += parseResult.toString();
              eightBit += " ";
            }
          } else {
            log("Leading 0 not dropped.");
            eightBit +=
                (int.parse(temp.substring(0, 6), radix: 2) + offset).toString();
            eightBit += " ";
            parseResult = int.parse(temp.substring(6), radix: 2) + offset;
            // If parseResult <= offset, then the number was 0 or negative, meaning invalid
            if (parseResult > offset) {
              eightBit += parseResult.toString();
              eightBit += " ";
            }
          }
        }
      }
    } catch (e, s) {
      log("Error converting from 6 to 8 bit ascii: ",
          name: "ascii6To8", error: e, stackTrace: s);
    }

    return eightBit;
  }

  static int murmrHash(BigInt input){
    BigInt inputCopy = input.toUnsigned(32);
    BigInt rotatingCopy;
    const int c1 = 0xcc9e2d51;
    const int r1 = 15;
    const int c2 = 0x1b873593;
    const int r2 = 13;
    const int m = 5; 
    const int n = 0xe6546b64;
    const int c3 = 0x85ebca6b;
    BigInt finalHash = BigInt.from(0x9974d7df);
    const int len = 4;
    log("Starting hash.");
    //Multipy by c1
    inputCopy = (inputCopy.toUnsigned(32) * BigInt.from(c1)).toUnsigned(32);
    log("Hash: ${inputCopy.toRadixString(16)}");
    //Rotate left 15 bits (r1)
    inputCopy = ((inputCopy.toUnsigned(32) << r1).toUnsigned(32) | ((inputCopy >= BigInt.zero) ? inputCopy >> (32 - r1) : ~(~inputCopy >> (32 - r1))).toUnsigned(32)).toUnsigned(32);
    log("Rotate left by r1: ${inputCopy.toRadixString(16)}");
    //Multiply by c2
    inputCopy = (inputCopy.toUnsigned(32) * BigInt.from(c2).toUnsigned(32)).toUnsigned(32);
    log("Multiply by c2: ${inputCopy.toRadixString(16)}");
    //XOR inputCopy onto hash, which currently contains the seed
    finalHash = (finalHash.toUnsigned(32) ^ inputCopy.toUnsigned(32)).toUnsigned(32);
    log("XOR with copy of input: ${finalHash.toRadixString(16)}");
    //Rotate finalHash left by r2
    rotatingCopy = finalHash.toUnsigned(32);
    finalHash = (finalHash.toUnsigned(32) << r2).toUnsigned(32);
    rotatingCopy = (rotatingCopy >> 32 - r2).toUnsigned(32);
    finalHash = (finalHash.toUnsigned(32) | rotatingCopy.toUnsigned(32)).toUnsigned(32);
    log("Rotate left by r2: ${finalHash.toRadixString(16)}");
    //Multiply by m and add n
    finalHash = (finalHash.toUnsigned(32) * BigInt.from(m).toUnsigned(32) + BigInt.from(n).toUnsigned(32)).toUnsigned(32);
    log("Multiply by M and add N: ${finalHash.toRadixString(16)}");
    //XOR hash with hardcoded length value of 4
    finalHash = (finalHash.toUnsigned(32) ^ BigInt.from(len).toUnsigned(32)).toUnsigned(32);
    log("XOR with 4: ${finalHash.toRadixString(16)}");
    //Shift hash right by 16 and XOR result
    finalHash = (finalHash.toUnsigned(32) ^ (finalHash.toUnsigned(32) >> 16)).toUnsigned(32);
    log("Shift right by 16 and XOR with previous value: ${finalHash.toRadixString(16)}");
    //Multiply by constant
    finalHash = (finalHash.toUnsigned(32) * BigInt.from(c3).toUnsigned(32)).toUnsigned(32);
    log("Multiply by c3: ${finalHash.toRadixString(16)}");
    //Shift hash right by 13 and XOR result
    finalHash = (finalHash.toUnsigned(32) ^ (finalHash.toUnsigned(32) >> r2)).toUnsigned(32);
    log("Shift right by 13 and XOR result: ${finalHash.toRadixString(16)}");
    //Multiply by c4
    finalHash = (finalHash.toUnsigned(32) * BigInt.from(0xc2b2ae35).toUnsigned(32)).toUnsigned(32);
    log("Multiply by c4: ${finalHash.toRadixString(16)}");
    //XOR the hash with itself shifted right by 16
    finalHash = (finalHash.toUnsigned(32) ^ (finalHash.toUnsigned(32) >> 16)).toUnsigned(32);

    log("Final hash value: ${finalHash.toRadixString(16).toUpperCase()}");

    if (!finalHash.toUnsigned(32).isValidInt){
      finalHash = finalHash % BigInt.from(232);
    }

    return finalHash.toUnsigned(32).toInt();
  }
}

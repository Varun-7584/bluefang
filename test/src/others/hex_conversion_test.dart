// ignore_for_file: unused_local_variable
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final data = [
    1,
    9,
    32,
    2,
    30,
    188,
    36,
    193,
    193,
    32,
    196,
    60,
    58,
    17,
    130,
    217,
    89,
    127,
    246,
    40,
    47,
    118,
    48,
    145,
    75,
    134,
    160
  ];
  final data2 = [
    4,
    128,
    0,
    54,
    31,
    250,
    1,
    238,
    72,
    0,
    0,
    139,
    94,
    33,
    0,
    20,
    123,
    17,
    36,
    14,
    201
  ];
  // print(250.toRadixString(16));

  // print(BitManipulation.hexToBinary('fa'));
  // const hexData = 'FF9706048000361FFA01EE4800008B5E2100147B11240EC9';
  // ProcessBeacon on hexData1
  // Attach the remaining DtId and manufacture's id.
  // Then extract the bits.
  // const String hexData1 = '1FFA01EE4800008B5E2100147B11240EC9';
  // final BitManipulation bitManipulation = BitManipulation();
  // final String processedBeacon = bitManipulation.processBeacon(hexData1);
  // print(processedBeacon);
  // if (processedBeacon == hexData1) {
  //   print('Same');
  // } else {
  //   print('different');
  // }
  // var x = hex.decode(hexData);
  // var x = hex(data2);
  // print(x);
  // print(data2.length);
  // 11111010

  const String hexString = "97061D8FE0A4123A011DB0080EC900000000000000007B";
  final listOfBytes = hex.decode(hexString);
  if (kDebugMode) {
    print(listOfBytes);
  }
  expect(1, 1);
}
// [151, 6, 29, 143, 224, 164, 18, 58, 1, 29, 176, 8, 14, 201, 0, 0, 0, 20, 0, 0, 0, 0, 123]
// [151, 6, 29, 143, 224, 164, 18, 58, 1, 29, 176, 8, 14, 201, 0, 0, 0, 0, 0, 0, 0, 0, 123]

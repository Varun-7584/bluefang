// ignore: avoid_classes_with_only_static_members
class BeaconTestData {
  static String customHex = "97061D8FE0A4123A011DB0080EC900000014000000007B";
  static String defaultHex = "97060E588b761000010000000000000000000000000000";
  static String dtBtRaw = "FA01EE4800008B5E2100147B112";
  static String binary =
      "1001011100000110000001001000000000000000001101100001111111111010000000011110111001001000000000000000000010001011010111100010000100000000000101000111101100010001001001000000111011001001";
  static String incomingCustomHex =
      "1D8FE0A4123A011DB0080EC900000014000000007B";
  static final List<int> listCustomHexBytes = [
    29,
    143,
    224,
    164,
    18,
    58,
    1,
    29,
    176,
    8,
    14,
    201,
    0,
    0,
    0,
    40,
    0,
    0,
    0,
    0,
    123
  ];

  // This is the original beacon that we have in excel spreadsheet right now.
  static final List<int> listOriginalBeacon = [
    4,
    128,
    0,
    54,
    16,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
}
// BFBluetoothScanResult(device: BFBluetoothDevice(id: Value(Right(Closure: <Y0>(Y0) => Y0 from Function 'id': static.)), name: ), advertisementData: BFAdvertisementData(localName: , txPowerLevel: null, connectable: true, manufacturerData: {1687: [29, 143, 224, 164, 18, 58, 1, 29, 176, 8, 14, 201, 0, 0, 0, 0, 0, 0, 0, 0, 123]}, serviceData: {}, serviceUuids: []), rssi: -52)

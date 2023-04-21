// ignore: depend_on_referenced_packages
import 'package:convert/convert.dart';
import 'package:flutter/foundation.dart';

void main() {
  Stream<String> getBeacons() async* {
    // const String standardBeacon =
    //     "069748000370100000000000000000000000000000000";
    const String defaultHexBeacon =
        "9706048000361000000000000000000000000000000000";

    const String vehicleBeacon = "9706048000363C8628E49669E8A6AAEC";
    const String licensePlateBeacon = "9706048000365C4524D45565D8650452";
    const String vinBeacon = "97060480003641566E62626A9146B8905D261648";

    while (true) {
      await Future.delayed(const Duration(seconds: 1)); //10 seconds
      yield defaultHexBeacon;
      await Future.delayed(const Duration(seconds: 4)); //240 seconds
      yield vehicleBeacon;
      await Future.delayed(const Duration(seconds: 4)); // 240 seconds
      yield licensePlateBeacon;
      await Future.delayed(const Duration(seconds: 4)); //240 seconds
      yield vinBeacon;
    }
  }

  getBeacons().listen((event) {
    final bytes = hex.decode(event);
    if (kDebugMode) {
      print(bytes);
    }
  });

  // group('Creation of beacon', () {
  //   test('should return a proper beacon', () {
  //     getBeacons().listen((event) {
  //       var binary = int.parse(event, radix: 16).toRadixString(2);
  //       print(binary);
  //       expect(binary, 1);
  //     });
  //   });
  // });
}

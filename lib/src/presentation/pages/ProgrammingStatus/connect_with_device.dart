// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_final_locals, unused_local_variable
import 'dart:developer';

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../../../package/bit_manipulation/bit_manipulation.dart';

class ConnectWithDevice extends StatefulWidget {
  final ProgrammedDataTrac dataTrac;
  final Map<String, dynamic> changedValuesMap;
  const ConnectWithDevice(
      {Key? key, required this.dataTrac, required this.changedValuesMap})
      : super(key: key);

  @override
  State<ConnectWithDevice> createState() => _ConnectWithDeviceState();
}

class _ConnectWithDeviceState extends State<ConnectWithDevice> {
  @override
  void initState() {
    FlutterBluePlus.instance.startScan();
    super.initState();
  }

  List<BluetoothService> services = [];
  bool isServicesDiscovered = false;

  Widget flutterBlue() {
    return StreamBuilder<List<ScanResult>>(
      stream: FlutterBluePlus.instance.scanResults,
      initialData: const [],
      builder: (c, snapshot) => Column(
        children: snapshot.data!.map((r) {
          // Rest of the work.
          if (r.advertisementData.manufacturerData.containsKey(1687)) {
            final mapOfBytes = r.advertisementData.manufacturerData;
            final List<int> listOfBytes = mapOfBytes.entries.first.value;
            final String incomingPartialHexWithoutIdentifier =
                BitManipulation.listOfBytesToHex(listOfBytes);
            final hexDataTracId = widget.dataTrac.sensor.dtId.getOrCrash();
            final dtIDhexString = hexDataTracId.toRadixString(16);
            final device = r.device;

            if (incomingPartialHexWithoutIdentifier
                .contains(dtIDhexString.toUpperCase())) {
              device.connect(autoConnect: false).then((value) {
                if (kDebugMode) {
                  print("[connect_with_device.dart] Connected");
                }
                return connectedWidget(device);
              });

              return connectedWidget(device);
            } else {
              return const Text("not connecting");
            }
          } else {
            return const SizedBox();
          }
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return flutterBlue();
  }
}

Widget connectedWidget(BluetoothDevice device) {
  return FutureBuilder(
      future: device.discoverServices(),
      builder: (context, snapshot) {
        return StreamBuilder<List<BluetoothService>>(
            stream: device.services,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final services = snapshot.data!;
                services.forEach((service) {
                  service.characteristics.forEach((char) {
                    log("Char: ${char.uuid.toString()}");
                    const rxChar = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
                    const txChar = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
                    if (char.uuid.toString() == rxChar) {
                      List<int> existingBeacon = [49, 50, 51, 52, 53];
                      log(
                          "Writing $existingBeacon to characteristic $char");
                      char.write(existingBeacon).then((value) {
                        log("Finished Writing to charateristic $char ");
                      });

                      //  char
                      //      .read()
                      //      .then((value) => log("Reading Value: $value"));
                    }
                  });
                });
              }
              log("Service Stream Data: ${snapshot.data}");
              return Column(
                children: [
                  Text(snapshot.data.toString()),
                ],
              );
            });
      });
}

Widget connectedWidget1(BluetoothDevice device) {
  return const Text("Connected");
}

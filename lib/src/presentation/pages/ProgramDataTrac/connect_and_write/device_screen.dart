import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceScreen extends StatefulWidget {
  final BluetoothDevice device;

  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  void initState() {
    widget.device.connect(autoConnect: false).then((value) {
      widget.device.discoverServices();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.device.services.listen((service) {
      for (final s in service) {
        log("Service UUID: ${s.uuid}", name: "device_screen.dart");
        if (s.uuid.toString() == "6e400001-b5a3-f393-e0a9-e50e24dcca9e") {
          for (final char in s.characteristics) {
            const rxChar = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
            const txChar = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
            log("Char UUID: ${char.uuid}");
            if (char.uuid.toString() == txChar) {
              char.write([49, 50, 51]);
              log("Written for char $char");
            }
            if (char.uuid.toString() == rxChar) {
              char.setNotifyValue(true);
            }
          }
        }
      }
    });

    return Scaffold(
      appBar: bFAppBar(title: "Writing to DataTrac"),
      // 6e400001-b5a3-f393-e0a9-e50e24dcca9e
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
          Column(
            children: [
              BFText.body("Writing to the device."),
            ]
          )
      )
    );
  }
}

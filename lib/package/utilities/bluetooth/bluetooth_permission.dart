
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bluefang_ui/src/shared/app_colors.dart';
import '../../bluefang_ui/src/widgets/bluefang_text.dart';

class BluetoothFunctions {

  static Future<void> checkBluetoothStatus(bool _isBluetoothOn, setState) async {
    final FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
    bool? isOn = await bluetooth.isOn;
    setState(() {
      _isBluetoothOn = isOn!;
    });
  }

  static Future<void> checkBluetoothPermission() async {
    var permissionStatus = await Permission.bluetooth.status;
    if (!permissionStatus.isGranted) {
      await Permission.bluetooth.request();
    }
  }

  static Future<void> showBluetoothDialog(BuildContext context, bool _isBluetoothOn) async {
    if (!_isBluetoothOn) {
      final FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
      bool? isOn = await bluetooth.isOn;
      if (!isOn!) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: BFText.headingOne(
                  "Allow Fleet Manager to Access Your Bluetooth?"),
              content: BFText.body(
                  "If you do not turn on or allow the app to use Bluetooth, "
                      "the Bluetooth capabilities will not work."),
              actions: [
                TextButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: Text("Allow"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Exist",
                      style: TextStyle(color: kcErrorColor)),
                ),
              ],
            );
          },
        );
      } else {
        _isBluetoothOn = true;
      }
    }
  }
}

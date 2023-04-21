import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/connect_and_write/connect_to_datatrac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class CheckForBluetooth extends StatelessWidget {
  const CheckForBluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return const ConnectToDataTrac();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);
  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(title: "Bluetooth Off"),
      body: BFText.body("Bluetooth is off"),
    );
  }
}

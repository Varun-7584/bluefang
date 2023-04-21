import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/connect_and_write/device_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectToDataTrac extends StatefulWidget {
  const ConnectToDataTrac({Key? key}) : super(key: key);
  @override
  State<ConnectToDataTrac> createState() => _ConnectToDataTracState();
}

class _ConnectToDataTracState extends State<ConnectToDataTrac> {
  @override
  void initState() {
    FlutterBluePlus.instance.startScan(
      timeout: const Duration(seconds: 10),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(title: "Connecting to datatrac"),
      body: StreamBuilder<List<ScanResult>>(
          stream: FlutterBluePlus.instance.scanResults,
          initialData: const [],
          builder: (c, snapshot) {
            return Column(
              children: snapshot.data!.map((r) {
                if (r.advertisementData.manufacturerData.containsKey(1687)) {
                  return BFButtons(
                    title: "Program Datatrac",
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return DeviceScreen(device: r.device);
                      }),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }).toList(),
            );
          }),
    );
  }
}

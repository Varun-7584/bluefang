// ignore_for_file: prefer_const_constructors

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DtBatteryLevel extends HookWidget {
  final String batteryLevel;
  const DtBatteryLevel({Key? key, required this.batteryLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: "Battery Level",
      leadingIcon: Icons.battery_full,
      subtext: int.parse(batteryLevel) == 1
          ? AppLocalizations.of(context)!.batteryLow
          : AppLocalizations.of(context)!.batteryFine,
    );
  }
}

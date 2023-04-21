import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/signal_strength.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DtSignalStrength extends HookWidget {
  final SignalStrength data;
  const DtSignalStrength({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: "Signal Strength (dBm)",
      leadingIcon: Icons.wifi,
      subtext:
          "${AppLocalizations.of(context)!.last}: ${data.lastRead} ${AppLocalizations.of(context)!.max}: ${data.maxValue} \n${AppLocalizations.of(context)!.avg}: ${data.average} ${AppLocalizations.of(context)!.dev}: ${data.standardDeviation}",
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DtStandardBeaconRaw extends HookWidget {
  String rawBeacon;
  DtStandardBeaconRaw({Key? key, required this.rawBeacon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.standardRawBeacon,
      imagePath: "assets/images/SignalStrength.png",
      subtext: rawBeacon.length > 13
          ? rawBeacon.substring(13, rawBeacon.length)
          : rawBeacon,
    );
  }
}

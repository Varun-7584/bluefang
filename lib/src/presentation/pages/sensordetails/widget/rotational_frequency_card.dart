import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DtRotationalFrequency extends HookWidget {
  final int data;
  const DtRotationalFrequency({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.rotFreq,
      imagePath: "assets/images/BroadcastTower.png",
      subtext: "$data ${AppLocalizations.of(context)!.hz}",
    );
  }
}

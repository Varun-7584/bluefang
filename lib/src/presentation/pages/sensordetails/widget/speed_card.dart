import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehSpeed extends HookWidget {
  final double data;
  const VehSpeed({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.speed,
      leadingIcon: Icons.speed,
      subtext:
          "$data ${AppLocalizations.of(context)!.km}/${AppLocalizations.of(context)!.hourAbbrev} CW",
    );
  }
}

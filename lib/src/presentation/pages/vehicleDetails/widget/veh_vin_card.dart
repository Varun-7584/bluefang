import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehVinCard extends HookWidget {
  final String vinText;

  /// Displays the vehicle's VIN.
  const VehVinCard({Key? key, required this.vinText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.vin,
      subtext: vinText,
      imagePath: "assets/images/VINIcon.png",
    );
  }
}

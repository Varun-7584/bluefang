import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehSiteCard extends HookWidget {
  final String vehSiteName;

  /// Displays the vehicle's home site.
  const VehSiteCard({Key? key, required this.vehSiteName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
        text: AppLocalizations.of(context)!.site,
        subtext: vehSiteName,
        imagePath: "assets/images/SiteIcon.png");
  }
}

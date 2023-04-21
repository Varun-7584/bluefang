import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Card to display the security status of the data trac.
///
/// Note: if you change the value isSecure should match in order to prove it has an error, then change it in the sensor_details_screen.dart file as well.
class DtSecurityStatusField extends HookWidget {
  final String isSecure;
  const DtSecurityStatusField({Key? key, required this.isSecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.securityStatus,
      leadingIcon: Icons.security_rounded,
      subtext:
          int.parse(isSecure) == 1 ? AppLocalizations.of(context)!.passwordProtected 
          : AppLocalizations.of(context)!.notProtected,
    );
  }
}

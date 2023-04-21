import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/widget/hide_fuel_field.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/widget/hide_license_plate_field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

double bxheight = 10;

class ProgramDataTracSettingsScreen extends StatefulWidget {
  const ProgramDataTracSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProgramDataTracSettingsScreen> createState() =>
      _ProgramDataTracSettingsScreenState();
}

class _ProgramDataTracSettingsScreenState
    extends State<ProgramDataTracSettingsScreen> {
  final enableFuelField = EnableFuelField();

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Program DataTrac Settings",
        'firebase_screen_class': "ProgramDataTracSettingsScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(
          title: "Program DataTrac SVT Screen Settings",
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          })),
      backgroundColor: kcWhite,
      body: Column(
        children: <Widget>[
          enableFuelField,
          EnableLicensePlateField(),
        ],
      ),
    );
  }
}

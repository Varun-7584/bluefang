// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/pages/fluids/enable_atf_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/enable_coolant_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/enable_def_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/enable_oil_field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

double bxheight = 10;

class FluidsSettingsScreen extends StatefulWidget {
  FluidsSettingsScreen({Key? key}) : super(key: key);

  @override
  State<FluidsSettingsScreen> createState() => _FluidsSettingsScreenState();
}

class _FluidsSettingsScreenState extends State<FluidsSettingsScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Fluids Settings Screen",
        'firebase_screen_class': "FluidsSettingsScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bFAppBar(
          title: "Fluids Display Settings",
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          })),
      backgroundColor: kcWhite,
      body: Column(
        children: <Widget>[
          EnableOilField(),
          EnableCoolantField(),
          EnableAtfField(),
          EnableDefField()
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/pages/auth/sign_in.dart';
import 'package:bluefang/src/presentation/pages/auth/start_tracking.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import '../core/screens/app_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // await FirebaseAnalytics.instance.logEvent(
    //   name: 'screen_view',
    //   parameters: {
    //     'firebase_screen': "Splash Screen",
    //     'firebase_screen_class': "SplashPage",
    //   },
    // );
    Timer(const Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> AppWidget()));
    });
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = Platform.localeName.split('_')[0];
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: languageCode == "es"?AssetImage("assets/images/splash_spanish.png"):languageCode == "fr"?AssetImage("assets/images/splash_french.png"):AssetImage("assets/images/splash_english.png"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
        ));
  }

  Widget _buildLogo() {
    return Column(
      children: [
        BFText.headingOne(
          'BlueFang',
          fontWeight: FontWeight.bold,
          color: kcWhite,
        ),
      ],
    );
  }
}

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Signin",
        'firebase_screen_class': "SigninPage",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildHeaderIcons(context),
              const SizedBox(
                height: 20,
              ),
              _buildLogo(),
              const SizedBox(
                height: 20,
              ),
              _buildUi(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BFText.headingOne(
            'Welcome Back!',
            fontWeight: FontWeight.w800,
          ),
          BFText.caption(
            'Signin to your webbat account',
            fontWeight: FontWeight.w600,
          )
        ],
      );

  Widget _buildUi() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[_signIn()],
          ),
        ),
      );

  Widget _signIn() => Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          BFTextInput(
            hintText: 'Company ID',
            inputType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          BFTextInput(
            hintText: 'User ID',
            inputType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          BFTextInput(
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          BFButtons(
              title: 'Signin',
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacementNamed(
                    context, GlobalRoutes.fleetManager);
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  Widget _buildHeaderIcons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const BFIconBuilder(
            iconData: Icons.close,
            onlyIcon: true,
            iconSize: 20,
          ),
        ),
        // InkWell(
        //   borderRadius: BorderRadius.circular(5),
        //   onTap: () {},
        //   child: const BFIconBuilder(
        //     iconData: Icons.help_outline,
        //     onlyIcon: true,
        //     iconSize: 20,
        //   ),
        // ),
      ],
    );
  }
}

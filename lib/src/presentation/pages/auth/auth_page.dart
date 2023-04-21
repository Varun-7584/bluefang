import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Auth Screen",
        'firebase_screen_class': "AuthPage",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: avoid_redundant_argument_values
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _buildLogo(),
                    const SizedBox(
                      height: 80,
                    ),
                    Lottie.asset(
                      'assets/lottie/truck_animation.json',
                    ),
                  ],
                ),
              ),
              _buildLoginButtons(context),
            ],
          )),
    );
  }

  Widget _buildLogo() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300, minWidth: 300),
      child: Center(
        child: BFText.headingOne('Start tracking your milage!',
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLoginButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      // ignore: avoid_redundant_argument_values
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BFButtons(
          title: 'Login with Webbat',
          leading: const FaIcon(FontAwesomeIcons.envelope, color: kcWhite),
          onTap: () {
            Navigator.of(context).pushNamed(GlobalRoutes.signIn);
          },
        ),
        const Divider(
          color: kcPrimaryColor,
        ),
        BFButtons(
          title: 'Sign in with Google',
          leading: const FaIcon(FontAwesomeIcons.google, color: kcWhite),
          onTap: () {},
          buttonColor: kcErrorColor,
        ),
        const SizedBox(
          height: 10,
        ),
        BFButtons(
          title: 'Sign in with Apple',
          // disabled: state.isSubmitting,
          leading: const FaIcon(FontAwesomeIcons.apple, color: kcWhite),
          onTap: () {},
          buttonColor: kcBlack,
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

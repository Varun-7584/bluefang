import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../package/bluefang_ui/src/shared/app_colors.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';

class choose_one_main extends StatefulWidget {
  const choose_one_main({Key? key}) : super(key: key);

  @override
  State<choose_one_main> createState() => choose_one_main_upState();
}

class choose_one_main_upState extends State<choose_one_main> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: '',
          leadingIcon: Icons.close,
          leadingOnPressed: () {
            Navigator.of(context).pushReplacementNamed(GlobalRoutes.startTracking);
          },
          trailingIcon: Icons.help,
          trailingOnPressed: () {

          },
        ),

        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: Container(
                  child: const Text(
                    "Choose one!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff375172),
                        fontSize: 39),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12,
                    left: 40,
                    right: 40),
                child: const Image(
                  image: AssetImage(
                      'assets/images/VehicleStockImages/truck_choose.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14,
                ),
                child: Column(
                  children: [
                    button(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.signUpExistingCompany);
                      },
                      any_color: kcPrimaryColor,
                      main_text: "Join existing company",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    button(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.signUpNewCompany);
                      },
                      any_color: kcPrimaryColor,
                      main_text: "Create a new company",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    button(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);

                      },
                      any_color: kcErrorColor,
                      main_text: "Sign in your company",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:bluefang/src/presentation/pages/auth/welcome_back.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/global_routes.dart';
import '../fleetmanager/fleet_manager_screen.dart';
import 'button.dart';
import 'choose_one.dart';

class start_tracking extends StatefulWidget {
  const start_tracking({Key? key}) : super(key: key);

  @override
  State<start_tracking> createState() => start_tracking_upState();
}

class start_tracking_upState extends State<start_tracking> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: Container(
                  child: const Text(
                    "Start tracking \nyour mileage!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff375172),
                        fontSize: 39),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                    left: 40,
                    right: 40),
                child: Container(
                  child: const Center(
                    child: Image(
                      image: AssetImage(
                          'assets/images/VehicleStockImages/truck_start_tracking.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                ),
                child: Column(
                  children: [
                    button(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.chooseOne);
                      },
                      any_color: const Color(0xFFE46C64),
                      main_text: "Sign in to Sync Server",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    button(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.signinWebBat);
                      },
                      any_color: const Color(0xff375172),
                      main_text: "Login with webbat",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 15, color: Color(0xff375172)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(GlobalRoutes.fleetManager);

                      },
                      icon: const Icon(
                        // <-- Icon
                        Icons.interests,
                      ),
                      label: const Text("Continue without login",
                          style: TextStyle(
                            color: Color(0xff375172),
                            fontSize: 13,
                          )),
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

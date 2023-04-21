import 'package:flutter/material.dart';
import '../../constants/global_routes.dart';
import 'button.dart';

class proceedsignin extends StatelessWidget {
  const proceedsignin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: Container(
              child: const Text(
                "Sign-up completed!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff375172),
                    fontSize: 38),
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

          const SizedBox(
            height: 50,
          ),

          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                button(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);
                  },
                  any_color: const Color(0xff375172),
                  main_text: "Proceed to Sign-in",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

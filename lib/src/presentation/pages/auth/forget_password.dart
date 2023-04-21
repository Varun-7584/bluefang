
import 'package:flutter/material.dart';

import '../../constants/global_routes.dart';

class forget_password extends StatelessWidget {
  const forget_password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.17,),
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
                fontSize: 15, color: Color(0xff375172)),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(GlobalRoutes.forgotPassword);
          },
          child: const Text('Forget Password?',
              style: TextStyle(color: Color(0xff375172))),
        ),
      ),
    );
  }
}

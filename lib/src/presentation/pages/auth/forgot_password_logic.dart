import 'package:bluefang/src/presentation/pages/auth/phone_verfication.dart';
import 'package:bluefang/src/presentation/pages/auth/text_field.dart';
import 'package:bluefang/src/presentation/pages/auth/validators.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'forgot_password_confirm.dart';

class forgot_password_logic extends StatefulWidget {
  const forgot_password_logic({Key? key}) : super(key: key);

  @override
  State<forgot_password_logic> createState() => forgot_password_logicState();
}

class forgot_password_logicState extends State<forgot_password_logic> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  TextEditingController emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xffffffff),
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help,
              color: Colors.blue,
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(
            height: 10,
          ),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01,
                      left: 40,
                      right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Forgot\nPassword",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter your email address to reset\n your password!",
                        style:
                            TextStyle(color: Color(0xff375172), fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.26,
                    left: 40,
                    right: 40),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Text_Field(
                        textEditingController: emailTextController,
                        hint_text: "Email Address",
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Field is required.';
                          if (val.isValidEmail) return 'Enter valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forgot_password_confirm()));
                          }
                        },
                        any_color: Color(0xff375172),
                        main_text: "Reset Password",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

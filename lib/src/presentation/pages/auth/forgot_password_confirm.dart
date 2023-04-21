import 'package:bluefang/src/presentation/pages/auth/button.dart';
import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'validators.dart';
import 'sign_in.dart';

class forgot_password_confirm extends StatefulWidget {
  const forgot_password_confirm({Key? key}) : super(key: key);

  @override
  State<forgot_password_confirm> createState() => _forgot_password_confirmState();
}

class _forgot_password_confirmState extends State<forgot_password_confirm> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  late String _OldPassword;
  late String _NewPassword;
  late String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.12,
                      left: 40,
                      right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Reset Your Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Reset password to continue !",
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
                    top: MediaQuery.of(context).size.height * 0.35,
                    left: 40,
                    right: 40),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      PasswordField(
                        hintText: 'Old Password',
                        validator: (val){
                          if( val== null || val.isEmpty) {
                            return 'Please enter your old password.';
                          }
                          if (!val.isValidPassword) {
                            return 'Invalid Password';
                          }
                          _OldPassword = val;
                        },
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      PasswordField(
                        hintText: 'New Password',
                        validator: (val){
                          if( val== null || val.isEmpty) {
                            return 'Please enter a new password.';
                          }
                          if (!val.isValidPassword) {
                            return 'Password must be at least 8';
                          }
                          _NewPassword = val;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      PasswordField(
                        hintText: 'Confirm Password',
                        validator: (val){
                          if( val== null || val.isEmpty) {
                            return 'Please enter a Confirm Password.';
                          }
                          if (val != _NewPassword) {
                            return 'Password does not match';
                          }
                          _confirmPassword = val;
                        },
                      ),
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 40,
                          ),
                          child: Text('Password need to be 6 character',
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff375172))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      button(
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sign_in()));
                          }
                        },
                        any_color: Color(0xff375172),
                        main_text: "Sign Up",
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

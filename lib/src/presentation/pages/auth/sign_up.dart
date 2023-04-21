import 'package:bluefang/src/presentation/pages/auth/button.dart';
import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_bar.dart';
import 'text_field.dart';
import 'validators.dart';
import 'sign_in.dart';

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<sign_up> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  late String _password;
  late String _confirmPassword;

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
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help,
              color: Colors.blue,
            ),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(
            height: 10,
          ),
        ),
      ),
      // appBar: MyAppBar(
      //   title: '',
      //   leadingIcon: Icons.close,
      //   leadingOnPressed: () {
      //     Navigator.pop(context);
      //   },
      //   trailingIcon: Icons.help,
      //   trailingOnPressed: () {
      //
      //   },
      // ),


      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign up to create a company!",
                        style:
                            TextStyle(color: Color(0xff375172), fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //Required Fields
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.17,
                      left: 40,
                      right: 40),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Text_Field(
                          hint_text: "Email Address",
                          validator: (val) {
                            if( val== null || val.isEmpty)
                              return 'Email address is required.';
                            if (val.isValidEmail)
                              return 'Enter valid email';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        PasswordField(
                          hintText: 'Password',
                          validator: (val){
                            if( val== null || val.isEmpty) {
                              return 'Password is required.';
                            }
                            if (!val.isValidPassword) {
                              return 'Password must be at least 8';
                            }
                            _password = val;
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PasswordField(
                          hintText: 'Confirm Password',
                          validator: (val){
                            if( val== null || val.isEmpty) {
                              return 'Confirm password is required.';
                            }
                            if (val != _password) {
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
                                    fontSize: 17, color: Color(0xff375172))),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

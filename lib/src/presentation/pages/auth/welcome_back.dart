import 'dart:convert';
import 'package:bluefang/src/application/ServerApiBloc/server_api_cubit.dart';
import 'package:bluefang/src/infrastructure/auth/firebase_repository.dart';
import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'validators.dart';
import 'text_field.dart';

class Welcome_Back extends StatefulWidget {
  Welcome_Back({Key? key}) : super(key: key);

  @override
  State<Welcome_Back> createState() => Welcome_Back_State();
}

class Welcome_Back_State extends State<Welcome_Back> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  late String _password;
  TextEditingController userIdTextController = TextEditingController();
  TextEditingController companyIdTexController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();


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
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 10.0, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign in to your webbat account!",
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
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2,
                      left: 50,
                      right: 50),
                  child: Column(
                    children: <Widget>[
                      Text_Field(
                        textEditingController: userIdTextController,
                        hint_text: "User ID",
                        // icon: Icon(Icons.close),
                        //   Obscure: false,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'User ID is required.';
                          }
                          if (val.isValidEmail) return 'Enter valid User ID';
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text_Field(
                        textEditingController: companyIdTexController,
                        hint_text: "Company ID",
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Company ID is required.';
                          }
                          if (val.isValidEmail) {
                            return 'Enter valid Company ID';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      PasswordField(
                        textEditingController: passwordTextController,
                        hintText: 'Password',
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Password is required.';
                          // if (!val.isValidPassword) {
                          //   return 'Please enter a valid Password';
                          // }
                          _password = val;
                        },
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff375172),
                        ),
                        child: Center(
                          child: TextButton(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
                              final repo = FirebaseRepository();

                              if (_formKey.currentState!.validate()) {
                                final ServerApiCubit cubit =
                                    context.read<ServerApiCubit>();
                                await cubit.testConnection();
                                await cubit.login(
                                    username: userIdTextController.text,
                                    companyNo: companyIdTexController.text,
                                    deviceID: await repo.getDeviceId() as String,
                                    pwd: passwordTextController.text);
                                final String token = cubit.state.token;

                                if (token.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      bFSnackBar(
                                          content: "Error logging into server",
                                          onActionClick: () {},
                                          type: "error"));
                                } else {
                                  final encodedPayload = token.split('.')[1];
                                  final payloadData =
                                  utf8.fuse(base64).decode(base64.normalize(encodedPayload));
                                  final data = json.decode(payloadData);
                                  final pref = await SharedPreferences.getInstance();
                                  pref.setString("userid", userIdTextController.text);
                                  pref.setString("name", '${data["UserName"]}');
                                  pref.setString("phonenumber", '${data["CellPhone"]}');
                                  Navigator.of(context).pushReplacementNamed(GlobalRoutes.fleetManager);

                                }
                              }
                            },
                          ),
                        ),
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


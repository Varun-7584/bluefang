import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:bluefang/src/presentation/pages/auth/phone_verfication.dart';
import 'package:bluefang/src/presentation/pages/auth/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../../application/Auth/SignupExistingCompanyBloc/signup_existingcompany_bloc.dart';
import '../../../application/Auth/SignupExistingCompanyBloc/signup_existingcompany_event.dart';
import '../../../application/Auth/SignupExistingCompanyBloc/signup_existingcompany_state.dart';
import '../../../domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';
import 'validators.dart';
import 'text_field.dart';

class existing_company_sign_up extends StatefulWidget {
  existing_company_sign_up({Key? key}) : super(key: key);

  @override
  State<existing_company_sign_up> createState() =>
      Existing_Company_Sign_upState();
}

class Existing_Company_Sign_upState extends State<existing_company_sign_up> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  late String _password;
  late String _confirmPassword;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController phonenumberTextController = TextEditingController();
  TextEditingController jobtitleTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController invitecodeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupExistingCompanyBloc>(context);
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        leadingIcon: Icons.close,
        leadingOnPressed: () {
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.chooseOne);
        },
        trailingIcon: Icons.help,
        trailingOnPressed: () {

        },
      ),


      backgroundColor: const Color(0xffffffff),
      body: BlocConsumer<SignupExistingCompanyBloc, SignupExistingCompanyState>(
          listener: (context, state) {
        if (state is NavigateToSignInState) {
          Navigator.of(context)
              .pushReplacementNamed(GlobalRoutes.proceedSignin);
        }
        if (state is ExistingCompanySignupFailure) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
              content: state.errorMsg.toString(), onActionClick: () {}, type: "error"));
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Join an existing company",
                        style:
                            TextStyle(color: Color(0xff375172), fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //Required Fields
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14,
                    left: 40,
                    right: 40),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Text_Field(
                        textEditingController: invitecodeTextController,
                        hint_text: "Invite Code",
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Invite code is required.';
                          if (val!.isValidPhone) {
                            return 'Enter valid Invite code';
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text_Field(
                        textEditingController: nameTextController,
                        hint_text: "Name",
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Name is required.';
                          }
                          if (!val.isValidName) return 'Enter valid Name';
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text_Field(
                        textEditingController: phonenumberTextController,
                        hint_text: "Phone Number",
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Phone number is required.';
                          }
                          if (!val.isValidPhone) {
                            return 'Enter valid Phone Number';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[0-9]"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text_Field(
                        textEditingController: emailTextController,
                        hint_text: "Email",
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Email is required.';
                          if (!val.isValidEmail) return 'Enter valid Email';
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text_Field(
                        textEditingController: jobtitleTextController,
                        hint_text: "Job title",
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Job title is required.';
                          if (!val.isValidName) return 'Enter valid Job title';
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      PasswordField(
                        textEditingController: passwordTextController,
                        hintText: 'Password',
                        validator: (val) {
                          if (val != null && !val.isValidPassword) {
                            return 'Password is required';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      PasswordField(
                        hintText: 'Confirm Password',
                        validator: (val) {
                          if (val == null || val.isEmpty)
                            return 'Comfirm Password is required.';
                          if (!val.isValidPassword) {
                            return 'Invalid Password';
                          }
                          _password = val;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      button(
                        onPressed: () {

                          if (_formKey.currentState!.validate()) {
                            signupBloc.add(CreateNewCompanyUser(
                              firstname: nameTextController.text,
                              phonenumber: phonenumberTextController.text,
                              jobtitle: jobtitleTextController.text,
                              email: emailTextController.text,
                              password: passwordTextController.text,
                              invitecode: invitecodeTextController.text,
                            ));
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
          ]),
        );
      }),
    );
  }
}

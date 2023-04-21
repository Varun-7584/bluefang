import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:bluefang/src/presentation/pages/auth/phone_verfication.dart';
import 'package:bluefang/src/presentation/pages/auth/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../../application/Auth/SignupNewCompanyBloc/company_sign_up_bloc.dart';
import '../../../application/Auth/SignupNewCompanyBloc/company_sign_up_event.dart';
import '../../../application/Auth/SignupNewCompanyBloc/company_sign_up_state.dart';
import '../../../domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';
import 'validators.dart';
import 'forget_password.dart';
import 'text_field.dart';

class company_sign_up extends StatefulWidget {
  const company_sign_up({Key? key}) : super(key: key);

  @override
  State<company_sign_up> createState() => company_sign_upState();
}

class company_sign_upState extends State<company_sign_up> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  late String _password;
  late String _confirmPassword;

  TextEditingController companyTextController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameTextController = TextEditingController();
  TextEditingController phonenumberTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController jobtitleTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController invitecodeTextController = TextEditingController();

  @override
  void dispose() {
    companyTextController.dispose();
    firstnameController.dispose();
    lastnameTextController.dispose();
    phonenumberTextController.dispose();
    addressTextController.dispose();
    jobtitleTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    invitecodeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final companySignUpBloc = BlocProvider.of<SignupNewCompanyBloc>(context);
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
      body: BlocConsumer<SignupNewCompanyBloc, CompanySignUpState>(
          listener: (context, state) {
        if (state is NavigateToSignUpPageState) {
          Navigator.of(context)
              .pushReplacementNamed(GlobalRoutes.proceedSignin);
        }
        if (state is CompanySignUpFailure) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
              content: state.errorMsg.toString(),
              onActionClick: () {},
              type: "error"));
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Expanded(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 35.0,
                          right: 10.0,
                        ),
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
                            Text(
                              "Sign up to create a company!",
                              style: TextStyle(
                                  color: Color(0xff375172), fontSize: 15),
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
                          top: MediaQuery.of(context).size.height * 0.12,
                          left: 40,
                          right: 40),
                      child: Expanded(
                        child: Column(
                          children: <Widget>[
                            Text_Field(
                              textEditingController: companyTextController,
                              hint_text: "Company Name",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Company name is required.';
                                }
                                if (!val.isValidName) {
                                  return 'Enter valid Company Name';
                                }
                                return null;
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
                              textEditingController: firstnameController,
                              hint_text: "First Name",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'First name is required.';
                                }
                                if (!val.isValidName) {
                                  return 'Enter valid First Name';
                                }
                                return null;
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
                              textEditingController: lastnameTextController,
                              hint_text: "Last Name",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Last Name is required.';
                                }
                                if (!val.isValidName) {
                                  return 'Enter valid Last Name';
                                }
                                return null;
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text_Field(
                              textEditingController: addressTextController,
                              hint_text: "Address",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Address is required.';
                                }
                                if (!val.isValidName) {
                                  return 'Enter valid Address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text_Field(
                              textEditingController: jobtitleTextController,
                              hint_text: "Job title",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Job title is required.';
                                }
                                if (!val.isValidName) {
                                  return 'Enter valid Job title';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text_Field(
                              textEditingController: emailTextController,
                              hint_text: "Email",
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Email is required.';
                                }
                                if (!val.isValidEmail) {
                                  return 'Enter valid Email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PasswordField(
                              textEditingController: passwordTextController,
                              hintText: 'Password',
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Password is required.';
                                }
                                if (!val.isValidPassword) {
                                  return 'Invalid Password';
                                }
                                _password = val;
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            PasswordField(
                              hintText: 'Confirm Password',
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Confirm Password is required.';
                                }
                                if (val != _password) {
                                  return 'Invalid Password';
                                }
                                _confirmPassword = val;
                                return null;
                              },
                            ),
                            const forget_password(),
                            const SizedBox(height: 5),
                            button(
                                any_color: const Color(0xff375172),
                                main_text: "Sign Up",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    companySignUpBloc.add(SignUpWithCompany(
                                        uid: null,
                                        companyname:
                                            companyTextController.text.trim(),
                                        firstname: firstnameController.text,
                                        lastname: lastnameTextController.text,
                                        phonenumber:                                            phonenumberTextController.text,
                                        address: addressTextController.text,
                                        jobtitle: jobtitleTextController.text,
                                        email: emailTextController.text,
                                        password: passwordTextController.text,
                                        role: "Admin"));
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

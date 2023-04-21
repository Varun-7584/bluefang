import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../../application/Auth/SignInBloc/sign_in_bloc.dart';
import '../../../application/Auth/SignInBloc/sign_in_event.dart';
import '../../../application/Auth/SignInBloc/sign_in_state.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';
import 'forget_password.dart';
import 'text_field.dart';
import 'validators.dart';

class sign_in extends StatefulWidget {
  sign_in({Key? key}) : super(key: key);

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  final _formKey = GlobalKey<FormState>();

  late String _password;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signInBloc = BlocProvider.of<SignInBloc>(context);
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
      body: BlocConsumer<SignInBloc, SignInState>(listener: (context, state) {
        if (state is NavigateToPhoneVerificationState) {
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.phoneVerification);
        }
        else if(state is NavigateToFleetManagerState){
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.fleetManager);
        }
        if (state is SignInFailureState) {
          ScaffoldMessenger.of(context)
              .clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              bFSnackBar(
                  // content: state.errorMsg.toString(),
                content: "Invalid User",
                  onActionClick: () {},
                  type: "error"));
        }

      }, builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 10.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff375172),
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sign in to your company!",
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
                          textEditingController: emailTextController,
                          hint_text: "Email Address",
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Email address is required.';
                            }
                            if (!val.isValidName) return 'Enter valid email';
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        PasswordField(
                          textEditingController: passwordTextController,
                          hintText: 'Password',
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Password is required.';
                            }
                            _password = val;
                          },
                        ),
                        forget_password(),
                        const SizedBox(height: 15),
                        button(
                          any_color: Color(0xff375172),
                          main_text: "Sign In",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signInBloc.add(SignInWithEmail(
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                              ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

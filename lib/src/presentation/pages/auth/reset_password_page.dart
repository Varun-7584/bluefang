import 'package:bluefang/src/application/Auth/ForgotPasswordBloc/forgot_password_cubit.dart';
import 'package:bluefang/src/application/Auth/ForgotPasswordBloc/forgot_password_state.dart';
import 'package:bluefang/src/presentation/pages/auth/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../constants/global_routes.dart';
import 'button.dart';
import 'forget_password.dart';
import 'text_field.dart';
import 'validators.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  late String _password;

  TextEditingController emailTextController = TextEditingController();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final signInBloc = BlocProvider.of<SignInBloc>(context);
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: const Color(0xffffffff),
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffffffff),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(listener: (context, state) {
        if (state is ForgotPasswordNavigate) {
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);
          ScaffoldMessenger.of(context)
              .clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              bFSnackBar(
                // content: state.errorMsg.toString(),
                  content: "A reset password link has been sent!",
                  onActionClick: () {},
                  type: "Success"));
        }
        if (state is ForgotPasswordFail) {
          ScaffoldMessenger.of(context)
              .clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              bFSnackBar(
                // content: state.errorMsg.toString(),
                  content: "Invalid email address",
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
                          "Reset Password!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff375172),
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Reset password link will be sent to given email!",
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
                        const SizedBox(height: 15),
                        button(
                          any_color: Color(0xff375172),
                          main_text: "Reset Password",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ForgotPasswordCubit>().resetPassword(emailTextController.text.trim());
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
      ) ;
  }
}

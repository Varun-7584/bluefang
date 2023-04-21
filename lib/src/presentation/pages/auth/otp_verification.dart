import 'dart:async';

import 'package:bluefang/src/presentation/pages/auth/phone_verfication.dart';
import 'package:bluefang/src/presentation/pages/auth/sizebox_otp.dart';
import 'package:bluefang/src/presentation/pages/auth/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/widgets/bluefang_toastbar.dart';
import '../../../application/Auth/OtpVerificationBloc/otp_verification_bloc.dart';
import '../../../application/Auth/OtpVerificationBloc/otp_verification_event.dart';
import '../../../application/Auth/OtpVerificationBloc/otp_verification_state.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';

class Otp_Verification extends StatefulWidget {
  const Otp_Verification({Key? key}) : super(key: key);

  @override
  State<Otp_Verification> createState() => _Otp_VerificationState();
}

class _Otp_VerificationState extends State<Otp_Verification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpTextController1 = TextEditingController();
  final TextEditingController otpTextController2 = TextEditingController();
  final TextEditingController otpTextController3 = TextEditingController();
  final TextEditingController otpTextController4 = TextEditingController();
  final TextEditingController otpTextController5 = TextEditingController();
  final TextEditingController otpTextController6 = TextEditingController();

  late Timer _timer;
  int _seconds = 30;
  bool _buttonEnabled = false;
  bool timerOver = false;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 1) {
          _seconds--;
        } else {
          _buttonEnabled = true;
          _timer.cancel();
          timerOver = true;
        }
      });
    });
  }

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    otpTextController1.dispose();
    otpTextController2.dispose();
    otpTextController3.dispose();
    otpTextController4.dispose();
    otpTextController5.dispose();
    otpTextController6.dispose();
    super.dispose();
  }

  Future<void> _resendCode() async {
    setState(() {
      _buttonEnabled = false;
      _seconds = 30;
      _startTimer();
    });
    final firebaseRepo = new FirebaseRepository();
    final value = await firebaseRepo.resendOtp();
  }

  void _resetTimerOver() {
    setState(() {
      timerOver = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final otpVerificationBloc = BlocProvider.of<OtpVerificationBloc>(context);
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        leadingIcon: Icons.arrow_back,
        leadingOnPressed: () {
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.phoneVerification);
        },
        trailingIcon: Icons.help,
        trailingOnPressed: () {

        },
      ),

      backgroundColor: const Color(0xffffffff),

      body: BlocConsumer<OtpVerificationBloc, OtpVerificationState>(
          listener: (context, state) {
            if (state is NavigateToFleetManagerState) {
              Navigator.of(context).pushReplacementNamed(GlobalRoutes.fleetManager);
            } else if (state is OtpVerificationFailureState) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                  content: state.errorMsg.toString(),
                  onActionClick: () {},
                  type: "error"));
            }
          }, builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: 40.0,
                      right: 10.0,
                      bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Verify your device",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff375172),
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please enter the 6 digit code send to your device",
                        style: TextStyle(color: Color(0xff375172), fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.29,
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController1,
                              )),
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController2,
                              )),
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController3,
                              )),
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController4,
                              )),
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController5,
                              )),
                          Flexible(
                              child: SizeBox_Otp(
                                textEditingController: otpTextController6,
                              )),
                        ],
                      ),


                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Didn't receive the code?",
                              style: TextStyle(fontSize: 15),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  // color: timerOver
                                  //     ? Colors.grey
                                  //     : Colors.red,
                                ),
                              ),
                              onPressed: _buttonEnabled
                                  ? () {
                                _resendCode();
                                _resetTimerOver(); // reset timerOver variable
                              }
                                  : null,
                              child: Text(
                                timerOver
                                    ? 'Resend Now'
                                    : 'Resend in ($_seconds)',
                                style: TextStyle(
                                  color: timerOver
                                      ? const Color(0xff375172)
                                      : Colors.red,
                                ),
                              ),
                            ),
                          ]),
                      //
                      const SizedBox(
                        height: 20,
                      ),
                      button(
                        onPressed: () {
                          String otpFinal = otpTextController1.text +
                              otpTextController2.text +
                              otpTextController3.text +
                              otpTextController4.text +
                              otpTextController5.text +
                              otpTextController6.text;

                          otpVerificationBloc.add(OtpVerificationWithNumber(
                            otp: otpFinal,
                          ));
                        },
                        any_color: const Color(0xff375172),
                        main_text: "Submit",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}




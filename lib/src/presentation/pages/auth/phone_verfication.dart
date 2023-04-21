import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../package/bluefang_ui/src/shared/app_colors.dart';
import '../../../application/Auth/PhoneVerificationBloc/phone_verification_bloc.dart';
import '../../../application/Auth/PhoneVerificationBloc/phone_verification_event.dart';
import '../../../application/Auth/PhoneVerificationBloc/phone_verification_state.dart';
import '../../constants/global_routes.dart';
import 'app_bar.dart';
import 'button.dart';
import 'otp_verification.dart';
import 'validators.dart';
import 'text_field.dart';

class phone_Verfication extends StatefulWidget {
  phone_Verfication({Key? key}) : super(key: key);

  @override
  State<phone_Verfication> createState() => _phone_VerficationState();
}

class _phone_VerficationState extends State<phone_Verfication> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenumberTextController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  bool _isPhoneNumberEntered = false;

  @override
  void dispose() {
    phonenumberTextController.dispose();
    super.dispose();
  }

  String? _selectedOption;

  List<dynamic> _options = [];

  @override
  void initState() {
    super.initState();
    _loadData();

    // add listener to phone number text field controller
    phonenumberTextController.addListener(() {
      setState(() {
        _isPhoneNumberEntered = phonenumberTextController.text.isNotEmpty &&
            phonenumberTextController.text.isValidPhone;
      });
    });
  }

  void _loadData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/CountryCode/countryPhoneCodes.json');
    setState(() {
      _options = jsonDecode(data) as List;
      if (_options.isNotEmpty) {
        _selectedOption = _options[0].toString();
        countryCodeController.text = _selectedOption!;
      }
    });
  }

  Widget build(BuildContext context) {
    final phoneVerificationBloc =
        BlocProvider.of<PhoneVerificationBloc>(context);
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        leadingIcon: Icons.arrow_back,
        leadingOnPressed: () {
          Navigator.of(context).pushReplacementNamed(GlobalRoutes.signIn);
        },
        trailingIcon: Icons.help,
        trailingOnPressed: () {

        },
      ),
      backgroundColor: const Color(0xffffffff),
      body: BlocConsumer<PhoneVerificationBloc, PhoneVerificationState>(
          listener: (context, state) {
        if (state is NavigateToOtpVerificationState) {
          Navigator.of(context)
              .pushReplacementNamed(GlobalRoutes.otpVerification);
        } else if (state is PhoneVerificationFailureState) {
          //
        }
      }, builder: (context, state) {
        if (state is PhoneVerificationLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        ;
        return SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: const Text(
                          "Phone Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff375172),
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.22,
                          left: 20,
                          right: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 48,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                    child: DropdownButton<String>(
                                      value: _selectedOption,
                                      alignment: Alignment.center,
                                      hint: Text(
                                        _selectedOption!,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      onChanged: (dynamic newValue) {
                                        setState(() {
                                          _selectedOption = newValue.toString();
                                          countryCodeController.text =
                                              _selectedOption!;
                                        });
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      items: _options
                                          .map<DropdownMenuItem<String>>(
                                              (dynamic value) {
                                        return DropdownMenuItem<String>(
                                          value: value.toString(),
                                          child: Text(value['code'].toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                        );
                                      }).toList(),
                                      underline: Container(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: 48,
                                  child: Text_Field(
                                    textEditingController:
                                        phonenumberTextController,
                                    textInputType: TextInputType.number,
                                    hint_text: "Phone Number",
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9]"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          button(
                            onPressed: _isPhoneNumberEntered
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      String code = _selectedOption.toString();
                                      String finalCode =
                                          code.substring(7, code.length - 1);
                                      phoneVerificationBloc
                                          .add(PhoneVerificationWithNumber(
                                        phonenumber: finalCode +
                                            phonenumberTextController.text,
                                      ));
                                    }
                                  }
                                : null,
                            any_color: _isPhoneNumberEntered
                                ? const Color(0xff375172)
                                : Colors.grey.shade500,
                            text_color: _isPhoneNumberEntered
                                ? Colors.white
                                : Color(0xff375172),
                            main_text: "Next",
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              child: const Text(
                                  'We need to verify your phone to procced.',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff375172))),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        );
      }),
    );
  }
}

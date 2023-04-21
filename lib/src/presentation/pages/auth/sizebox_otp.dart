 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SizeBox_Otp extends StatefulWidget {
  SizeBox_Otp({
    this.textEditingController,
  });

  final TextEditingController? textEditingController;

  @override
  _SizeBox_OtpState createState() => _SizeBox_OtpState();
}

class _SizeBox_OtpState extends State<SizeBox_Otp> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final aspectRatio = screenWidth / screenHeight;
    final otpBoxHeight =
        0.12 * screenHeight;
    final otpBoxWidth = otpBoxHeight * aspectRatio;
    return SizedBox(
      height: otpBoxHeight,
      width: otpBoxWidth,
      child: TextFormField(
        controller: widget.textEditingController,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          else if(value.isEmpty){
            FocusScope.of(context).previousFocus();
          }
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}


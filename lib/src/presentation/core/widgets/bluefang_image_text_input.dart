// ignore_for_file: must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BFInputAndImage extends StatelessWidget {
  /// The text displayed in the box before the user enters text
  final String? hintText;

  /// The label displayed above the textbox. This will always be a floating label.
  final String? label;

  /// The error message displayed below the textbox if not null.
  String? errorMessage;

  /// Whether or not the box has an outline around it. Fill and outline will always be the opposite of each other.
  final bool outline;

  /// The color of the textbox.
  final Color backgrounColor;

  /// The height of the textbox. If not set, defaults to 58 pixels.
  double height;

  /// The width of the textbox. If not set, defaults to the maximum width allowed.
  double width;

  /// The font size. If not set, defaults to 22.
  double fontSize;

  /// The widget to display before the textbox.
  final Widget? prefix;

  /// The icon to place at the end of the textbox (such as an x to clear the box).
  final Widget? suffixIcon;

  /// Widget to display after the text but before the suffixIcon.
  final Widget? suffix;

  /// The input type: numeric, numeric and decimal, etc. Defaults to text.
  final TextInputType inputType;

  /// The function to call when validating the input.
  final String? Function(String?)? validator;

  /// To hide the text or not (such as for passwords).
  final bool obscureText;

  /// Prevents or allows editing the textbox.
  final bool readOnly;

  /// The TextEditingController used to manage the text for this textbox.
  final TextEditingController? textController;

  /// The TextStyle to be applied to the text.
  final TextStyle? textStyle;

  /// Function to call when the suffix icon is pressed.
  final VoidCallback? onSuffixTap;

  /// The border color when the textbox is selected. Defaults to blue.
  final Color focusedBorderColor;

  /// Function to call when the value of the textbox is changed.
  final ValueChanged<String>? onChanged;

  /// The type of keyboard to display. Options include numeric and text; the default is text.
  final TextInputType keyboardType;

  /// The image to display in front of the textbox.
  final String imagePath;

  /// The maximum length of the text in the textbox.
  final int maxLength;

  /// The text to count the number of characters in the box. Shown if not null.
  final String? counterText;

  /// The formatter for the textbox. Can allow or disallow characters.
  final List<TextInputFormatter>? inputFormatterList;

  /// The space to add around the input field as a whole (including the card)
  final double? edgeMargin;

  FocusNode? focusNode = FocusNode();

  /// Creates a BF text input field with an image in front of it.
  ///
  /// Input consists of an Row containing an image and a card. The card holds a TextFormField.
  BFInputAndImage({
    Key? key,
    this.hintText,
    this.label,
    this.errorMessage,
    this.outline = false,
    this.backgrounColor = kcSucessColor, //kcLightGreyColor,
    this.height = 58,
    this.width = double.infinity,
    this.fontSize = 22, // FONTSIZE - Input Text Boxes user input font size
    this.prefix,
    this.suffixIcon,
    this.validator,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.onSuffixTap,
    this.readOnly = false,
    this.textController,
    this.textStyle,
    this.suffix,
    this.focusedBorderColor = Colors.blue,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.imagePath,
    this.maxLength = 500,
    this.counterText,
    this.inputFormatterList,
    this.edgeMargin,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double usedFontSize = fontSize;

    //Small phone
    if (size.width < 375){
    }
    //Tablet
    else if (size.width > 500){
      usedFontSize = fontSize + 10;
    }
    //Standard phone size
    else {
      //Don't change the height
    }
    return Row(
      children: <Widget>[
        Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.fill),
        const SizedBox(height: 10.0, width: 10.0),
        Expanded(
          child: BFTextInput(
            hintText: hintText,
            label: label,
            errorMessage: errorMessage,
            outline: outline,
            backgrounColor: backgrounColor,
            height: height,
            fixedWidth: width,
            fontSize: usedFontSize,
            prefix: prefix,
            suffixIcon: suffixIcon,
            validator: validator,
            inputType: inputType,
            obscureText: obscureText,
            onSuffixTap: onSuffixTap,
            readOnly: readOnly,
            textController: textController,
            textStyle: textStyle,
            suffix: suffix,
            focusedBorderColor: focusedBorderColor,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLength: maxLength,
            counterText: counterText,
            inputFormatterList: inputFormatterList,
            edgeMargin: edgeMargin,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}

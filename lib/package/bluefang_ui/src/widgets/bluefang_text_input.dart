// ignore_for_file: require_trailing_commas, prefer_const_constructors

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class BFTextInput extends StatelessWidget {
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
  final double height;
  /// The width of the textbox. If not set, defaults to the maximum width allowed. 
  final double fixedWidth;
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
  /// The maximum length of the text in the textbox. 
  final int maxLength;
  /// The text to count the number of characters in the box. Shown if not null. 
  final String? counterText;
  /// The formatter for the textbox. Can allow or disallow characters. 
  final List<TextInputFormatter>? inputFormatterList;
  /// The space to add around the input field as a whole (including the card)
  final double? edgeMargin;
  
  FocusNode? focusNode;

  /// Creates a text form field with specific formatting.
  ///
  /// A card containing a text form field.
  BFTextInput({
    Key? key,
    this.hintText,
    this.label,
    this.errorMessage,
    this.outline = false,
    this.backgrounColor = kcSucessColor, //kcLightGreyColor,
    this.height = 58,
    this.fixedWidth = double.infinity,
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
    this.maxLength = 500,
    this.counterText,
    this.inputFormatterList,
    this.edgeMargin,
    this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375){
      usedFontSize -= 4;
    }
    final TextFormField textfield = TextFormField( 
      maxLength: maxLength,
      obscureText: obscureText,
      style: TextStyle(fontSize: usedFontSize),
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: InputDecoration(
        constraints: BoxConstraints.tight(Size(fixedWidth, height)),
        counterText: counterText ?? '',
        hintText: hintText,
        hintStyle: captionStyle.copyWith(
            fontWeight:
                outline ? FontWeight.w600 : FontWeight.bold,
            fontSize: usedFontSize - 6),
        errorText: errorMessage,
        errorStyle: captionStyle.copyWith(
            fontStyle: FontStyle.italic, color: kcErrorColor),
        errorBorder: errorOutline,
        focusedErrorBorder: errorOutline,
        filled: !outline,
        fillColor: kcLightGreyColor,
        contentPadding: const EdgeInsets.all(2),
        labelText: label,
        labelStyle: TextStyle(
            fontSize: usedFontSize,
            fontWeight: FontWeight
                .normal), // FONTSIZE - Labels on Text Input Boxes
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: outline
              ? const BorderSide(color: kcSucessColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefix != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10),
                child: prefix,
              )
            : const Text(''),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onSuffixTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: suffixIcon,
                ),
              )
            : const Text(''),
        suffix: suffix ?? const Text(''),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 15),
        suffixIconConstraints:
            const BoxConstraints(minWidth: 15),
      ),
      validator: validator,
      controller: textController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      inputFormatters: inputFormatterList,
      focusNode: focusNode,
    );
    return Card(
      margin: EdgeInsets.all(edgeMargin ?? 4.0),
      color: kcLightGreyColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: 
              (fixedWidth < double.infinity) ? (
                SizedBox(
                  width: fixedWidth,
                  height: height, 
                  child: FittedBox( 
                    fit: BoxFit.fitWidth, 
                    child: textfield
                  ),
                )
              ) :
              textfield,
            ),
          ),
        ],
      ),
    );
  }
}

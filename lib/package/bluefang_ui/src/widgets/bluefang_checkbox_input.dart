// ignore_for_file: require_trailing_commas, prefer_const_constructors_in_immutables, prefer_null_aware_method_calls, no_logic_in_create_state, avoid_print, avoid_positional_boolean_parameters

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BFCheckboxInput extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final double height;
  final double width;
  final double? fontSize;
  final bool readOnly;
  Function onThisChanged;
  final TextStyle? labelStyle;
  final bool isChecked;

  /// Creates a text form field with specific formatting.
  ///
  /// A card containing a text form field.
  BFCheckboxInput({
    Key? key,
    required this.label,
    this.backgroundColor = kcLightGreyColor,
    this.height = 58,
    this.width = double.infinity,
    this.fontSize = 22,
    this.readOnly = false,
    required this.onThisChanged,
    this.labelStyle,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<BFCheckboxInput> createState() => _BFCheckboxInputState(
        label: label,
        backgroundColor: backgroundColor,
        height: height,
        width: width,
        fontSize: fontSize,
        readOnly: readOnly,
        onThisChanged: onThisChanged,
        labelStyle: labelStyle,
        isChecked: isChecked,
      );
}

class _BFCheckboxInputState extends State<BFCheckboxInput> {
  final String label;
  final Color backgroundColor;
  final double height;
  final double width;
  final double? fontSize;
  final bool readOnly;
  final Function onThisChanged;
  final TextStyle? labelStyle;
  bool isChecked;

  /// Creates a text form field with specific formatting.
  ///
  /// A card containing a text form field.
  _BFCheckboxInputState({
    required this.label,
    this.backgroundColor = kcLightGreyColor,
    this.height = 58,
    this.width = double.infinity,
    this.fontSize = 22,
    this.readOnly = false,
    required this.onThisChanged,
    this.labelStyle,
    required this.isChecked,
  });

  Color getColor(Set<MaterialState> states) {
    return kcMediumGreyColor;
  }

  @override
  Widget build(BuildContext context) {
    //log("isChecked: $isChecked");
    return Card(
      color: backgroundColor,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 60,
            width: 60,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Checkbox(
                value: isChecked,
                onChanged: (newVal) {
                  //ignore: avoid_dynamic_calls
                  onThisChanged(newVal);
                  setState(() {
                    isChecked = newVal!;
                  });
                },
                checkColor: kcBlack,
                fillColor: MaterialStateProperty.resolveWith(getColor),
              ),
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: labelStyle ?? captionStyle,
            ),
          ),
        ],
      ),
    );
  }

  void whenChanged(bool? newValue) {}
}

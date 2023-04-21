// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bluefang/package/bluefang_ui/src/shared/app_colors.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/decorations.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/text_styles.dart';
import 'package:flutter/material.dart';

/// Builds a dropdown menu with the Bluefang styles and some default parameters.
///
/// [author] Saurav.
/// 
/// ```
/// const BFDropdown({
///   Key? key,
///   this.label,
///   this.errorMessage,
///   this.outline = false,
///   this.backgrounColor = kcLightGreyColor,
///   this.theIcon = Icons.arrow_drop_down,
///   required this.itemList,
///   required this.dropdownValue,
///   this.whenChanged,
///   this.validator,
///   this.labelStyle,
///   this.errorStyle,
///   this.style,
///   this.edgeMargin,
/// })
/// ```
///
/// String? [label] is the label text that is displayed for the widget. This will always be above the dropdown.
///
/// String? [errorMessage] displays below the dropdown if not null.
///
/// bool [outline] determines whether or not the border is constantly displayed.
///
/// Color [backgrounColor] is the color used as the background of the widget if the [outline] is not set.
///
/// IconData [theIcon] is the icon displayed at the right-hand side. Defaults to a downward-pointing arrow.
/// 
/// List<String> [itemList] is the list of items to display in the dropdown. Required. 
/// 
/// String [dropdownValue] is the default value to display on the dropdown. Must be present in [itemList] and is required. 
/// 
/// Function(String?)? [whenChanged] is called when the value of the dropdown is changed. CURRENTLY NOT FUNCTIONAL.
/// 
/// String? Function(String?)? [validator] is the function called to validate the input. Not really required for a dropdown menu.
/// 
/// TextStyle? [labelStyle] controls the look and feel of the label text in the input field.
/// 
/// TextStyle? [errorStyle] controls the look and feel of the error text below the input field.
/// 
/// TextStyle? [style] controls the look and feel of the text in the dropdown itself.
/// 
/// double? [edgeMargin] is the amount of space to put around the dropdown. Defaults to 4.0 pixels. 
///
class BFDropdown extends StatefulWidget {
  final String? label;
  final String? errorMessage;
  final bool outline;
  final Color backgrounColor;
  final IconData theIcon;
  final List<String> itemList;
  final String dropdownValue;
  final void Function(String?)? whenChanged;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final double? edgeMargin;
  /// The number of dropdown items to display at once. Defaults to 2. 
  final double? dropdownLength;

  /// Constructs a BFDropdown and defines required parameters.
  ///
  /// [author] Saurav.
  /// String? [label] is the label text that is displayed for the widget. This will always be above the dropdown.
  ///
  /// String? [errorMessage] displays below the dropdown if not null.
  ///
  /// bool [outline] determines whether or not the border is constantly displayed.
  ///
  /// Color [backgrounColor] is the color used as the background of the widget if the [outline] is not set.
  ///
  /// IconData [theIcon] is the icon displayed at the right-hand side. Defaults to a downward-pointing arrow.
  /// 
  /// List<String> [itemList] is the list of items to display in the dropdown. Required. 
  /// 
  /// String [dropdownValue] is the default value to display on the dropdown. Must be present in [itemList] and is required. 
  /// 
  /// Function(String?)? [whenChanged] is called when the value of the dropdown is changed. 
  /// 
  /// String? Function(String?)? [validator] is the function called to validate the input. Not really required for a dropdown menu.
  /// 
  /// TextStyle? [labelStyle] controls the look and feel of the label text in the input field.
  /// 
  /// TextStyle? [errorStyle] controls the look and feel of the error text below the input field.
  /// 
  /// TextStyle? [style] controls the look and feel of the text in the dropdown itself.
  /// 
  /// double? [edgeMargin] is the amount of space to put around the dropdown. Defaults to 4.0 pixels. 
  ///
  const BFDropdown({
    Key? key,
    this.label,
    this.errorMessage,
    this.outline = false,
    this.backgrounColor = kcLightGreyColor,
    this.theIcon = Icons.arrow_drop_down,
    required this.itemList,
    required this.dropdownValue,
    this.whenChanged,
    this.validator,
    this.labelStyle,
    this.errorStyle,
    this.style,
    this.edgeMargin,
    this.dropdownLength,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<BFDropdown> createState() => _BFDropdownState(
    label,
    errorMessage,
    outline,
    backgrounColor,
    theIcon,
    itemList,
    dropdownValue,
    whenChanged,
    validator,
    labelStyle,
    errorStyle,
    style,
    edgeMargin,
    dropdownLength
  );
}

class _BFDropdownState extends State<BFDropdown> {
  String? label;
  String? errorMessage;
  bool outline = false;
  Color backgrounColor = kcLightGreyColor;
  IconData theIcon = Icons.arrow_drop_down;
  List<String> itemList = [];
  String dropdownValue;
  final Function(String?)? whenChanged;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final double? edgeMargin;
  final double? dropdownLength;

  _BFDropdownState(
    this.label,
    this.errorMessage,
    this.outline,
    this.backgrounColor,
    this.theIcon,
    this.itemList,
    this.dropdownValue,
    this.whenChanged,
    this.validator,
    this.labelStyle,
    this.errorStyle,
    this.style,
    this.edgeMargin,
    this.dropdownLength
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcLightGreyColor,
      margin: EdgeInsets.all(edgeMargin == null ? 4.0 : edgeMargin!),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: DropdownButtonFormField<String>(
          value: dropdownValue,
          isExpanded: true,
          style: style ?? bodyStyle.copyWith(color: kcMediumGreyColor),
          hint: Text(dropdownValue),
          decoration: InputDecoration(
            errorText: errorMessage,
            errorStyle: errorStyle ??
                captionStyle.copyWith(
                    fontStyle: FontStyle.italic, color: kcErrorColor),
            errorBorder: errorOutline,
            focusedErrorBorder: errorOutline,
            filled: !outline,
            fillColor: backgrounColor,
            contentPadding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
            labelText: label,
            labelStyle: labelStyle ??
                heading4Style, // FONTSIZE - Label Text on Pull Down List Boxes
            floatingLabelBehavior: FloatingLabelBehavior.always,
            //floatingLabelStyle: TextStyle(color: kcMediumGreyColor, fontSize: 15),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: kcMediumGreyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(theIcon),
          items: itemList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            whenChanged!(newValue);
            setState(() {
              dropdownValue = newValue!;
            });
          },
          menuMaxHeight: (dropdownLength ?? 2) * kMinInteractiveDimension,
        ),
      ),
    );
  }
}

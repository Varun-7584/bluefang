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
class BFDropdownAndImage extends StatefulWidget {
  final String? label;
  final String? errorMessage;
  final bool outline;
  final Color backgrounColor;
  final IconData theIcon;
  final List<String> itemList;
  final String dropdownValue;
  final ValueChanged<String>? whenChanged;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final String imagePath;
  final double? edgeMargin;
  final double? dropdownLength;

  /// Constructs a BFDropdownAndImage and defines required parameters.
  ///
  /// [author] Saurav.
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
  /// String [imagePath] is the path to the image to display in front of the dropdown menu. Required. 
  /// 
  /// double? [edgeMargin] is the amount of space to put around the dropdown. Defaults to 4.0 pixels. 
  const BFDropdownAndImage({
    Key? key,
    this.label,
    this.errorMessage,
    this.outline = false,
    this.backgrounColor = kcLightGreyColor,
    this.theIcon = Icons.arrow_drop_down,
    required this.itemList,
    required this.dropdownValue,
    required this.whenChanged,
    this.validator,
    this.labelStyle,
    this.errorStyle,
    this.style,
    required this.imagePath,
    this.edgeMargin,
    this.dropdownLength,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<BFDropdownAndImage> createState() => _BFDropdownAndImageState(
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
        imagePath,
        edgeMargin,
        dropdownLength
      );
}

/// Builds the dropdown and image widget. 
class _BFDropdownAndImageState extends State<BFDropdownAndImage> {
  String? label;
  String? errorMessage;
  bool outline = true;
  Color backgrounColor = kcLightGreyColor;
  IconData theIcon = Icons.arrow_drop_down;
  List<String> itemList = [];
  String dropdownValue;
  final ValueChanged<String>? whenChanged;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  String imagePath;
  final double? edgeMargin;
  final double? dropdownLength;
  double fontSize = 22;

  _BFDropdownAndImageState(
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
    this.imagePath,
    this.edgeMargin,
    this.dropdownLength
  );

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width > 500){
      usedFontSize = fontSize + 8;
    }
    return Row (
      children: <Widget>[
        Image.asset(imagePath, height: 50, width:50, fit: BoxFit.fill),
        const SizedBox(width: 10),
        Expanded (
          child: Card (
            margin: EdgeInsets.all(edgeMargin == null ? 4.0 : edgeMargin!),
            color: kcLightGreyColor,
            child: Padding (
              padding: const EdgeInsets.all(4),
                child: Row (
                  children: <Widget>[ 
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        style: style ?? bodyStyle.copyWith(color: kcMediumGreyColor),
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(fontSize: usedFontSize),
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
                        onChanged: onChanged,
                        //kMinInteractveDimension is the height of a dropdown menu item 
                        menuMaxHeight: (dropdownLength ?? 2) * kMinInteractiveDimension,
                      ),
                    ),
                  ],
                ),
            ),
          ),
        ),
      ],
    );
  }

  void onChanged(String? newValue){
    whenChanged!(newValue ?? "");
    setState(() {
      dropdownValue = newValue ?? "";
    });

  }
}

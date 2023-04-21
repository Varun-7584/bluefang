// ignore_for_file: avoid_positional_boolean_parameters, must_be_immutable

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/src/shared/app_colors.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/decorations.dart';
import 'package:bluefang/package/bluefang_ui/src/shared/text_styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BFDropdownLangObjects extends StatefulWidget {
  final String? label;
  final String? errorMessage;
  final bool outline;
  final Color backgrounColor;
  final IconData theIcon;
  final List<DropdownItem> itemList;
  final DropdownItem dropdownValue;
  final Function(DropdownItem?)? whenChanged;
  final String? Function(DropdownItem?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final double? edgeMargin;

  /// Constructs a BFDropdown that displays DropdownItem objects instead of Strings and defines required parameters.
  /// It was designed primarily for choosing the language to use for the application.
  ///
  /// [author] Bailie Livingston.
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
  /// List<DropdownItem> [itemList] is the list of items to display in the dropdown. Required.
  ///
  /// String [dropdownValue] is the default value to display on the dropdown. Must be present in [itemList] and is required.
  ///
  /// Function(DropdownItem?)? [whenChanged] is called when the value of the dropdown is changed.
  ///
  /// String? Function(DropdownItem?)? [validator] is the function called to validate the input. Not really required for a dropdown menu.
  ///
  /// TextStyle? [labelStyle] controls the look and feel of the label text in the input field.
  ///
  /// TextStyle? [errorStyle] controls the look and feel of the error text below the input field.
  ///
  /// TextStyle? [style] controls the look and feel of the text in the dropdown itself.
  ///
  /// double? [edgeMargin] is the amount of space to put around the dropdown. Defaults to 4.0 pixels.
  ///
  const BFDropdownLangObjects({
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
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<BFDropdownLangObjects> createState() => _BFDropdownLangObjectsState(
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
      );
}

class _BFDropdownLangObjectsState extends State<BFDropdownLangObjects> {
  String? label;
  String? errorMessage;
  bool outline = false;
  Color backgrounColor = kcLightGreyColor;
  IconData theIcon = Icons.arrow_drop_down;
  List<DropdownItem> itemList = [];
  DropdownItem dropdownValue;
  final Function(DropdownItem?)? whenChanged;
  final String? Function(DropdownItem?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? style;
  final double? edgeMargin;

  _BFDropdownLangObjectsState(
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
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcLightGreyColor,
      margin: EdgeInsets.all(edgeMargin == null ? 4.0 : edgeMargin!),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: DropdownButtonFormField<DropdownItem>(
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
            labelStyle: labelStyle ??
                heading4Style, // FONTSIZE - Label Text on Pull Down List Boxes
            floatingLabelBehavior: FloatingLabelBehavior.always,
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
          items: itemList
              .map<DropdownMenuItem<DropdownItem>>((DropdownItem value) {
            return DropdownMenuItem<DropdownItem>(
              value: value,
              child: Row(children: [
                value.icon ?? const SizedBox(),
                const SizedBox(width: 10),
                Text(value.displayText),
                if (value.imageWidget != null)
                  const SizedBox(width: 10)
                else
                  const SizedBox(),
                value.imageWidget ?? const SizedBox()
              ]),
            );
          }).toList(),
          onChanged: (DropdownItem? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
            if (whenChanged != null) {
              whenChanged!(newValue);
            } else {
              log("whenChanged was null.",
                  name: "bluefang_dropdown_lang_objects");
            }
          },
        ),
      ),
    );
  }
}

class DropdownItem extends Equatable {
  final String displayText;
  final Icon? icon;
  final Widget? imageWidget;
  final Locale? locale;

  const DropdownItem(
      {required this.displayText, this.icon, this.imageWidget, this.locale});

  @override
  String toString() {
    return "DropdownItem(displayText: $displayText, icon: $icon, imageWidget: $imageWidget, locale: $locale)";
  }

  @override
  List<Object> get props => [displayText];
}

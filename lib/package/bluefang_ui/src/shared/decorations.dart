import 'package:flutter/material.dart';
import 'app_colors.dart';

const Gradient kcDefaultGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [kcPrimaryColor, kcAccentColor]);

const BoxDecoration gradientDecoration =
    BoxDecoration(gradient: kcDefaultGradient);

List<BoxShadow> kcSmallShadow = [
  BoxShadow(
    color: kcBlack.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(0, 3), // changes position of shadow
  ),
];

InputDecorationTheme? kcInputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusColor: kcMediumGreyColor,
);

/// Error outline
OutlineInputBorder errorOutline = OutlineInputBorder(
  borderSide: const BorderSide(color: kcErrorColor),
  borderRadius: BorderRadius.circular(10),
);

// ignore_for_file: avoid_classes_with_only_static_members, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';

/// Contains methods used to format data for display.
class FormattingMethods {
  /// Inserts commas into a string representation of a number for display purposes.
  /// 
  /// Can handle numbers up to 7 digits long. 
  static String insertCommas(String input) {
    String returnVar;
    final String temp = input.padLeft(7);
    if (int.parse(input) > 999999) {
      returnVar =
          "${temp.substring(0, 1)},${temp.substring(1, 4)},${temp.substring(4)}";
    } else if (int.parse(input) > 999) {
      returnVar = "${temp.substring(1, 4)},${temp.substring(4)}";
    } else {
      returnVar = temp;
    }
    return returnVar;
  }

  /// Formats date into three-letter month code and day.
  ///
  /// Returns English by default or the proper code if a language is provided
  static String formatDate(int dateAsSeconds, String languageCode) {
    final DateTime theDate =
        DateTime.fromMillisecondsSinceEpoch(dateAsSeconds * 1000);
    if (languageCode == "fr") {
      log("Using $languageCode");
      return "${ReferenceTableDataFR.dateConvert[theDate.month]}-${theDate.day.toString().padLeft(2, '0')}";
    } else if (languageCode == "es") {
      log("Using $languageCode");
      return "${ReferenceTableDataES.dateConvert[theDate.month]}-${theDate.day.toString().padLeft(2, '0')}";
    } else if (languageCode == "en") {
      log("Using $languageCode");
      return "${ReferenceTableDataEN.dateConvert[theDate.month]}-${theDate.day.toString().padLeft(2, '0')}";
    } else {
      log("Using $languageCode");
      return "${ReferenceTableDataEN.dateConvert[theDate.month]}-${theDate.day.toString().padLeft(2, '0')}";
    }
  }

  /// Formats time into hh:mm AM/PM
  static String formatTime(int timeAsSeconds) {
    //Convert from seconds to milliseconds
    final DateTime theDate =
        DateTime.fromMillisecondsSinceEpoch(timeAsSeconds * 1000);
    final String hour = theDate.hour - 12 > 0
        ? (theDate.hour - 12).toString().padLeft(2, "0")
        : (theDate.hour == 12 ? "12" : theDate.hour.toString().padLeft(2, "0"));
    final String minutes = theDate.minute.toString().padLeft(2, "0");
    final String divisionOfDay = theDate.hour - 12 >= 0 ? "PM" : "AM";

    return "$hour:$minutes $divisionOfDay";
  }

  /// Formats both the date and time into "mmm - dd\nhh:mm AM/PM"
  ///
  /// Takes an integer representation of a data in **seconds** since epoch.
  static String formatEntireDate(int dateAsSeconds, String languageCode) {
    return "${formatDate(dateAsSeconds, languageCode)}\n${formatTime(dateAsSeconds)}";
  }

  /// Wrap text if it exceeds 13 characters, breaking on a space
  static String wrapText(String input) {
    String temp = "";
    int i;
    if (input.length > 13) {
      for (i = 11; i < input.length; i++) {
        if (input[i] == ' ') {
          temp = input.substring(0, i) + "\n" + input.substring(i);
          break;
        }
      }
      if (temp != "") {
        return temp;
      } else {
        return "${input.substring(0, 14)}\n${input.substring(14)}";
      }
    }
    return input;
  }
}

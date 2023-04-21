import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
/// All of these functions need to be in the same order - English, Spanish, French. 
class L10n {
  static final Map<String, String> supportedLanguages = {
    "en": "🇺🇸 English",
    "es": "🇪🇸 Español",
    "fr" : "🇫🇷 Français"
  };

  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('fr'),
  ];

  static String getCode(String language) {
    final code = supportedLanguages.keys.firstWhere(
        (element) => supportedLanguages[element] == language,
        orElse: () => 'en');
    return code;
  }

  static String getLanguage(String languageCode) {
    final language = supportedLanguages[languageCode];
    return language!;
  }

  static List<String> getAllLanguage() {
    final List<String> allLanguages = [];
    for (final element in supportedLanguages.values) {
      allLanguages.add(element);
    }

    return allLanguages;
  }
}

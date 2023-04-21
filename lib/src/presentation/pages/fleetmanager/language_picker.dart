// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:bluefang/l10n/l10n.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_dropdown_lang_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePicker extends StatelessWidget {
  DropdownItem dropdownValue = DropdownItem(displayText: "English", imageWidget: Text("🇺🇸"));
  List<DropdownItem> itemList = [];

  LanguagePicker({Key? key}) : super(key: key){
    final List<String> languageList = L10n.getAllLanguage();
    for (int i = 0; i < languageList.length; i++) {
      itemList.add(DropdownItem(displayText: languageList[i]));
    }
    dropdownValue = itemList[0];
  }

	@override
  Widget build(BuildContext context){
    return BlocBuilder<LanguageBloc, LanguageState>(
      buildWhen: (p, c) => p != c,
      builder: (context, state){
        dropdownValue =
              DropdownItem(displayText: L10n.getLanguage(state.language));
        return Column(
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.selectALanguage,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(Localizations.localeOf(context).languageCode),
            BFDropdownLangObjects(
              itemList: itemList,
              dropdownValue: dropdownValue,
              whenChanged: (value) {
                //As long as the display text matches the language names in l10n.dart
                context
                    .read<LanguageBloc>()
                    .add(ChangeLanguage(value!.displayText));
                //log("Option chosen: ${value.displayText}", name: "fleet_manager_settings_screen");
              }
            )
          ]
        );
      }
    );
  }
}

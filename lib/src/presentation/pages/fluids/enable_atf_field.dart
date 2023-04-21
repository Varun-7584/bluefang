import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_checkbox_input.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: must_be_immutable
class EnableAtfField extends HookWidget {
  bool enableAtf = true;

  EnableAtfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, UserPreferencesState>(
        bloc: getIt<UserPreferencesBloc>(),
        builder: (context, state) {
          enableAtf = state.enableAtfField;
          return BFCheckboxInput(
              isChecked: enableAtf,
              label: AppLocalizations.of(context)!.enableAtf,
              labelStyle: bodyStyle,
              onThisChanged: (bool newValue) {
                context.read<UserPreferencesBloc>().add(
                    UserPreferencesEvent.enableAtfInfo(newValue));
              });
        });
  }
}

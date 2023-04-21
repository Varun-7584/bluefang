// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_checkbox_input.dart';
import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:bluefang/src/application/DemoModeBloc/demo_mode_bloc.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

// ignore: must_be_immutable
class EnableDemoModeField extends HookWidget {
  bool isDemo = true;

  EnableDemoModeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DemoModeBloc, DemoModeState>(builder: (context, state) {
      isDemo = state.isDemo;
      return BFCheckboxInput(
          isChecked: isDemo,
          label: AppLocalizations.of(context)!.enableDemoMode,
          labelStyle: bodyStyle.copyWith(color: kcPrimaryColor),
          onThisChanged: (bool newValue) async {
            if (newValue == true) {
            } else {
              ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
            }
            context
                .read<DemoModeBloc>()
                .add(DemoModeEvent.valueChanged(newValue));
            if (newValue) {
              Navigator.pushNamed(context, GlobalRoutes.reinitDb);
            } else {
              EnvironmentManager().updateConfig(EnviromentType.prod);
              configureInjection(EnvironmentManager().currEnvironment);
              Phoenix.rebirth(context);
            }
          });
    });
  }
}

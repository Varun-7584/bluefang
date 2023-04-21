// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehSiteField extends StatefulWidget {
  String dropdownValue;
  VehSiteField({Key? key, required this.dropdownValue}) : super(key: key);
  
  @override
  State<VehSiteField> createState() => VehSiteFieldState(dropdownValue: dropdownValue);


}

class VehSiteFieldState extends State<VehSiteField>{

  VehSiteFieldState({required this.dropdownValue}) : super();
  final List<String> itemList = [
    "Home Base Site",
    "Unknown",
    "Site 3",
  ];

  @override
  void initState(){
    super.initState();
    if (!itemList
              .contains(dropdownValue)) {
            itemList.add(dropdownValue);
          }
  }

  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          // Add the site name to the dropdown list if it isn't already there
          if (!itemList
              .contains(state.programmedDataTrac.site.siteName.getOrCrash())) {
            itemList.add(state.programmedDataTrac.site.siteName.getOrCrash());
          }
          return BFDropdownAndImage(
            label: AppLocalizations.of(context)!.site,
            itemList: itemList,
            dropdownValue: dropdownValue,
            imagePath: "assets/images/SiteIcon.png",
            whenChanged: (value) => context.read<ProgramdatatracformBloc>().add(
                ProgramdatatracformEvent.siteChanged(itemList.indexOf(value))),
            validator: (_) => context
                .read<ProgramdatatracformBloc>()
                .state
                .programmedDataTrac
                .site
                .siteId
                .value
                .fold(
                    (failure) => failure.maybeMap(
                        empty: (f) =>
                            "${AppLocalizations.of(context)!.site} ${AppLocalizations.of(context)!.fieldEmpty}",
                        invalidSite: (f) =>
                            AppLocalizations.of(context)!.invalidValue,
                        orElse: () => null),
                    (validValue) => null),
          );
        });
  }
}

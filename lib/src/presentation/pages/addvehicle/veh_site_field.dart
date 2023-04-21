// ignore_for_file: must_be_immutable

import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehSiteField extends HookWidget {
  VehSiteField({Key? key}) : super(key: key);
  final List<String> itemList = [
    "Home Base Site",
    "Unknown",
    "Site 3",
  ];
  String dropdownValue = "Home Base Site";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          // Add the site name to the dropdown list if it isn't already there
          if (!itemList
              .contains(state.site.siteName.getOrCrash())) {
            itemList.add(state.site.siteName.getOrCrash());
          }
          dropdownValue = state.site.siteName.getOrCrash();
          return BFDropdownAndImage(
            label: AppLocalizations.of(context)!.site,
            itemList: itemList,
            dropdownValue: dropdownValue,
            imagePath: "assets/images/SiteIcon.png",
            whenChanged: (value) => context.read<AddVehicleBloc>().add(
                AddVehicleEvent.siteChanged(itemList.indexOf(value))),
            validator: (_) => context
                .read<AddVehicleBloc>()
                .state
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

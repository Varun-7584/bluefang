// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehFuelCapacityCard extends HookWidget {
  final String fuelCapacityText;
  final DtID dataTracID;
  final ModelAndFuel modelAndFuel;
  final String vehId;

  /// Displays the fuel capacity of the selected vehicle.
  VehFuelCapacityCard(
      {
        Key? key, required this.fuelCapacityText, required this.dataTracID,
        required this.modelAndFuel,
        required this.vehId
      
      }
  )
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, UserPreferencesState>(
        buildWhen: (p, c) => p.fuelUOM != c.fuelUOM,
        builder: (context, state) {
          return BFCardVehicleDetail(
              text: AppLocalizations.of(context)!.fuelCapacity,
              // ignore: unnecessary_parenthesis
              subtext: fuelCapacityText +
                  " " +
                  (context.read<LanguageBloc>().state.language == "es"
                      ? ReferenceTableDataES.uomFuel[context
                              .read<UserPreferencesBloc>()
                              .state
                              .fuelUOM] ??
                          "Liters"
                      : (context.read<LanguageBloc>().state.language == "fr"
                          ? ReferenceTableDataFR.uomFuel[context
                                  .read<UserPreferencesBloc>()
                                  .state
                                  .fuelUOM] ??
                              "Liters"
                          : ReferenceTableDataEN.uomFuel[context
                                  .read<UserPreferencesBloc>()
                                  .state
                                  .fuelUOM] ??
                              "Liters")),
              trailingIcon: true,
              imagePath: "assets/images/FuelIcon.png",
              onTap: () {
                Navigator.pushNamed(
                    context,
                    GlobalRoutes.fuel,
                    arguments: {
                      "dtID" : dataTracID,
                      "modelAndFuel" : modelAndFuel,
                      "vehId" : vehId,
                    }
                );
              });
        });
  }
}

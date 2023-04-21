// ignore_for_file: prefer_const_constructors

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/screens/reinitialize_db.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/connect_and_write/bluetooth_status_check.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/program_datatrac_svt_form_screen.dart';
import 'package:bluefang/src/presentation/pages/ProgrammingStatus/programming_status_screen.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/add_vehicle_screen.dart';
import 'package:bluefang/src/presentation/pages/auth/auth_page.dart';
import 'package:bluefang/src/presentation/pages/auth/signin_page.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/edit_vehicle_screen.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/fleet_manager_screen.dart';
import 'package:bluefang/src/presentation/pages/fluids/fluids_form_screen.dart';
import 'package:bluefang/src/presentation/pages/helpmenu/help_menu.dart';
import 'package:bluefang/src/presentation/pages/logging/logging_screen.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/sensor_details_screen.dart';
import 'package:bluefang/src/presentation/pages/splash_page.dart';
import 'package:bluefang/src/presentation/pages/vehicledetails/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/auth/choose_one.dart';
import '../presentation/pages/auth/company_sign_up.dart';
import '../presentation/pages/auth/existing_company_sign_up.dart';
import '../presentation/pages/auth/otp_verification.dart';
import '../presentation/pages/auth/phone_verfication.dart';
import '../presentation/pages/auth/proceed_signin.dart';
import '../presentation/pages/auth/reset_password_page.dart';
import '../presentation/pages/auth/sign_in.dart';
import '../presentation/pages/auth/start_tracking.dart';
import '../presentation/pages/auth/welcome_back.dart';
import '../presentation/pages/manageuser/inviteuser.dart';
import '../presentation/pages/manageuser/manage_users.dart';

// ignore: avoid_classes_with_only_static_members
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => FleetManagerScreen(),
        );
      case GlobalRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case GlobalRoutes.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case GlobalRoutes.reinitDb:
        return MaterialPageRoute(builder: (_) => ReInitDb(reinitUserDB: args?["reinitUserDB"] as bool? ?? false,));
      case GlobalRoutes.signIn:
        return MaterialPageRoute(builder: (_) => sign_in());
      case GlobalRoutes.fleetManager:
        return MaterialPageRoute(builder: (_) => FleetManagerScreen());
      case GlobalRoutes.programDataTrac:
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => ProgramDataTracSVTFormScreen(
              dtID: args["dtID"] as DtID,
              editedProgrammedDataTrac:
                  args["editedProgrammedDataTrac"] as ProgrammedDataTrac?,
            ),
          );
        }
        return _errorRoute();
      case GlobalRoutes.vehicleDetails:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => VehicleDetailsScreen(
                    dataTracID: args["dtID"] as DtID,
                  ));
        }
        return _errorRoute();
      case GlobalRoutes.editVehicle:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => EditVehicleScreen(
                    programmedDataTrac:
                        args["programmedDataTrac"] as ProgrammedDataTrac,
                  ));
        }
        return _errorRoute();
      case GlobalRoutes.addVehicle:
        return MaterialPageRoute(builder: (_) => AddVehicleScreen());
      case GlobalRoutes.fuel:
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => FluidsFormScreen(
              dataTracID: args["dtID"] as DtID,
              modelAndFuel: args["modelAndFuel"] as ModelAndFuel,
              vehId: args["vehId"] as String,
            ),
          );
        }
        return _errorRoute();
      case GlobalRoutes.helpMenu:
        return MaterialPageRoute(builder: (_) => HelpMenuScreen());
      case GlobalRoutes.programmingStatus:
        if (args != null) {
          return MaterialPageRoute(
            builder: (_) => ProgrammingStatusScreen(
              dataTrac: args["dataTrac"] as ProgrammedDataTrac,
              changedValuesMap:
                  args["changedValuesMap"] as Map<String, dynamic>,
              isEditing: args["isEditing"] as bool,
              realPassword: args["realPassword"] as bool,
              wiping: args["wiping"] as bool,
            ),
          );
        }
        return _errorRoute();
      case GlobalRoutes.bleStatusCheck:
        return MaterialPageRoute(builder: (_) => const CheckForBluetooth());
      case GlobalRoutes.logging:
        return MaterialPageRoute(builder: (_) => LoggingScreen());
      case GlobalRoutes.sensorDetails:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => SensorDetailsScreen(
                    dataTracID: args["dtID"] as DtID,
                    reprogramming: args["reprogramming"] as bool,
                  ));
        }
        return _errorRoute();
      case GlobalRoutes.signUpExistingCompany:
        return MaterialPageRoute(builder: (_) => existing_company_sign_up());
      case GlobalRoutes.signUpNewCompany:
        return MaterialPageRoute(builder: (_) => company_sign_up());
      case GlobalRoutes.startTracking:
        return MaterialPageRoute(builder: (_) => start_tracking());
      case GlobalRoutes.chooseOne:
        return MaterialPageRoute(builder: (_) => choose_one_main());
      case GlobalRoutes.signinWebBat:
        return MaterialPageRoute(builder: (_) => Welcome_Back());
      case GlobalRoutes.proceedSignin:
        return MaterialPageRoute(builder: (_) => proceedsignin());
      case GlobalRoutes.phoneVerification:
        return MaterialPageRoute(builder: (_) => phone_Verfication());
      case GlobalRoutes.otpVerification:
        return MaterialPageRoute(builder: (_) => Otp_Verification());
      case GlobalRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case GlobalRoutes.manageuser:
        return MaterialPageRoute(builder: (_) => manage_users());
      case GlobalRoutes.inviteuser:
        return MaterialPageRoute(builder: (_) => inviteuser());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Error'),
      ),
    );
  });
}

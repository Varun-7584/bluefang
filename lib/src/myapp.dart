// ignore_for_file: prefer_const_constructors

import 'package:bluefang/injection.dart';
import 'package:bluefang/l10n/l10n.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/application/Auth/ForgotPasswordBloc/forgot_password_cubit.dart';
import 'package:bluefang/src/application/EditVehicle/editvehicle_bloc.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/application/LoggingBloc/logging_bloc.dart';
import 'package:bluefang/src/application/ManageUser_Bloc/invite_user_cubit.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/application/ServerApiBloc/server_api_cubit.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/presentation/core/screens/app_widget.dart';
import 'package:bluefang/src/presentation/pages/splash_page.dart';
import 'package:bluefang/src/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/Auth/OtpVerificationBloc/otp_verification_bloc.dart';
import 'application/Auth/PhoneVerificationBloc/phone_verification_bloc.dart';
import 'application/Auth/SignupExistingCompanyBloc/signup_existingcompany_bloc.dart';
import 'application/Auth/SignupNewCompanyBloc/company_sign_up_bloc.dart';
import 'application/DemoModeBloc/demo_mode_bloc.dart';
import 'application/Auth/SignInBloc/sign_in_bloc.dart';
import 'application/ManageUser_Bloc/manage_user_bloc.dart';
import 'application/ManageUser_Bloc/onsave_bloc.dart';
import 'domain/user/invite_users.dart';
import 'infrastructure/manageuser/firebase_manageuser_repository.dart';

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(
          create: (context) => LanguageBloc(),
        ),
        BlocProvider<UserPreferencesBloc>(
          create: (context) => getIt<UserPreferencesBloc>()
            ..add(const UserPreferencesEvent.started()),
        ),
        BlocProvider<DemoModeBloc>(
          create: (context) =>
              getIt<DemoModeBloc>()..add(const DemoModeEvent.started()),
        ),
        BlocProvider<ProgramdatatracformBloc>(
          create: (context) => getIt<ProgramdatatracformBloc>(),
        ),
        BlocProvider<EditVehicleBloc>(
          create: (context) => getIt<EditVehicleBloc>(),
        ),
        BlocProvider<AddVehicleBloc>(
          create: (context) => getIt<AddVehicleBloc>(),
        ),
        BlocProvider<LoggingBloc>(
          create: (context) => getIt<LoggingBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ServerApiCubit>(),
        ),
        BlocProvider(
          create: (context) => FleetManagerBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignupExistingCompanyBloc(),
        ),
        BlocProvider(
          create: (context) => SignupNewCompanyBloc(),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => InviteUserCubit(),
        ),
        BlocProvider(
          create: (context) => PhoneVerificationBloc(),
        ),
        BlocProvider(
          create: (context) => OtpVerificationBloc(),
        ),
        BlocProvider(
          create: (context) => ManageUserBloc(),
        ),
        BlocProvider(
          create: (context) => OnSaveBloc(),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
          buildWhen: (p, c) => p != c,
          builder: (context, state) {
            return MaterialApp(
              title: 'BlueFang',
              theme: ThemeData.light().copyWith(
                primaryColor: kcPrimaryColor,
                scrollbarTheme: ScrollbarThemeData(
                  thickness: MaterialStateProperty.all(15),
                ),
                colorScheme:
                    ColorScheme.fromSwatch().copyWith(secondary: kcAccentColor),
              ),
              home: const Scaffold(
                //body: AppWidget(),
                body: SplashPage(),
              ),
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              supportedLocales: L10n.all,
              locale: Locale(state.language),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
            );
          }),
    );
  }
}

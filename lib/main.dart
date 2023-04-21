import 'dart:async';

import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/infrastructure/auth/firebase_repository.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:bluefang/src/myapp.dart';
import 'package:bluefang/src/presentation/pages/core/life_cycle_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'injection.dart';

Future<void> initDbManagers() async {
  await usersDbManager.init();
  await mockUserDbManager.init();
}

Future<void> startScanningBluetooth() async {
  if (EnvironmentManager().currEnvironment == EnvironmentManager.test) {
    getIt<IBluetoothRepository>().start();
  } else {
    Timer.periodic(const Duration(seconds: 10), (_) {
      getIt<IBluetoothRepository>().start();
    });
  }
}

Future<void> main() async {
  
  runZonedGuarded<Future<void>>(() async {
    // Wherever WidgetsFlutterBinding.ensureInitialized() is first called is the zone that will handle onPressed/onTap guestures! 
    // https://github.com/felangel/bloc/issues/3470
    // This means we CANNOT call it outside of this zone. 
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    prefs.getBool("demoMode");
    const String env = String.fromEnvironment('ENVIRONMENT',
        defaultValue: EnvironmentManager.prod);
    EnvironmentManager().initConfig(EnvironmentManager.getEnviromentType(env));
    prefs.setBool("demoMode", false);
    await initDbManagers();

    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        EnvironmentManager().config.reportErrors);
    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Isolate.current.addErrorListener(RawReceivePort((pair) async {
    //   final List<dynamic> errorAndStacktrace = pair;
    //   await FirebaseCrashlytics.instance.recordError(
    //     errorAndStacktrace.first,
    //     errorAndStacktrace.last,
    //     fatal: true,
    //   );
    // }).sendPort);

    // MUST HAPPEN inside the zone
    await configureInjection(env);

    prefs.setBool("running", true);

    final repo = FirebaseRepository();
    prefs.setBool("isDeviceVerified", await repo.isUserDeviceVerified());
    runApp(Phoenix(
        child: LifeCycleManager(key: UniqueKey(), child: const MyApp())));
    // startScanningBluetooth();
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;
@injectableInit
Future<void> configureInjection(String env) async {
  log("Current Environment : $env", name: "injection.dart");
  getIt.allowReassignment = true;
  await $initGetIt(getIt, environment: env);
}

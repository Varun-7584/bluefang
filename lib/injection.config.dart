// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_blue_plus/flutter_blue_plus.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i28;
import 'package:shared_preferences/shared_preferences.dart' as _i34;
import 'package:sqflite/sqflite.dart' as _i13;
import 'package:sqflite/sqlite_api.dart' as _i4;

import 'package/observer/watchlist.dart' as _i37;
import 'src/application/AddNewVehicle/addvehicle_bloc.dart' as _i47;
import 'src/application/DemoModeBloc/demo_mode_bloc.dart' as _i5;
import 'src/application/EditVehicle/editvehicle_bloc.dart' as _i48;
import 'src/application/Fluids/fluids_form_bloc.dart' as _i6;
import 'src/application/LoggingBloc/logging_bloc.dart' as _i29;
import 'src/application/PermissionsBloc/permissions_bloc.dart' as _i31;
import 'src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart'
    as _i43;
import 'src/application/ProgrammDataTrac/SettingsBloc/programdatatracsettings_bloc.dart'
    as _i32;
import 'src/application/ProgrammDataTrac/WatcherBloc/program_data_trac_watcher_data_bloc.dart'
    as _i42;
import 'src/application/ProgrammingStatusBloc/programming_status_bloc.dart'
    as _i55;
import 'src/application/SensorDetails/bloc/sensordetails_bloc.dart' as _i56;
import 'src/application/ServerApiBloc/server_api_cubit.dart' as _i45;
import 'src/application/UserPreferencesBloc/userpreferences_bloc.dart' as _i35;
import 'src/application/VehicleDetails/bloc/vehicledetails_bloc.dart' as _i46;
import 'src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart'
    as _i40;
import 'src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart'
    as _i24;
import 'src/domain/bluetooth/beacons/factory/beacon_factory.dart' as _i3;
import 'src/domain/bluetooth/i_bluetooth_controls.dart' as _i51;
import 'src/domain/bluetooth/i_bluetooth_repository.dart' as _i53;
import 'src/domain/bluetooth/i_bluetooth_service.dart' as _i8;
import 'src/domain/core/i_repository.dart' as _i49;
import 'src/domain/distance/i_distance_repository.dart' as _i14;
import 'src/domain/location/i_location_service.dart' as _i38;
import 'src/domain/logging/i_logitem_repository.dart' as _i16;
import 'src/domain/modelandfuel/i_modelandfuel_repository.dart' as _i18;
import 'src/domain/sensor/i_sensor_repository.dart' as _i20;
import 'src/domain/site/i_site_repository.dart' as _i22;
import 'src/domain/vehicle/i_vehicle_repository.dart' as _i26;
import 'src/infrastructure/aggregates/ProgrammedDataTrac/programmed_data_trac_repository.dart'
    as _i41;
import 'src/infrastructure/aggregates/vehicleInfo/vehicle_info_repository.dart'
    as _i25;
import 'src/infrastructure/bluetooth/bluetooth_controls.dart' as _i52;
import 'src/infrastructure/bluetooth/bluetooth_repository.dart' as _i54;
import 'src/infrastructure/bluetooth/bluetooth_service.dart' as _i9;
import 'src/infrastructure/bluetooth/helpers/manipulate_bf_result.dart' as _i30;
import 'src/infrastructure/bluetooth/test_services/test_bluetooth_service.dart'
    as _i10;
import 'src/infrastructure/core/injectable_modules/flutter_blue_injectable_module.dart'
    as _i58;
import 'src/infrastructure/core/injectable_modules/location_injectable_module.dart'
    as _i59;
import 'src/infrastructure/core/injectable_modules/sqllite_injectable_module.dart'
    as _i57;
import 'src/infrastructure/core/repository/i_cache.dart' as _i11;
import 'src/infrastructure/core/repository/local_repository.dart' as _i12;
import 'src/infrastructure/core/repository/repository.dart' as _i50;
import 'src/infrastructure/distance/distance_repository.dart' as _i15;
import 'src/infrastructure/location/location_service.dart' as _i39;
import 'src/infrastructure/logItem/logitem_repository.dart' as _i17;
import 'src/infrastructure/modelandfuel/modelandfuel_repository.dart' as _i19;
import 'src/infrastructure/recordnumber/record_number.dart' as _i44;
import 'src/infrastructure/sensor/sensor_repository.dart' as _i21;
import 'src/infrastructure/serverApi/server_api_repository.dart' as _i33;
import 'src/infrastructure/site/site_repository.dart' as _i23;
import 'src/infrastructure/vehicle/vehicle_repository.dart' as _i27;
import 'src/infrastructure/vinParsing/vin_parsing_repository.dart' as _i36;

const String _test = 'test';
const String _prod = 'prod';
const String _demo = 'demo';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final sqlLiteInjectableModule = _$SqlLiteInjectableModule();
  final mockSqlLiteInjectableModule = _$MockSqlLiteInjectableModule();
  final flutterBlueInjectableModule = _$FlutterBlueInjectableModule();
  final locationInjectableModule = _$LocationInjectableModule();
  final sharedPreferenceInjectableModule = _$SharedPreferenceInjectableModule();
  gh.lazySingleton<_i3.BeaconFactory>(() => _i3.BeaconFactory());
  await gh.factoryAsync<_i4.Database>(
    () => sqlLiteInjectableModule.database,
    registerFor: {
      _test,
      _prod,
    },
    preResolve: true,
  );
  await gh.factoryAsync<_i4.Database>(
    () => mockSqlLiteInjectableModule.database,
    registerFor: {_demo},
    preResolve: true,
  );
  gh.lazySingleton<_i5.DemoModeBloc>(() => _i5.DemoModeBloc());
  gh.factory<_i6.FluidsformBloc>(() => _i6.FluidsformBloc());
  gh.factory<_i7.FlutterBluePlus>(
      () => flutterBlueInjectableModule.flutterblue);
  gh.lazySingleton<_i8.IBluetoothService>(
    () => _i9.BluetoothService(get<_i7.FlutterBluePlus>()),
    registerFor: {
      _prod,
      _dev,
      _demo,
    },
  );
  gh.lazySingleton<_i8.IBluetoothService>(
    () => _i10.TestBluetoothService(),
    registerFor: {_test},
  );
  gh.lazySingleton<_i11.ICache<dynamic>>(
    () => _i12.LocalRepository<dynamic>(get<_i13.Database>()),
    dispose: (i) => i.dispose(),
  );
  gh.lazySingleton<_i14.IDistanceRepository>(
      () => _i15.DistanceRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i16.ILogItemRepository>(
      () => _i17.LogItemRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i18.IModelAndFuelRepository>(
      () => _i19.ModelAndFuelRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i20.ISensorRepository>(
      () => _i21.SensorRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i22.ISiteRepository>(
      () => _i23.SiteRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i24.IVehicleInfoRepository>(
      () => _i25.VehicleInfoRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i26.IVehicleRepository>(
      () => _i27.VehicleRepository(get<_i11.ICache<dynamic>>()));
  gh.factory<_i28.Location>(() => locationInjectableModule.location);
  gh.singleton<_i29.LoggingBloc>(_i29.LoggingBloc());
  gh.lazySingleton<_i30.ManipulateBFResult>(() => _i30.ManipulateBFResult());
  gh.lazySingleton<_i31.PermissionsBloc>(() => _i31.PermissionsBloc());
  gh.factory<_i32.ProgramdatatracsettingsBloc>(
      () => _i32.ProgramdatatracsettingsBloc());
  gh.lazySingleton<_i33.ServerApiRepository>(
      () => _i33.ServerApiRepository(get<_i11.ICache<dynamic>>()));
  await gh.factoryAsync<_i34.SharedPreferences>(
    () => sharedPreferenceInjectableModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i35.UserPreferencesBloc>(() => _i35.UserPreferencesBloc());
  gh.lazySingleton<_i36.VinParsingRepository>(
      () => _i36.VinParsingRepository(get<_i11.ICache<dynamic>>()));
  gh.lazySingleton<_i37.WatchList>(() => _i37.WatchList());
  gh.lazySingleton<_i38.ILocationService>(
      () => _i39.LocationControls(get<_i28.Location>()));
  gh.lazySingleton<_i40.IProgrammedDataTracRepository>(
      () => _i41.ProgammedDataTracRepository(
            get<_i14.IDistanceRepository>(),
            get<_i18.IModelAndFuelRepository>(),
            get<_i20.ISensorRepository>(),
            get<_i22.ISiteRepository>(),
            get<_i26.IVehicleRepository>(),
          ));
  gh.factory<_i42.ProgramDataTracWatcherDataBloc>(() =>
      _i42.ProgramDataTracWatcherDataBloc(
          get<_i40.IProgrammedDataTracRepository>()));
  gh.lazySingleton<_i43.ProgramdatatracformBloc>(
      () => _i43.ProgramdatatracformBloc(
            get<_i36.VinParsingRepository>(),
            get<_i11.ICache<dynamic>>(),
          ));
  gh.lazySingleton<_i44.RecordNumber>(
      () => _i44.RecordNumber(get<_i34.SharedPreferences>()));
  gh.singleton<_i45.ServerApiCubit>(
      _i45.ServerApiCubit(get<_i33.ServerApiRepository>()));
  gh.factory<_i46.VehicledetailsBloc>(
      () => _i46.VehicledetailsBloc(get<_i40.IProgrammedDataTracRepository>()));
  gh.factory<_i47.AddVehicleBloc>(
      () => _i47.AddVehicleBloc(get<_i40.IProgrammedDataTracRepository>()));
  gh.factory<_i48.EditVehicleBloc>(
      () => _i48.EditVehicleBloc(get<_i40.IProgrammedDataTracRepository>()));
  gh.lazySingleton<_i49.IRepository<dynamic>>(() => _i50.Repository(
        get<_i11.ICache<dynamic>>(),
        get<_i16.ILogItemRepository>(),
        get<_i37.WatchList>(),
        get<_i44.RecordNumber>(),
      ));
  gh.lazySingleton<_i51.IBluetoothControls>(
    () => _i52.BluetoothControls(
      get<_i8.IBluetoothService>(),
      get<_i20.ISensorRepository>(),
      get<_i14.IDistanceRepository>(),
      get<_i49.IRepository<dynamic>>(),
      get<_i26.IVehicleRepository>(),
      get<_i38.ILocationService>(),
      get<_i3.BeaconFactory>(),
    ),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i53.IBluetoothRepository>(() => _i54.BluetoothRepository(
        get<_i51.IBluetoothControls>(),
        get<_i11.ICache<dynamic>>(),
        get<_i20.ISensorRepository>(),
      ));
  gh.factory<_i55.ProgrammingStatusBloc>(() => _i55.ProgrammingStatusBloc(
        get<_i53.IBluetoothRepository>(),
        get<_i40.IProgrammedDataTracRepository>(),
        get<_i16.ILogItemRepository>(),
      ));
  gh.factory<_i56.SensordetailsBloc>(() => _i56.SensordetailsBloc(
        get<_i53.IBluetoothRepository>(),
        get<_i20.ISensorRepository>(),
        get<_i14.IDistanceRepository>(),
      ));
  return get;
}

class _$SqlLiteInjectableModule extends _i57.SqlLiteInjectableModule {}

class _$MockSqlLiteInjectableModule extends _i57.MockSqlLiteInjectableModule {}

class _$FlutterBlueInjectableModule extends _i58.FlutterBlueInjectableModule {}

class _$LocationInjectableModule extends _i59.LocationInjectableModule {}

class _$SharedPreferenceInjectableModule
    extends _i57.SharedPreferenceInjectableModule {}

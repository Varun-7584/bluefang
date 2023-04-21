

// ignore_for_file: prefer_const_constructors

// import 'package:bloc_test/bloc_test.dart';
// import 'package:bluefang/injection.dart';
// import 'package:bluefang/src/application/DataUpdateApiBloc/data_update_api_bloc.dart';
// import 'package:bluefang/src/infrastructure/core/database_manager.dart';
// import 'package:bluefang/src/infrastructure/serverApi/data_update_dto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// /// This can't really be tested until the bloc_test package can be fully upgraded. Even then, it's only a partial test because getIt<> won't play nice with testing. 
// void main(){
//   setUpAll(
//     () async{
//       TestWidgetsFlutterBinding.ensureInitialized();
//       // sqfliteFfiInit();
//       // databaseFactory = databaseFactoryFfi;
//       // await usersDbManager.init();
//       // await mockUserDbManager.init();
//       // await configureInjection("prod");
//     }
//   );
//   group("DataUpdateApiBloc tests", (){
//     blocTest(
//       "", 
//       build: () => DataUpdateApiBloc(),
//       act: (DataUpdateApiBloc bloc) => bloc.add(DataUpdateApiEvent.getUpdates()),
//       expect: () => [isA<DataUpdateApiState>()]
//     );
//   });

// }

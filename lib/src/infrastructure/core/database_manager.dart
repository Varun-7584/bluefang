import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  Database? _db;
  String fileName;
  bool dbCopied = false;

  DatabaseManager({required this.fileName});

  // @factoryMethod
  // Future<void> init() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final bool demoModeFlag = prefs.getBool('demoMode') ?? false;

  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, fileName);
  //   final exists = await databaseExists(path);
  //   if (exists && !demoModeFlag) {
  //     _db = await openDatabase(path);
  //   } else if (exists && demoModeFlag && dbCopied) {
  //     _db = await openDatabase(path);
  //   } else {
  //     // ignore: avoid_print

  //     final ByteData data =
  //         await rootBundle.load(join("assets", "SQLLiteDb", fileName));
  //     final List<int> bytes =
  //         data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  //     await File(path).writeAsBytes(bytes, flush: true);
  //     dbCopied = true;
  //     await init();
  //   }
  // }

  ///Initializes the database. 
  ///
  ///Makes sure the database exists or is created. 
  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    final exists = await databaseExists(path);
    //If the database already exists, open it. Otherwise, recreate it. 
    if (exists) {
      log('$fileName Already Exists', name: 'database_manager.dart');
      _db = await openDatabase(path);
    } else {
      log('Creating a new copy of $fileName from assets',
          name: 'database_manager.dart');
      final ByteData data =
          await rootBundle.load(join("assets", "SQLLiteDb", fileName));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      log('Copy of $fileName Created', name: 'database_manager.dart');
      await init();
    }
  }

  /// Makes sure the database exists and that the path is correct. 
  Future<bool> isDbPresent() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    final exists = await databaseExists(path);
    return exists;
  }

  /// Re-creates the database. 
  Future<bool> reinitializeFreshDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    final exists = await databaseExists(path);
    if (exists) {
      try {
        await deleteDatabase(path);
        await init();

        return true;
      } catch (err) {
        throw Exception('Error re-initializing the database.');
      }
    } else {
      return false;
    }
  }

  Future<Database> get db async {
    while (_db == null) {
      throw 'Database is null';
    }
    return _db!;
  }

  /// Gets the database path. 
  /// 
  /// Returns the path if the database exists; otherwise, returns an empty string.
  Future<String> getDBPath() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);
    final exists = await databaseExists(path);
    if (!exists) {
      path = "";
    }
    return path;
  }

  @disposeMethod
  void dispose() {
    _db?.close();
  }
}

DatabaseManager mockUserDbManager =
    DatabaseManager(fileName: 'Mock_User_Tables.db');
DatabaseManager usersDbManager = DatabaseManager(fileName: 'User_Tables.db');

// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bluefang/src/domain/core/repository_failures.dart';

import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

abstract class ICache<T> {
  Future<Either<RepositoryFailures, T>?> insert(
      String table, Map<String, Object?> values,
      {String? nullColumnHack,
      ConflictAlgorithm? conflictAlgorithm,
      bool commit = true});

  Future<Either<RepositoryFailures, dynamic>?> rawInsert(String sql, {List<Object?>? arguments, required bool commit});
  
  Future<List<Object?>> commitTransactions();
  
  void cancelTransaction();
  
  Future<Either<RepositoryFailures, List<Map<String, Object?>>>> query(
      String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset});

  Future<Either<RepositoryFailures, T>?> update(
      String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm});

  Future<Either<RepositoryFailures, T>?> delete(String table,
      {String? where, List<Object?>? whereArgs});

  Future<Either<RepositoryFailures, T>> findAll(
      {required String tableName, required Map<String, Object?> entity});

  Future<Either<RepositoryFailures, List<Map<String, Object?>>>> rawQuery(
      String sql,
      [List<Object?>? arguments]);
  void dispose();
}

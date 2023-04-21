// TODO Look into the below issue.
// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';
import 'dart:developer';
import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ICache)
class LocalRepository<T> implements ICache {
  final Database _localDatabase;

  Batch? _transaction;
  int calls = 0;
  LocalRepository(
    this._localDatabase,
  );
  Batch get _tx {
    _transaction ??= _localDatabase.batch();
    return _transaction!;
  }

  Future<bool> getTransactionStatus(Batch tx) async {
    final List<Object?> result = await tx.commit();
    if (result.isNotEmpty) {
      return true;
    }
    return false;
  }

  //This method used to be private, but that meant an insert or delete had to be performed to commit the batch of transactions.
  //Requiring an insert or delete to commit prevented good error handling. (Bailie Gowing 9/1/22)
  @override
  Future<List<Object?>> commitTransactions() async {
    var result = [];
    try {
      result = await _tx.commit();
    } catch (err) {
      rethrow;
    } finally {
      _transaction = null;
    }
    return result;
  }

  @override
  void cancelTransaction() {
    _transaction = null;
  }

  @override

  /// Insert the given [values] into the [table] using the [conflictAlgorithm] to resolve any conflicts.
  ///
  /// Defaults to [commit]ing when it finishes inserting.
  Future<Either<RepositoryFailures, dynamic>?> insert(
      String table, Map<String, Object?> values,
      {String? nullColumnHack,
      ConflictAlgorithm? conflictAlgorithm,
      bool commit = true}) async {
    try {
      calls += 1;

      _tx.insert(table, values,
          nullColumnHack: nullColumnHack, conflictAlgorithm: conflictAlgorithm);

      if (commit) {
        final result = await commitTransactions();

        final returns =
            result.map<Either<RepositoryFailures, dynamic>>((e) => right(e));
        if (kDebugMode) {
          print("001 🪡 : Inserted $values to table: $table. Result: $returns");
        }
        return right(returns.last);
      } else {
        return null;
      }
    } catch (e) {
      return left(RepositoryFailures.insertionFailure(err: e));
    }
  }

  @override
  ///
  ///
  Future<Either<RepositoryFailures, dynamic>?> rawInsert(String sql, {List<Object?>? arguments, bool commit = true}) async {
    try {
      calls++;
      _tx.rawInsert(sql, arguments);

      if (commit){
        final result = await commitTransactions();

        final returns =
            result.map<Either<RepositoryFailures, dynamic>>((e) => right(e));
        if (kDebugMode) {
          log("001: Inserted using sql string $sql. Result: $returns");
        }
        return right(returns.last);
      } else {
        return null;
      }

    } catch (e){
      return left(RepositoryFailures.insertionFailure(err: e));
    }

  }

  @override
  Future<Either<RepositoryFailures, dynamic>?> update(
      String table, Map<String, Object?> values,
      {String? where,
      List<Object?>? whereArgs,
      ConflictAlgorithm? conflictAlgorithm,
      bool commit = true}) async {
    try {
      calls = calls + 1;
      if (kDebugMode) {
        print("📥 : Updating $values on table: $table");
      }
      if (values.isEmpty) {
        return left(const RepositoryFailures.updateFailure(
            err: 'The values are empty'));
      }
      _tx.update(table, values,
          where: where,
          whereArgs: whereArgs,
          conflictAlgorithm: conflictAlgorithm);
      if (commit) {
        final result = await commitTransactions();

        return right(result.last);
      }
    } catch (err) {
      return left(RepositoryFailures.updateFailure(err: err));
    }
  }

  @override
  Future<Either<RepositoryFailures, dynamic>?> delete(String table,
      {String? where, List<Object?>? whereArgs, bool commit = true}) async {
    try {
      calls += 1;
      if (kDebugMode) {
        print(
            "🔪: Deleting where $where , whereargs: $whereArgs on table: $table");
      }
      _tx.delete(table, whereArgs: whereArgs, where: where);
      if (commit) {
        final result = await commitTransactions();
        return right(result.last);
      }
    } catch (err) {
      return left(RepositoryFailures.deleteFailure(err: err));
    }
  }

  @override
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
      int? offset}) async {
    try {
      calls += 1;
      if (kDebugMode) {
        log("Performing query: where $where , whereargs: $whereArgs on columns: $columns on table: $table");
      }
      final result = await _localDatabase.query(
        table,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
      if (kDebugMode) {
        log("Total calls: $calls");
      }
      return right(result);
    } catch (err) {
      return left(RepositoryFailures.queryFailure(err: err));
    }
  }

  @override
  Future<Either<RepositoryFailures, dynamic>> findAll(
      {required String tableName, required Map<String, Object?> entity}) async {
    try {
      calls += 1;
      final result = await _localDatabase.query(tableName);
      return right(result);
    } catch (err) {
      return left(RepositoryFailures.queryFailure(err: err));
    }
  }

  dynamic findByID(String table, String columnName, ValueObject id) {
    try {
      calls += 1;
      final result = _localDatabase
          .query(table, where: "$columnName = ?", whereArgs: [id.getOrCrash()]);
      return result;
    } catch (err) {
      return err;
    }
  }

  @override
  Future<Either<RepositoryFailures, List<Map<String, Object?>>>> rawQuery(
      String sql,
      [List<Object?>? arguments]) async {
    try {
      calls = calls + 1;
      final result = await _localDatabase.rawQuery(sql, arguments);

      return right(result);
    } catch (err) {
      return left(RepositoryFailures.queryFailure(err: err));
    }
  }

  @override
  @disposeMethod
  void dispose() {
    _localDatabase.close();
  }
}

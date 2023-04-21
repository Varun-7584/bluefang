import 'dart:developer';

import 'package:bluefang/src/domain/site/i_site_repository.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/site/site_failure.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ISiteRepository)
class SiteRepository implements ISiteRepository {
  final ICache _localRepository;
  SiteRepository(this._localRepository);
  @override
  Future<Either<SiteFailure, Unit>> add({required Site site}) async {
    try {
      final siteDto = SiteDto.fromDomain(site);
      await _localRepository.insert(SiteDBFields.tableName, siteDto.toJson(), conflictAlgorithm: ConflictAlgorithm.ignore);
      return right(unit);
    } catch (err) {
      log("Error inserting site into database: $err", name: "site_repository.dart");
      return left(SiteFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SiteFailure, Site>> find({required SiteID siteID}) async {
    try {
      final result = await _localRepository.query(
        SiteDBFields.tableName,
        where: "${SiteDBFields.primaryKey} = ?",
        whereArgs: [siteID.getOrCrash()],
      );

      final value = result.getOrElse(() => throw 'Error Getting Site Value');
      final Site site = SiteDto.fromJson(value[0]).toDomain();
      return right(site);
    } catch (err) {
      return left(SiteFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SiteFailure, Unit>> update({required Site site}) async {
    try {
      final siteDto = SiteDto.fromDomain(site);
      final result = await _localRepository.update(
        SiteDBFields.tableName, siteDto.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: "${SiteDBFields.siteID} = ?",
        whereArgs: [siteDto.siteId]
      );
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(SiteFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      return left(SiteFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SiteFailure, Unit>> delete({required SiteID siteID}) async {
    try {
      await _localRepository.delete(
        SiteDBFields.tableName,
        where: "${SiteDBFields.primaryKey} = ?",
        whereArgs: [siteID.getOrCrash()],
      );
      return right(unit);
    } catch (err) {
      return left(SiteFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SiteFailure, KtList<Site>>> fetchAll() async {
    try {
      final result = await _localRepository.query(SiteDBFields.tableName);

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = SiteDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      return left(SiteFailure.databaseError(err: err));
    }
  }
}

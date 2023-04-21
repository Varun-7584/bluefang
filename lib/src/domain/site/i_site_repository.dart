import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/site/site_failure.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class ISiteRepository {
  // create
  Future<Either<SiteFailure, Unit>> add({required Site site});
  // read
  Future<Either<SiteFailure, Site>> find({required SiteID siteID});
  // update
  Future<Either<SiteFailure, Unit>> update({required Site site});
  // delete
  Future<Either<SiteFailure, Unit>> delete({required SiteID siteID});
  // Find all
  Future<Either<SiteFailure, KtList<Site>>> fetchAll();
}

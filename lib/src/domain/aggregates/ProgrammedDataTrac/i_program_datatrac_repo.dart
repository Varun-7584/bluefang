// ignore_for_file: require_trailing_commas

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IProgrammedDataTracRepository {
  /// Adds a new Programmed data trac to the database.
  /// Requires the [programmedDataTrac] to be added.
  Future<Either<ProgrammedDataTracFailure, Unit>> add(
      {required ProgrammedDataTrac programmedDataTrac});

  /// Looks for a programmed data trac in the database based on a DtID.
  /// Returns either a failure object or the Programmed data trac object.
  /// [dtID] must be non-null and must be provided.
  Future<Either<ProgrammedDataTracFailure, ProgrammedDataTrac>> find(
      {required DtID dtID});

  /// Updates the program data trac in the database.
  /// If the data trac does not already exist, the data trac is created. Otherwise, the data trac currently in the database is overwritten.
  Future<Either<ProgrammedDataTracFailure, Unit>> update(
      {required ProgrammedDataTrac programmedDataTrac});

  /// Deletes a Programmed DataTrac with dtID [dtID] from the database.
  /// Requires [dtID], which cannot be null.
  Future<Either<ProgrammedDataTracFailure, Unit>> delete({required DtID dtID});

  /// Returns a list of all the data tracs in the database.
  /// No parameters.
  Future<Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>>
      findAll();

  Future<Either<ProgrammedDataTracFailure, Unit>> upsert();
      
}

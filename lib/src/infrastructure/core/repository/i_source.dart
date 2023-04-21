import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:dartz/dartz.dart';

abstract class ISource<T> {
  Future<Either<RepositoryFailures, T>> addItem();
  Future<Either<RepositoryFailures, T>> fetchItem();
  Future<Either<RepositoryFailures, T>> updateItem();
  Future<Either<RepositoryFailures, T>> deleteItem();
}

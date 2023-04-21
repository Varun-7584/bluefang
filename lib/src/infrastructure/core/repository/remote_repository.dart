import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_source.dart';
import 'package:dartz/dartz.dart';

class RemoteRepository implements ISource {
  @override
  Future<Either<RepositoryFailures, dynamic>> addItem() {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<Either<RepositoryFailures, dynamic>> deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Either<RepositoryFailures, dynamic>> fetchItem() {
    // TODO: implement fetchItem
    throw UnimplementedError();
  }

  @override
  Future<Either<RepositoryFailures, dynamic>> updateItem() {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}

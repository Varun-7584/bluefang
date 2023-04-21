import 'package:bluefang/src/domain/logging/log_item.dart';
import 'package:bluefang/src/domain/logging/logitem_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class ILogItemRepository {
  // create
  Future<Either<LogItemFailure, Unit>> add({required LogItem logItem});
  // find all
  Future<Either<LogItemFailure, KtList<LogItem>>> fetchItems(int number);
  Future<Either<LogItemFailure, Unit>> deleteAllRecords();
}

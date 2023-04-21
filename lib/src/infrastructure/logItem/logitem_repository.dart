import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/logging/i_logitem_repository.dart';
import 'package:bluefang/src/domain/logging/i_record_number.dart';
import 'package:bluefang/src/domain/logging/log_item.dart';
import 'package:bluefang/src/domain/logging/logitem_failure.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/logItem/log_item_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

@LazySingleton(as: ILogItemRepository)
class LogItemRepository implements ILogItemRepository {
  final ICache _localRepository;
  LogItemRepository(this._localRepository);
  @override
  Future<Either<LogItemFailure, Unit>> add({required LogItem logItem}) async {
    try {
      final logItemDto = LogItemDto.fromDomain(logItem);
      log("LogItem as JSON: ${logItemDto.toJson()}");
      final result = await _localRepository.insert(
          LogItemDBFields.tableName, logItemDto.toJson()..remove(LogItemDBFields.recordId),
      );
      if (result?.isLeft() ?? true){
        return left(LogItemFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Error writing log item to database: $err");
      return left(LogItemFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<LogItemFailure, KtList<LogItem>>> fetchItems(int number) async {
    try {
      final String query =
          """SELECT * FROM Logging ORDER BY Logging.recordId desc LIMIT $number """;
      final result = await _localRepository.rawQuery(query);
      log("JSON result: $result", name: "logitem_repository.dart");
      final list = result
          .map((jsonList) => jsonList.map((json) {
                final logItem = LogItemDto.fromJson(json).toDomain();
                return logItem;
              }).toImmutableList())
          .getOrElse(() {
        return throw 'Error while mapping to list';
      });
      if (result.isLeft()){
        return left(LogItemFailure.databaseError(err: result));
      }
      log("Log item list: $list", name: "logitem_repository.dart");
      return right(list);
    } catch (err) {
      return left(LogItemFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<LogItemFailure, Unit>> deleteAllRecords() async {
    try {
      await _localRepository.rawQuery("DELETE FROM Logging");
      getIt<IRecordNumber>().reset();
      return right(unit);
    } catch (err) {
      return left(LogItemFailure.databaseError(err: err));
    }
  }
}

import 'dart:collection';
import 'package:bluefang/package/observer/watchlist.dart';
import 'package:bluefang/src/domain/core/i_repository.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/logging/i_logitem_repository.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:bluefang/src/infrastructure/recordnumber/record_number.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/logging/log_item.dart';

@LazySingleton(as: IRepository)
class Repository implements IRepository {
  final ICache _localRepository;
  RecordNumber recordNumber;
  final WatchList _watchList;
  final ILogItemRepository _logItemRepository;
  Repository(this._localRepository, this._logItemRepository, this._watchList,
      this.recordNumber);

  @override
  Future<Either<RepositoryFailures, Unit>> scribeRoutine({
    required MTChangedValues changedFields,
    required String table,
    required String primaryId,
    required String primaryIdValue,
    required DtID dtID,
    required VehID vehID,
  }) async {
    if (changedFields.changedParameter.isNotEmpty) {
      try {
        final Map<String, Object?> updateMap = Map.from(changedFields.rightMap);
        updateMap.putIfAbsent(DistanceDBFields.dateTimeRep, () => null);
        updateMap[DistanceDBFields.dateTimeRep] = DateTimeMod.now().getOrCrash();
        updateMap.putIfAbsent(SensorDBFields.dateTimeRep, () => null);
        updateMap[SensorDBFields.dateTimeRep] = DateTimeMod.now().getOrCrash();
        final changedParameters = changedFields.changedParameter;
        final Queue<LogItem> queueOfLogItems = Queue();
        for (final MTChangedParameter item in changedParameters) {
          final LogItem logItem = LogItem(
              dateTime: DateTimeMod.now(),
              messageType: MessageType.fromTableName(table),
              descShort: item.parameter,
              recordId: recordNumber.createNewRecordId(),
              valueOld: item.previousValue,
              valueNew: item.currentValue,
              descFull: "",
              vehId: vehID,
              dtId: dtID);
          queueOfLogItems.addFirst(logItem);
        }

        await _localRepository.update(table, updateMap,
            where: "$primaryId = ?",
            whereArgs: [primaryIdValue]).whenComplete(() {
          if (_watchList.key.isNotEmpty) {
            _watchList.dtItChanged(dtID);
          }
        });

        while (queueOfLogItems.isNotEmpty) {
          final LogItem logItem = queueOfLogItems.removeLast();
          await _logItemRepository.add(logItem: logItem);
        }

        return right(unit);
      } catch (err) {
        return left(RepositoryFailures.scibeError(failedValue: err));
      }
    } else {
      return right(unit);
    }
  }
}

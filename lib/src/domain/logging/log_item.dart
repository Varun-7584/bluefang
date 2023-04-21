import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_item.freezed.dart';

@freezed
class LogItem with _$LogItem {
  const LogItem._();
  const factory LogItem({
    required DateTimeMod dateTime,
    required MessageType messageType,
    required String descShort,
    required int recordId,
    required String valueOld,
    required String valueNew,
    required String descFull,
    required VehID vehId,
    required DtID dtId,
    Byte? vehType,
  }) = _LogItem;

  /// Creates an empty LogItem.
  /// 
  /// Defaults: 
  /// ```
  /// messageType: MessageType(MessageTypeEnum.MOD_V),
  /// descShort: "Empty log entry",
  /// dateTime: DateTimeMod.now(),
  /// recordId: 0,
  /// valueOld: "empty",
  /// valueNew: "empty",
  /// descFull: "Empty",
  /// vehId: VehID('1234'),
  /// dtId: DtID(123),
  /// vehType: Byte(0),
  /// ```
  factory LogItem.empty() => LogItem(
        messageType: MessageType(MessageTypeEnum.MOD_V),
        descShort: "Empty log entry",
        dateTime: DateTimeMod.now(),
        recordId: 0,
        valueOld: "empty",
        valueNew: "empty",
        descFull: "Empty",
        vehId: VehID('1234'),
        dtId: DtID(123),
        vehType: Byte(0),
      );

  // TODO: Make this method actually do someting
  List<LogItem> generateLogItemList(Map<String, List<Object>> changedValues) {
    final LogItem logItem = LogItem.empty();
    final List<LogItem> logs = [];
    logs.add(logItem);

    return logs;
  }
}

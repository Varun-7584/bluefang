import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/logging/log_item.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_item_dtos.freezed.dart';

@freezed
class LogItemDto with _$LogItemDto {
  const LogItemDto._();

  /// Stores all of the information to create a log entry
  const factory LogItemDto({
    required String msgType,
    required int dateTimeMod,
    required String descShort,
    required int recordId,
    required String valueOld,
    required String valueNew,
    required String descFull,
    required String vehId,
    required int dtId,
    int? vehType,
  }) = _LogItemDto;

  /// Creates a LogItemDto from a [LogItem].
  /// 
  /// Crashes if any of the values are null. 
  factory LogItemDto.fromDomain(LogItem logItem) {
    return LogItemDto(
      msgType: logItem.messageType.getOrCrash(),
      dateTimeMod: logItem.dateTime.getOrCrash(),
      descShort: logItem.descShort,
      recordId: logItem.recordId,
      valueOld: logItem.valueOld,
      valueNew: logItem.valueNew,
      descFull: logItem.descFull,
      vehId: logItem.vehId.getOrCrash(),
      dtId: logItem.dtId.getOrCrash(),
      vehType: logItem.vehType?.getOrCrash(),
    );
  }

  /// Creates an instance of [LogItem] from this DTO. 
  /// 
  /// Assumes that [vehType] is not null. 
  LogItem toDomain() {
    return LogItem(
      dateTime: DateTimeMod.fromInt(dateTimeMod),
      messageType: MessageType.fromString(msgType),
      descShort: descShort,
      recordId: recordId,
      valueOld: valueOld,
      valueNew: valueNew,
      descFull: descFull,
      vehId: VehID(vehId),
      dtId: DtID(dtId),
      vehType: Byte(vehType!),
    );
  }

  /// Creates a [LogItemDto] from a map representation of JSON. 
  /// 
  /// Cannot handle values for [recordId], [dtId], [vehType], or [dateTimeMod] that do not convert to int. 
  factory LogItemDto.fromJson(Map<String, dynamic> json) {
    return LogItemDto(
      msgType: json[LogItemDBFields.messageType].toString().toUpperCase(),
      dateTimeMod: json[LogItemDBFields.dateTime] as int,
      descShort: json[LogItemDBFields.descShort].toString(),
      recordId: json[LogItemDBFields.recordId] as int,
      valueOld: json[LogItemDBFields.valueOld].toString(),
      valueNew: json[LogItemDBFields.valueNew].toString(),
      descFull: json[LogItemDBFields.descFull].toString(),
      vehId: json[LogItemDBFields.vehId].toString(),
      dtId: json[LogItemDBFields.dtId] as int,
      vehType: json[LogItemDBFields.vehType] as int? ?? 0,
    );
  }

  /// Converts this object to a `Map<String, Object>` that can be encoded as a JSON string.
  /// 
  /// Uses the field names from the database as keys. 
  Map<String, Object?> toJson() => {
        LogItemDBFields.dtId: dtId,
        LogItemDBFields.messageType: msgType,
        LogItemDBFields.descShort: descShort,
        LogItemDBFields.vehId: vehId,
        LogItemDBFields.recordId: recordId,
        LogItemDBFields.valueNew: valueNew,
        LogItemDBFields.valueOld: valueOld,
        LogItemDBFields.descFull: descFull,
        LogItemDBFields.dateTime: dateTimeMod,
      };
}

/// Static class to store the names of the database fields.
class LogItemDBFields {
  static const String tableName = 'Logging';
  static const String primaryKey = 'dateTime';
  static const String dtId = 'dtId';
  static const String messageType = 'messageType';
  static const String descShort = 'descShort';
  static const String vehId = 'vehId';
  static const String recordId = 'recordId';
  static const String valueNew = 'valueNew';
  static const String valueOld = 'valueOld';
  static const String descFull = 'descFull';
  static const String dateTime = 'dateTime';
  static const String vehType = 'vehType';
}

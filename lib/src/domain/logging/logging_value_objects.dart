// ignore_for_file: constant_identifier_names

import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/logging/logging_value_validators.dart';
import 'package:dartz/dartz.dart';

/// MOD_V = Modify Vehicle Table
/// MOD_S = Modify Sensor Table
/// MOD_D = Modify Distance Table
/// MOD_M = Modify Model_n_Fuel Table
/// MOD_T = Modify Terminal (Site)
/// ERR_U = Error updating datatrac
/// ERR_V = Error verifying datatrac

enum MessageTypeEnum { 
  MOD_V, 
  MOD_S, 
  MOD_D, 
  MOD_M, 
  MOD_T, 
  ERR_U, 
  ERR_V
}

/// stores the message type of either MOD_V, MOD_S, MOD_D, MOD_M and MOD_T.
///
/// Valueobject which takes MessageTypeEnum as an parameter
///
/// It can also be created fromString
class MessageType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MessageType(MessageTypeEnum input) {
    return MessageType._(validateMessageType(input: input));
  }

  factory MessageType.fromString(String input) {
    return MessageType._(validateMessageTypeFromString(input: input));
  }
  factory MessageType.fromTableName(String input) {
    assert(input.isNotEmpty);
    final String finalInput = input.toLowerCase() == "site"
        ? "MOD_T"
        : "MOD_${input.toUpperCase()[0]}";
    return MessageType._(validateMessageTypeFromString(input: finalInput));
  }

  // factory MessageType.MOD_V() {
  //   return MessageType(MessageTypeEnum.MOD_V);
  // }

  const MessageType._(this.value);
}

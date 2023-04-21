import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> validateMessageType(
    {required MessageTypeEnum input}) {
  if (MessageTypeEnum.values.contains(input)) {
    return right(input.name);
  } else {
    return left(ValueFailure.invalidValue(failedValue: input.name));
  }
}

Either<ValueFailure<String>, String> validateMessageTypeFromString(
    {required String input}) {
  if (input.isNotEmpty) {
    final Map<String, MessageTypeEnum> enumMap = {};
    const List<MessageTypeEnum> valuesInEnum = MessageTypeEnum.values;

    for (var i = 0; i < valuesInEnum.length; i++) {
      enumMap[valuesInEnum[i].name] = valuesInEnum[i];
    }
    MessageTypeEnum output;
    if (enumMap.containsKey(input.toUpperCase())) {
      output = enumMap[input.toUpperCase()]!;
    } else {
      return left(const ValueFailure.invalidMessageType());
    }
    return right(output.name);
  } else {
    return left(const ValueFailure.invalidMessageType());
  }
}

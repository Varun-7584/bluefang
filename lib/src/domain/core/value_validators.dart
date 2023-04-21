import 'package:bluefang/src/domain/core/extensions/nums.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_transformers.dart';
import 'package:dartz/dartz.dart';
import 'package:instant/instant.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateASCII_32To126(String input) {
  const ascii32To126Regex = r"""^(?:(?!["';<=>\\])[\x20-\x7E])+$""";
  if (RegExp(ascii32To126Regex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidValue(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  final sanitzedInput = removeSpaceCharacterFromString(input);
  if (sanitzedInput.length <= maxLength) {
    return right(sanitzedInput);
  } else {
    return left(ValueFailure.exceedingLength(
        failedValue: sanitzedInput, max: maxLength));
  }
}

Either<ValueFailure<int>, int> validateInt({required int input}) {
  const intRegex = r"""^[0-9]([0-9]*)$""";
  if (RegExp(intRegex).hasMatch(input.toString())) {
    return right(input);
  } else {
    return left(ValueFailure.invalidIntValue(failedValue: input));
  }
}

Either<ValueFailure<int>, int> validateIntRange(
    {required int input, required int min, required int max}) {
  if (input >= min && input <= max) {
    return right(input);
  } else {
    return left(
        ValueFailure.invalidRange(failedValue: input, min: min, max: max));
  }
}

Either<ValueFailure<double>, double> validateDoubleRange(
    {required double input, required double min, required double max}) {
  if (min <= input && input <= max) {
    return right(input);
  } else {
    return left(ValueFailure.invalidDoubleRange(
        failedValue: input, min: min, max: max));
  }
}

Either<ValueFailure<int>, int> validateDateTime(DateTime input) {
  final DateTime utcTime = input.toUtc();
  final now = curDateTimeByZone(zone: 'UTC');
  final int timeInSeconds = input.millisecondsSinceEpoch ~/ 1000;
  if (utcTime.isUtc &&
      utcTime.isBefore(now.add(const Duration(minutes: 1))) &&
      utcTime.isAfter(now.subtract(const Duration(days: 4000)))) {
    return right(timeInSeconds);
  } else {
    return left(ValueFailure.invalidDateTime(failedValue: timeInSeconds));
  }
}

///Takes unix int value in seconds
Either<ValueFailure<int>, int> validateDateTimeInt(int input) {
  // Converting the input value to DateTime Object.
  // The values coming in is always from a database so we can be sure that this is int.
  // Maybe need to add more validations? Not sure.

  // Here, we are checking for either of int of length 10 or 13.
  // This is because on our database we store the unix time (which is of length 10).
  // For dart, when we are using .fromMillisecondsSinceEpoch method we get an integer of length 13
  // This is the standard length for dart. Our class DateTimeMod can either just take the values from the database
  // Or, it can be created from integer value. When it is created from .fromInt([DateTime.fromMillisecondsSinceEpoch])
  // We can either already convert it into 10 numbers by ~/1000 or just pass it.
  // So, here, we need to check the length of the input and make sure it is either of length 10 or 13.
  // And if it is of length 10, we can just process it, if not we need to divide it by 1000.
  const int lengthOfUnixTimeOnDb = 10;
  const int lengthOfUnixTimeFromMillisecondsSinceEpochMethod = 13;
  final bool isValidLength = input.length() != lengthOfUnixTimeOnDb &&
      input.length() != lengthOfUnixTimeFromMillisecondsSinceEpochMethod;

  if (isValidLength) {
    return left(ValueFailure.invalidIntValue(failedValue: input));
  }
  final int verifiedInput = input.length() == 13 ? input ~/ 1000 : input;
  final DateTime utcTime =
      DateTime.fromMillisecondsSinceEpoch(verifiedInput * 1000);
  final now = curDateTimeByZone(zone: 'UTC');
  final bool isNotADateInFuture =
      utcTime.isBefore(now.add(const Duration(days: 1)));
  final bool isNotADateInPast =
      utcTime.isAfter(now.subtract(const Duration(days: 4000)));
  if (isNotADateInFuture && isNotADateInPast) {
    return right(verifiedInput);
  } else {
    return left(ValueFailure.invalidDateTime(failedValue: input));
  }
}

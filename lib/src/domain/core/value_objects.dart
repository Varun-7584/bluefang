import 'package:bluefang/src/domain/core/errors.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'Value($value)';

  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure] if the value is invalid.]
  T getOrCrash() {
    return value.fold((f) => throw UnexpectedValueError(f, value), (r) => r);
  }

  /// Throws [ValueError] if the value is invalid, and returns the value if it's valid.
  dynamic getValueOrError() {
    return value
        .fold((l) => left(l), (r) => right(r))
        .fold((left) => left, (right) => right);
  }

  dynamic getValueOrErrorString() {
    return value
        .fold((l) => left(l), (r) => right(r))
        .fold((left) => 'InvalidValue', (right) => right);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }
}

class UserID extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory UserID(int input) {
    return UserID._(validateIntRange(input: input, min: 0, max: 65536));
  }
  const UserID._(this.value);
}

/// This is GPS Latitude location of the Site. Real Number +/-90.00000
/// (5 decimal places is about 1m resolution)
class GpsLat extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory GpsLat(double input) {
    return GpsLat._(validateDoubleRange(input: input, min: -90, max: 90));
  }
  const GpsLat._(this.value);
}

/// This is GPS Longitude location of the Site. Range: Real number +/-180.00000
class GpsLon extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory GpsLon(double input) {
    return GpsLon._(validateDoubleRange(input: input, min: -180, max: 180));
  }
  const GpsLon._(this.value);
}

///This is GPS Longitude/Latitude location tolerance to define the North/South(For Latitude) or East/West(For longitude) limits of a customer location.
class GpsLocTol extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory GpsLocTol(double input) {
    return GpsLocTol._(validateDoubleRange(input: input, min: 0, max: 65535));
  }
  const GpsLocTol._(this.value);
}

/// UTC time that the change was saved.  This is important in WP to determine if this change is newest and thus used or older and discarded.
/// Or It might be UTC time that the change was read from a sensor.
/// Time must always be reported in UTC
class DateTimeMod extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  // Validates the DateTime
  factory DateTimeMod(DateTime input) {
    return DateTimeMod._(validateDateTime(input));
  }
  // Validates the UNIX datetime and creates the value object.
  // Use the int generated from .millisecondsSinceEpoch as an input, if you are creating an object.
  // This is helpful in creating datetimeMod object from the values that we have in our database.
  factory DateTimeMod.fromInt(int input) {
    return DateTimeMod._(validateDateTimeInt(input));
  }
  // Creates a DateTimeMod class from currentDateTime.
  factory DateTimeMod.now() {
    final int input = DateTime.now().millisecondsSinceEpoch;
    return DateTimeMod._(validateDateTimeInt(input));
  }
  factory DateTimeMod.defaultDate() {
    const int input =
        1577898000; //Corresponds to Jan 1, 2020 which is the default date.
    return DateTimeMod._(validateDateTimeInt(input));
  }
  factory DateTimeMod.subtract(Duration duration) {
    final int input = DateTime.now().subtract(duration).millisecondsSinceEpoch;
    return DateTimeMod._(validateDateTimeInt(input));
  }

  DateTime toDateTime() {
    //Value stored in database is actually stored as seconds, so multiply by 1000. 
    return DateTime.fromMillisecondsSinceEpoch(
        value.getOrElse(() => throw "Invalid DateTimeValue") * 1000);
  }

  const DateTimeMod._(this.value);
}

class ImgPath extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ImgPath(String input) {
    return ImgPath._(validateStringNotEmpty(input));
  }
  const ImgPath._(this.value);
}

/// 0 to 255 .
class Byte extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Byte(int input) {
    return Byte._(validateIntRange(input: input, min: 0, max: 255));
  }
  const Byte._(this.value);
}

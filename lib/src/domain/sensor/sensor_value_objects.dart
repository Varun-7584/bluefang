import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

/// Tag Serial number of the DataTrac SVT hubo.
///
/// 4 Bytes Traditional Stemco "TracBAT" Serial Number

class DtID extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  /// Creates a DtID from the given integer.
  ///
  /// Accepts values from 0 to 9999999999.
  factory DtID(int input) {
    return DtID._(validateIntRange(input: input, min: 0, max: 9999999999));
  }
  factory DtID.fromBinary(String binary) {
    final int processedInput = int.parse(binary, radix: 2);
    return DtID._(
        validateIntRange(input: processedInput, min: 0, max: 9999999999));
  }
  factory DtID.fromHex(String hex) {
    final int processedInput = int.parse(hex, radix: 16);
    return DtID._(
        validateIntRange(input: processedInput, min: 0, max: 9999999999));
  }

  const DtID._(this.value);
}

class DtIDHumanReadable extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  /// Human-readable form of [DtID].
  ///
  /// Expects the input provided to be the decimal form of the DtID to be put in human-readable form.
  factory DtIDHumanReadable(int input) {
    final Either<ValueFailure<int>, int> tempValue =
        validateIntRange(input: input, min: 0, max: 9999999999);
    final int yearValue = (tempValue.getOrElse(() => 0) >> (6 + 16)) & 0x0f;
    final int weekValue = (tempValue.getOrElse(() => 0) >> (6 + 16 + 4)) & 0x3f;
    final int seqAndTypeValue = tempValue.getOrElse(() => 0) & 0x3fffff;
    final String finalValue =
        "${seqAndTypeValue.toString().padLeft(7, "0")}/${weekValue.toString().padLeft(2, "0")}_$yearValue";
    return DtIDHumanReadable._(validateStringNotEmpty(finalValue));
  }
  const DtIDHumanReadable._(this.value);
}

/// This is the revolutions a tire takes to travel one Mile (Km). So RPM or PRK Rev/Distance.
///
/// Range [0-1999]
class DtRPD extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DtRPD(int input) {
    return DtRPD._(validateIntRange(input: input, min: 0, max: 1999));
  }
  const DtRPD._(this.value);
}

class DtBtRaw extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory DtBtRaw(String input) {
    return DtBtRaw._(validateStringNotEmpty(input));
  }
  const DtBtRaw._(this.value);
}

/// Unit of Measure.
///
/// Normally Miles or Km. Also added Unknown and Revs. Range [0-3]
class DtUOM extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DtUOM(int input) {
    return DtUOM._(validateIntRange(input: input, min: 0, max: 3));
  }
  const DtUOM._(this.value);
}

/// Low Battery Detected.
///
/// Range [0-1]
class DtLoBat extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DtLoBat(int input) {
    return DtLoBat._(validateIntRange(input: input, min: 0, max: 1));
  }
  const DtLoBat._(this.value);
}

/// Reprogrammable or not.
///
/// Range[0-1] representing a boolean.
class DtReprogrammable extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DtReprogrammable(int input) {
    return DtReprogrammable._(validateIntRange(input: input, min: 0, max: 1));
  }
  const DtReprogrammable._(this.value);
}

/// Whether the DataTrac is locked or not.
///
/// When DataTrac has gone over 1024 revolutions it is locked for further programming.
/// Range [0-1] representing a boolean.
class DtLocked extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtLocked(int input) {
    return DtLocked._(validateIntRange(input: input, min: 0, max: 1));
  }
  const DtLocked._(this.value);
}

class DtSecure extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtSecure(int input) {
    return DtSecure._(validateIntRange(input: input, min: 0, max: 1));
  }
  const DtSecure._(this.value);
}

class DtModCount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtModCount(int input) {
    return DtModCount._(validateIntRange(input: input, min: 0, max: 255));
  }
  const DtModCount._(this.value);
}

class DtFirmVerMsp extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtFirmVerMsp(int input) {
    return DtFirmVerMsp._(validateIntRange(input: input, min: 0, max: 15));
  }
  const DtFirmVerMsp._(this.value);
}

class DtFirmVerBT5Ap extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtFirmVerBT5Ap(int input) {
    return DtFirmVerBT5Ap._(validateIntRange(input: input, min: 0, max: 15));
  }
  const DtFirmVerBT5Ap._(this.value);
}

class DtFirmVerBT5Sdk extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtFirmVerBT5Sdk(int input) {
    return DtFirmVerBT5Sdk._(validateIntRange(input: input, min: 0, max: 7));
  }
  const DtFirmVerBT5Sdk._(this.value);
}

/// This the life distance reported by the DT SVT.
/// Range [0-16777215]
class DtLifeMiles extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;
  factory DtLifeMiles(int input) {
    return DtLifeMiles._(validateIntRange(input: input, min: 0, max: 16777215)
        .flatMap((value) => validateInt(input: value)));
  }
  const DtLifeMiles._(this.value);
}

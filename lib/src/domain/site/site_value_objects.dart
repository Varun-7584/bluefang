import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/core/value_validators.dart';
import 'package:bluefang/src/domain/site/site_value_validators.dart';

import 'package:dartz/dartz.dart';

class SiteID extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  static const int maxValue = 255;

  factory SiteID(int siteID) {
    return SiteID._(validateIntRange(input: siteID, min: 0, max: 255)
        .flatMap(validateSite));
  }
  const SiteID._(this.value);
}

class SiteName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SiteName(String input) {
    return SiteName._(validateStringNotEmpty(input));
  }
  const SiteName._(this.value);
}

// class List3<T> extends ValueObject<KtList<T>> {
//   @override
//   final Either<ValueFailure<KtList<T>>, KtList<T>> value;

//   static const maxLength = 3;

//   factory List3(KtList<T> input) {
//     assert(input != null);
//     return List3._(
//       validateMaxListLength(input, maxLength),
//     );
//   }

//   const List3._(this.value);

//   int get length {
//     return value.getOrElse(() => emptyList()).size;
//   }

//   bool get isFull {
//     return length == maxLength;
//   }
// }

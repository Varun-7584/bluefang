import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/utils/extract_changed_values_from_objects.dart';

/// This is the base class for all the classes that want to track the modifications.
/// We have another class extract_changed_values_from_objects in utils folder which takes in this base class and extract the changes between two objects of MTBaseClass.
/// mtTracked varaible stores a list of object parameters that we want to track as keys. These keys must be the same as the keys in toJson() method.
mixin MTMixin {
  Map<String, Object?> toJson();
  List<Object> get mtTracked;

  Map<Object, List<Object?>> changedValues(
      {required MTMixin newValue, String? delimiter}) {
    final ExtractChangedValuesFromObjects cv = ExtractChangedValuesFromObjects(
        previousValue: this, currValue: newValue);
    return cv.changedValues(delimiter: delimiter);
  }

  Map<Object, List<Object?>> changedValuesContainingKeys(
      {required MTMixin newClass,
      required List<Object> includeKeys,
      String? delimiter}) {
    final ExtractChangedValuesFromObjects cv = ExtractChangedValuesFromObjects(
        previousValue: this, currValue: newClass);
    return cv.changedValuesContainingKeys(
        includeKeys: includeKeys, delimiter: delimiter);
  }

  Map<Object, List<Object?>> changedValuesExcludingKeys(
      {required MTMixin newClass,
      required List<Object> excludingKeys,
      String? delimiter}) {
    final ExtractChangedValuesFromObjects cv = ExtractChangedValuesFromObjects(
        previousValue: this, currValue: newClass);
    return cv.changedValuesExcludingKeys(
        excludeKeys: excludingKeys, delimiter: delimiter);
  }

  MTChangedValues mtChangedValues(
      {required MTMixin newValue, String? delimiter}) {
    final ExtractChangedValuesFromObjects cv = ExtractChangedValuesFromObjects(
        previousValue: this, currValue: newValue);
    final result = cv.changedValues(delimiter: delimiter);
    final mtchangedValue = MTChangedValues(result);
    return mtchangedValue;
  }
}

import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:json_diff/json_diff.dart';

/// This class helps extract the changed values from objects of MTBase class.
/// Mainly from the MTBaseClass. MT here means modifications tracked.
class ExtractChangedValuesFromObjects {
  MTMixin previousValue;
  MTMixin currValue;
  final List<Object> allKeys;

  factory ExtractChangedValuesFromObjects(
      {required MTMixin previousValue, required MTMixin currValue}) {
    final Set<Object> setOfKeys =
        Set.from(previousValue.mtTracked + currValue.mtTracked);
    final List<Object> includeKeys = setOfKeys.toList();

    return ExtractChangedValuesFromObjects._(
        previousValue: previousValue,
        currValue: currValue,
        allKeys: includeKeys);
  }

  ExtractChangedValuesFromObjects._(
      {required this.previousValue,
      required this.currValue,
      required this.allKeys});

  Map<Object, List<Object?>> _removePrefix(
      Map<Object, List<Object?>> json, String delimiter) {
    final Map<String, List<Object?>> newJson = {};
    json.forEach((key, value) {
      final String strkey = key.toString();
      final int index = strkey.indexOf(delimiter);
      if (index == -1) {
        throw FormatException("Invalid Delimiter for Key $key. ",
            "removePrefixFromJsonKeys function");
      }
      final String newKey = strkey.replaceRange(
        0,
        index + 1,
        '',
      );
      final Map<String, List<Object?>> newEntry = {newKey: value};
      newJson.addAll(newEntry);
    });

    return newJson;
  }

  Map<Object, List<Object?>> _returnChangedValues() {
    final differ =
        JsonDiffer.fromJson(previousValue.toJson(), currValue.toJson());
    final DiffNode diff = differ.diff();
    final Map<Object, List<Object?>> changedValues = diff.changed;
    return changedValues;
  }

  Map<Object, Object?> changedValuesMap({bool? returnRight}) {
    final differ =
        JsonDiffer.fromJson(previousValue.toJson(), currValue.toJson());
    final DiffNode diff = differ.diff();
    final Map<Object, List<Object?>> changedValues = diff.changed;
    final Map<Object, Object?> rightMap = {};
    final Map<Object, Object?> leftMap = {};
    final bool returnRightValue = returnRight ?? true;
    changedValues.forEach((key, value) {
      leftMap[key] = value[0];
      rightMap[key] = value[1];
    });
    if (returnRightValue) {
      return rightMap;
    } else {
      return leftMap;
    }
  }

  List<Object> _returnUniqueKeys(List<Object> keys) {
    final Set<Object> setOfKeys = Set.from(keys);
    final List<Object> uniqueKeys = setOfKeys.toList();
    return uniqueKeys;
  }

  Map<Object, List<Object?>> _includeKeys(
      Map<Object, List<Object?>> changedValues, List<Object> keys) {
    final Map<Object, List<Object?>> jsonIncludingKeys = {};
    final List<Object> includeKeys = _returnUniqueKeys(keys);
    for (final Object key in includeKeys) {
      if (changedValues.containsKey(key)) {
        jsonIncludingKeys[key] = changedValues[key]!;
      }
    }
    return jsonIncludingKeys;
  }

  /// Returns the changed values containing keys
  Map<Object, List<Object?>> changedValues({String? delimiter}) {
    final Map<Object, List<Object?>> changedValues =
        changedValuesContainingKeys(includeKeys: allKeys, delimiter: delimiter);

    return changedValues;
  }

  Map<Object, List<Object?>> changedValuesContainingKeys(
      {required List<Object> includeKeys, String? delimiter}) {
    final Map<Object, List<Object?>> changedValues = _returnChangedValues();
    if (delimiter != null) {
      return _removePrefix(_includeKeys(changedValues, includeKeys), delimiter);
    }
    return _includeKeys(changedValues, includeKeys);
  }

  Map<Object, List<Object?>> changedValuesExcludingKeys(
      {required List<Object> excludeKeys, String? delimiter}) {
    final Map<Object, List<Object?>> changedValues = _returnChangedValues();

    for (final Object key in excludeKeys) {
      if (changedValues.containsKey(key)) {
        changedValues.remove(key);
      }
    }
    if (delimiter != null) {
      return _removePrefix(changedValues, delimiter);
    }
    return changedValues;
  }
}

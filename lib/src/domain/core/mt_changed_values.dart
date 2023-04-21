import 'package:bluefang/src/infrastructure/core/helpermethods/value_transformers.dart';

class MTChangedParameter {
  String parameter; //dtSecure
  String previousValue; //0
  String currentValue; //1

  factory MTChangedParameter(MapEntry<Object, List<Object?>> element) {
    return MTChangedParameter._(
      parameter: element.key.toString(),
      previousValue: element.value[0].toString(),
      currentValue: element.value[1].toString(),
    );
  }

  MTChangedParameter._(
      {required this.parameter,
      required this.currentValue,
      required this.previousValue});
  @override
  String toString() {
    return "parameter: $parameter previousValue: $previousValue currentValue: $currentValue";
  }
}

class MTChangedValues {
  List<MTChangedParameter> changedParameter;
  Map<Object, Object?> leftMap;
  Map<Object, Object?> rightMap;

  factory MTChangedValues(Map<Object, List<Object?>> changedValues) {
    final entries = changedValues.entries;
    final List<MTChangedParameter> mtparameterMap = [];
    for (final MapEntry<Object, List<Object?>> element in entries) {
      final MTChangedParameter mtChangedParameter = MTChangedParameter(element);
      mtparameterMap.add(mtChangedParameter);
    }

    final Map<Object, Object?> rightMap =
        changedValuesMap(changedValues: changedValues);
    final Map<Object, Object?> leftMap =
        changedValuesMap(changedValues: changedValues, returnRight: false);

    return MTChangedValues._(mtparameterMap, leftMap, rightMap);
  }

  MTChangedValues._(this.changedParameter, this.leftMap, this.rightMap);
  @override
  String toString() {
    return "chaparameter: $changedParameter leftMap: $leftMap rightMap: $rightMap";
  }

  factory MTChangedValues.empty() {
    return MTChangedValues({});
  }
}

Map<Object, Object?> changedValuesMap(
    {required Map<Object, List<Object?>> changedValues, bool? returnRight}) {
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

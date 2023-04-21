String removeSpaceCharacterFromString(String input) {
  return input.replaceAll(RegExp(r"\s+"), "");
}

String removeSpecialCharacters(String input) {
  return input.replaceAll(RegExp(r'(?:_|[^\w\s])+'), '');
}

/// Removes the prefix for JSON keys if needed.
/// for JSON keys Our entities have prefix like "veh_siteID" and "sensor_siteID" etc
/// But sometimes we just want the parameter name like "siteID".
/// This method helps remove the prefix like veh_ or sensor_. "_" is used as delimiter for our entities
Map<String, dynamic> removePrefixForJsonKeys(
  Map<String, dynamic> json,
  String delimiter,
) {
  final Map<String, dynamic> newJson = {};

  json.forEach((key, value) {
    final int index = key.indexOf(delimiter);

    if (index == -1) {
      throw FormatException("Invalid Delimiter for Key $key. ",
          "removePrefixFromJsonKeys function");
    }

    final String newKey = key.replaceRange(
      0,
      index + 1,
      '',
    );
    final Map<String, dynamic> newEntry = {newKey: value};
    newJson.addAll(newEntry);
  });
  return newJson;
}

Map<Object, List<Object?>> removePrefixForChangedValues(
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

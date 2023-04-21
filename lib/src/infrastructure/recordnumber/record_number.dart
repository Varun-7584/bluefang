import 'package:bluefang/src/domain/logging/i_record_number.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class RecordNumber implements IRecordNumber {
  static const String _recordKey = "record_number";
  final SharedPreferences _sharedPreferences;
  RecordNumber(this._sharedPreferences);

  @override
  int createNewRecordId() {
    final bool containsKey = _sharedPreferences.containsKey(_recordKey);
    if (containsKey) {
      final int? currentKey = _sharedPreferences.getInt(_recordKey);
      if (currentKey == null) {
        throw "Error getting value for $_recordKey";
      }
      final newKey = currentKey + 1;
      _sharedPreferences.setInt(_recordKey, newKey);

      return newKey;
    }
    // This else should only run once in the life-cycle of the application.
    else {
      _sharedPreferences.setInt(_recordKey, 0);
      final int? result = _sharedPreferences.getInt(_recordKey);
      if (result == null) {
        throw "Error getting value for $_recordKey";
      }
      return result;
    }
  }

  @override
  int getCurrentRecordId() {
    // TODO: implement getCurrentRecordId
    throw UnimplementedError();
  }

  @override
  void reset() {
    _sharedPreferences.setInt(_recordKey, 0);
  }
}

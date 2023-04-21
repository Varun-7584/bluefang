import 'dart:async';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchList {
  String key = "";
  bool startWatching = false;
  final StreamController<Object> _scribeStreamController =
      StreamController<Object>.broadcast();

  static WatchList? _instance;

  WatchList._internal();

  factory WatchList() {
    _instance ??= WatchList._internal();

    return _instance!;
  }

  // ignore: use_setters_to_change_properties
  void watchValue(String key) {
    this.key = key;
    startWatching = true;
  }

  void valueChanged(Map<String, Object?> changedValueMap) {
    assert(key.isNotEmpty);
    final bool isDtIdPresent = changedValueMap.containsKey("dtId");
    if (isDtIdPresent) {
      if (changedValueMap["dtId"].toString() == key) {
        _scribeStreamController.add(true);
      }
    }
  }

  void dtItChanged(DtID newDtId) {
    assert(key.isNotEmpty);
    if (newDtId.getOrCrash().toString() == key) {
      _scribeStreamController.add(true);
    }
  }

  Stream<Object> getScribeStream() {
    return _scribeStreamController.stream;
  }

  Stream<Object> getBluetoothBeaconsStream() {
    return _scribeStreamController.stream;
  }

  void dispose() {
    startWatching = false;
    key = "";
  }
}

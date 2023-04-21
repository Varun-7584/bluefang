import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_service.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';

@prod
@dev
@Environment(EnvironmentManager.demo)
@LazySingleton(as: IBluetoothService)
class BluetoothService implements IBluetoothService {
  final FlutterBluePlus _flutterBluePlus;
  BluetoothService(this._flutterBluePlus);
  @override
  Stream<List<ScanResult>> returnScanResults() {
    return _flutterBluePlus.scanResults;
  }

  @override
  Future<dynamic> startScan({Duration? timeout}) async {
    final bool isBluetoohAvailable = await _flutterBluePlus.isAvailable;
    final bool isOn = await _flutterBluePlus.isOn;
    if (isBluetoohAvailable && isOn) {
      return _flutterBluePlus.startScan(timeout: timeout);
    } else {
      // assert(isBluetoohAvailable);
      // assert(isOn);
    }
  }

  @override
  Future<dynamic> stopScan() {
    return _flutterBluePlus.stopScan();
  }

  @override
  Future<bool> get isOn => _flutterBluePlus.isOn;
  @override
  Future<bool> get isAvailable => _flutterBluePlus.isAvailable;
  @override
  Stream<bool> get isScanning => _flutterBluePlus.isScanning;
}

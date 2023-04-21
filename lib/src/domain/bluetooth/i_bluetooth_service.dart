abstract class IBluetoothService {
  Future<dynamic> startScan({Duration? timeout});
  Future<dynamic> stopScan();
  Stream<List<dynamic>> returnScanResults();
  Future<bool> get isOn;
  Future<bool> get isAvailable;
  Stream<bool> get isScanning;
}

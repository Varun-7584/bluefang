import 'package:freezed_annotation/freezed_annotation.dart';

part 'bf_advertisement_data.freezed.dart';

@freezed
class BFAdvertisementData with _$BFAdvertisementData {
  const BFAdvertisementData._();

  const factory BFAdvertisementData({
    required String localName,
    int? txPowerLevel,
    required bool connectable,
    required Map<int, List<int>> manufacturerData,
    required Map<String, List<int>> serviceData,
    required List<String> serviceUuids,
  }) = _BFAdvertisementData;
}

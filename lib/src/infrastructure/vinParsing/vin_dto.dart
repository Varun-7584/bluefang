// ignore_for_file: prefer_initializing_formals

import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';

class VinDTO {
  int? makeNo;
  int vehType = 0;

  /// Creates a new VinDTO.
  /// 
  /// [vehType] defaults to 0 (undefined). If it isn't found in the vehicleType map, an ArgumentError is thrown. 
	VinDTO({required int makeNo, required int vehType}){
    if (ReferenceTableDataEN.vehicleType[vehType] == null){
      throw ArgumentError.value(vehType, "vehType", "Vehicle type not recognized; defaulting to 0: ");
    }
    this.vehType = vehType;
    this.makeNo = makeNo;
    
  }

}

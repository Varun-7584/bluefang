class SBRealTimeValues {
  String hexValue;
  int motionBit; // Real time data. Not stored in SQLlite db
  bool dirValid; // Real time data. Not stored in SQLlite db
  int rotationalAngle;
  int rotationalFrequency;
  int directionOfRotation;
  int signalStrength;

  SBRealTimeValues._({
    required this.hexValue,
    required this.motionBit, // Real time data. Not stored in SQLlite db
    required this.dirValid, // Real time data. Not stored in SQLlite db
    required this.rotationalAngle,
    required this.rotationalFrequency,
    required this.directionOfRotation,
    required this.signalStrength,
  });

  factory SBRealTimeValues.incoming(Map<String, Object> json) {
    return SBRealTimeValues._(
      hexValue: json["hexValue"].toString(),
      motionBit: int.parse(json["motionBit"].toString()),
      dirValid: int.parse(json["dirValid"].toString()) == 1 && true,
      rotationalFrequency: int.parse(json["rotationalFrequency"].toString()),
      rotationalAngle: int.parse(json["rotationalAngle"].toString()),
      directionOfRotation: int.parse(json["directionOfRotation"].toString()),
      signalStrength: int.parse(json["signalStrength"].toString()),
    );
  }

  factory SBRealTimeValues.existing() {
    return SBRealTimeValues._(
      hexValue: "",
      motionBit: 0,
      dirValid: false,
      rotationalAngle: 0,
      directionOfRotation: 0,
      rotationalFrequency: 0,
      signalStrength: 0,
    );
  }

  Map<String, Object?> toJson() {
    return {
      "hexValue": hexValue,
      "motionBit": motionBit,
      "dirValid": dirValid,
      "rotationalAngle": rotationalAngle,
      "rotationalFrequency": rotationalFrequency,
      "directionOfRotation": directionOfRotation,
      "signalStrength": signalStrength,
    };
  }
}

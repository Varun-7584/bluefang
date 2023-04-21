class ReferenceTableDataEN {
  static const modelYear = {
    "S": 1995,
    "T": 1996,
    "V": 1997,
    "W": 1998,
    "X": 1999,
    "Y": 2000,
    "1": 2001,
    "2": 2002,
    "3": 2003,
    "4": 2004,
    "5": 2005,
    "6": 2006,
    "7": 2007,
    "8": 2008,
    "9": 2009,
    "A": 2010,
    "B": 2011,
    "C": 2012,
    "D": 2013,
    "E": 2014,
    "F": 2015,
    "G": 2016,
    "H": 2017,
    "J": 2018,
    "K": 2019,
    "L": 2020,
    "M": 2021,
    "N": 2022,
    "P": 2023,
    "R": 2024,
  };

  /// Maps the vehicle type number to the name. 
  /// 
  /// We only support a subset of the NHTSA vehicle types, so this is not a complete list. 
  /// It should contain the same items as vehTypeByName. 
  static const vehicleType = {
    0: "Undefined",
    2: "Automobile",
    3: "Truck",
    5: "Bus",
    6: "Trailer",
    7: "Multipurpose Passenger Vehicle (MPV)",
    10: "Incomplete Vehicle"
  };

  /// Maps the vehicle type name to the number. 
  /// 
  /// The VIN information from the NHTSA doesn't include the vehicle type number, just the name, so this map allows translating from the name to the number. 
  /// We only support a subset of the NHTSA vehicle types, so this is not a complete list. 
  /// It should contain the same items as vehicleType. 
  static const Map<String, int> vehTypeByName = {
    "Undefined" : 0,
    "Automobile" : 2,
    "Truck" : 3,
    "Bus" : 5,
    "Trailer" : 6,
    "Multipurpose Passenger Vehicle (MPV)" : 7,
    "Incomplete Vehicle" : 10
  };

  static const vehicleFuelType = {
    0: "Undefined",
    1: "Diesel",
    2: "Battery (Electric)",
    3: "None",
    4: "Gasoline",
    6: "(CNG)Compressed Natural Gas",
    7: "(LNG)Liquefied Natural Gas",
    8: "Hydrogen - Compressed",
    9: "(LPG)Liquefied Petroleum Gas (propane)",
    10: "(E85)Ethanol",
    11: "(E100)Neat Ethanol",
    13: "(M85)Methanol",
    14: "(M100)Neat Methanol",
    15: "(FFV)Flexible Fuel Vehicle",
    17: "Natural Gas",
    18: "Fuel Gas",
  };
  static const uomFuel = {
    0: "Undef",
    1: "Liters",
    2: "Gallons",
    3: "KWHr",
  };

  static const uomFluids = {
    0: "Undef",
    1: "Liters",
    2: "Gallons",
    3: "Quarts",
  };
  static const uomDistance = {
    0: "km",
    1: "mi",
    2: "revs",
  };
  static const oilType = {
    0: "Undefined",
    1: "Full Synthetic",
    2: "Full Synthetic High Mileage",
    3: "Synthetic Blend",
    4: "Synthetic Blend High Mileage",
    5: "Conventional",
    6: "Conventional High Mileage",
  };

  /// Doesn't change with language.
  /// 
  /// Ordered so that the most common choices are towards the top, then numerically/alphabetically descending
  static const oilVisc = {
    0: "Undefined",
    6: "5W-30",
    7: "5W-40",
    5: "5W-20",
    13: "15W-40",
    2: "0W-20",
    3: "0W-30",
    4: "0W-40",
    1: "0W-16",
    8: "5W-50",
    9: "10W-30",
    10: "10W-40",
    11: "10W-50",
    12: "10W-60",
    14: "15W-50",
    15: "15W-60",
    16: "20W-50",
    17: "20W-60",
    18: "SAE 20",
    19: "SAE 30",
    20: "SAE 40",
    21: "SAE 50",
  };

  static const coolantType = {
    0: "Undefined",
    1: "",
    2: "",
    3: "",
  };

  static const atfType = {
    0: "Undefined",
    1: "",
    2: "",
    3: "",
  };

  static const defType = {
    0: "Undefined",
    1: "",
    2: "",
    3: "",
  };

  static const double maxFluidQuantity = 999.9;

  static const bodyTypeBus = {
    0: "Undefined",
    1: "Commuter Coach",
    2: "Double Decker Coach",
    3: "Tourist Coach",
    4: "Urban Bus",
    5: "Transist Bus",
    6: "Entertainer Coach",
    7: "Motor Home",
    10: "Trolley",
    11: "Articulated",
    12: "Shuttle Bus",
    13: "School Bus",
  };

  static const bodyTypeAuto = {
    0: "Undefined",
    1: "Convertible",
    2: "MiniVan",
    3: "Coupe",
    5: "Hatchback",
    7: "SUV",
    9: "Van",
    13: "Sedan",
    60: "Pickup Truck",
    95: "Van Cargo",
  };

  static const bodyTypeTrailer = {
    4: "Dump",
    6: "Flat Bed",
    11: "Low Boy (Drop Deck)",
    15: "Tanker",
    19: "Logging",
    22: "Dump - Side",
    45: "Dolly",
    91: "Pole",
    95: "Auto Hauler",
    103: "Bulk Commodity",
    109: "Container Chassis",
    143: "Refrigerated",
    174: "Dry Bulk",
    186: "Dry Van",
    255: "Undefined",
  };

  static const dateConvert = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec"
  };
}


enum VehicleListSortOrder { number, distance, time, type, none }

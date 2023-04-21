class ReferenceTableDataES {

  static const vehicleType = {
    0: "S_Undefined",
    2: "Automóvil",
    3: "Tractomula",
    5: "Bus",
    6: "Remolque",
    7: "Vehículo de pasajeros multiples(MPV)",
    10: "Vehículo Imcompleto"
  };

  static const vehicleFuelType = {
    0: "S_Undefined",
    1: "Diesel",
    2: "Eléctrico",
    3: "Ninguno",
    4: "Gasolina",
    6: "(GNC) Gas Natural Comprimido",
    7: "(GNL)Gas Natural Líquido",
    8: "Hidrógeno Comprimido",
    9: "(GLP) Gas Licuado de Petróleo (Propano)",
    10: "(E85)Etanol",
    11: "(E100)Etanol",
    13: "(M85)Metanol",
    14: "(M100)Metanol",
    15: "(FFV)Vehículo de Combustible Flexible)",
    17: "Gas Natural",
    18: "Combustible",
  };
  static const uomFuel = {
    0: "S_Undef",
    1: "Litros",
    2: "Galones",
    3: "KWHr",
  };

  static const uomFluids = {
    0: "S_Undef",
    1: "Litros",
    2: "Galones",
    3: "Cuartos",
  };
  static const uomDistance = {
    0: "km",
    1: "mi",
    2: "revs",
  };
  static const oilType = {
    0: "S_Undefined",
    1: "Sintético",
    2: "Sintético Alto de Kilometraje",
    3: "Semisintético",
    4: "Semisintético de Alto Kilometraje",
    5: "Convencional",
    6: "Convencional de Alto Kilometraje",
  };

  static const coolantType = {
    0: "S_Undefined",
    1: "Tipo 1",
    2: "Tipo 2",
    3: "Tipo 3",
  };

  static const atfType = {
    0: "S_Undefined",
    1: "S_1",
    2: "S_2",
    3: "S_3",
  };

  static const defType = {
    0: "S_Undefined",
    1: "S_1",
    2: "S_2",
    3: "S_3",
  };

  static const bodyTypeBus = {
    0: "S_Undefined",
    1: "S_Commuter Coach",
    2: "Autobus de dos pisos",
    3: "S_Tourist Coach",
    4: "Autobus Urbano",
    5: "Autobus de Tránsito",
    6: "S_Entertainer Coach",
    7: "CarroCasa o autocaravana",
    10: "Tranvia*",
    11: "Autobus Articulado",
    12: "S_Shuttle Bus",
    13: "Autobus Escolar",
  };

  static const bodyTypeAuto = {
    0: "S_Undefined",
    1: "Convertible",
    2: "Minivan",
    3: "Carro Coupe",
    5: "Hatchback?",
    7: "SUV",
    9: "Van",
    13: "Sedan",
    60: "Camioneta Pickup",
    95: "Van de Carga",
  };

  static const bodyTypeTrailer = {
    4: "S_Dump",
    6: "Cama Plana",
    11: "Low Boy",
    15: "Camión Cisterna",
    19: "S_Logging",
    22: "S_Dump - Side",
    45: "S_Dolly",
    91: "S_Pole",
    95: "Transportador de Autos",
    103: "S_Bulk Commodity",
    109: "S_Container Chassis",
    143: "Refrigerados",
    174: "S_Dry Bulk",
    186: "Dry Van",
    255: "Indefinido",
  };

  static const dateConvert = {
    1: "Ene",
    2: "Feb",
    3: "Mar",
    4: "Abr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Ago",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dic"
  };
}

// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:flutter/material.dart';

/// Stores methods that are used in several places in the app but don't fit into the other categories for such methods.
class HelperMethods {
  static Future<String> getImageForVehicle(
      {required ImgPath customJpg,
      required ImgPath stockJpg,
      int vehType = 0,
      required AssetBundle bundle}) async {
    String imagePath = "";

    try {
      /// Try to get the custom image first (entered by user)
      try {
        /// TODO: This is not how the custom images will acutally be stored. Need to ask Mr. Dan.
        //imagePath = "assets/images/VehicleCustomImages/${customJpg.getOrCrash()}";
        // await bundle.load(imagePath);
      } catch (e) {
        log("Error loading custom image for vehicle. ",
            name: "vehicle_expandable_list", error: e);
        imagePath = "";
      }

      /// The generic one is checked first because it is a faster check to run.
      try {
        if (stockJpg.getValueOrErrorString().toString() == "0") {
          imagePath = "assets/images/VehicleStockImages/$vehType.JPG";

          /// Test the image path and see if it works before declaring success
          await bundle.load(imagePath);
        }
      } catch (e) {
        log("Error loading generic image for vehicle. ",
            name: "vehicle_details_screen", error: e);
        imagePath = "";
      }
      try {
        imagePath =
            "assets/images/VehicleStockImages/${stockJpg.getOrCrash()}.JPG";
        await bundle.load(imagePath);
      } catch (e) {
        log("Error loading stock image for vehicle. ",
            name: "vehicle_details_screen", error: e);
        log("Vehicle type: $vehType");
        imagePath = "assets/images/VehicleStockImages/$vehType.JPG";
        await bundle.load(imagePath);
      }

      /// Triggered if there is an error in either of the nested catch blocks above.
      /// Usually, this means there was an error loading the generic image for the vehicle (because the stock image error then tries to load the generic image).
    } catch (e) {
      log("Error loading generic image for vehicle.",
          name: "vehicle_details_screen", error: e);
      imagePath = "assets/images/VehicleStockImages/0.JPG";
    }
    return imagePath;
  }

  /// Converts from the fuel capacity in liters to display value (either gallons or kwhr) and vice versa.
  ///
  /// Accepts the value to convert and a boolean determining whether or not the value is going from liters to another measurement.
  /// If fromLiters is false, converts the fuel capacity from the current unit of measurement to liters.
  ///
  /// Kwhr are left alone because they don't convert back and forth.
  static double fuelConversion(int fuelCapacity,
      {bool fromLiters = true, int currentUOM = 0}) {
    if (fromLiters) {
      if (ReferenceTableDataEN.uomFuel[currentUOM] == "Liters") {
        return fuelCapacity / 10;
      } else if (ReferenceTableDataEN.uomFuel[currentUOM] == "Gallons") {
        //Convert from liters to gallons
        return fuelCapacity * 0.26417200 / 10;
      } else if (ReferenceTableDataEN.uomFuel[currentUOM] == "KWHr") {
        //Just store as if liters. Units will be displayed correctly anyways.
        return fuelCapacity / 10;
      } else {
        //Return default because units were not defined
        return fuelCapacity / 10;
      }
    } else {
      if (ReferenceTableDataEN.uomFuel[currentUOM] == "Liters") {
        return fuelCapacity * 10;
      } else if (ReferenceTableDataEN.uomFuel[currentUOM] == "Gallons") {
        //Convert from gallons to liters
        return fuelCapacity * 3.785411784 * 10;
      } else if (ReferenceTableDataEN.uomFuel[currentUOM] == "KWHr") {
        //Convert from kwhr to liters
        return fuelCapacity * 10;
      } else {
        //Return default because units were not defined
        return fuelCapacity * 10;
      }
    }
  }
}

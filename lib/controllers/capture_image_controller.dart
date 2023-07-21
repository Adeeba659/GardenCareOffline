// import 'dart:js';

import 'package:flutter/material.dart';
import '../models/plant.dart';
import 'identification_controller.dart';
import 'dart:io';
import 'dart:typed_data';
import 'history_controller.dart';

class CaptureImageController {
  String getDiseaseStatus() {
    String diseaseStatus = _identificationController.getDiseaseStatus();
    return diseaseStatus;
  }

  final IdentificationController _identificationController;

  CaptureImageController(this._identificationController);

  Future<Plant?> processImage(File image) async {
    // Call the identification controller to identify the plant and get the result
    Plant? plant = await _identificationController.identifyPlant(image);

    // Perform any additional processing or validation as needed
    // ...

    return plant;
  }
}

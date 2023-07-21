import 'dart:io';
import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../controllers/plant_controller.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'history_controller.dart';
import 'package:get/get.dart';

class IdentificationController {
  String diseaseStatus = '';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<Plant?> identifyPlant(File file) async {
    file;

    //Plant? identifiedPlant;

    //Load the TFLite model

    String modelPath = 'assets/dl_model/model.tflite';
    await Tflite.loadModel(
        model: modelPath,
        labels: "assets/dl_model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );

    // Run the TFLite model on the provided image
    var recognitions = await Tflite.runModelOnImage(
      path: file!.path,
      numResults: 1, // Only retrieve the top result
    );

    //print(recognitions);

    // Parse the recognition result
    String plantName = recognitions != null && recognitions.isNotEmpty
        ? recognitions[0]['label']
        : '';

    List<String> plantSplit = plantName.split('___');
    String plantCName = plantSplit[0];
    diseaseStatus = plantSplit[1].replaceAll('_', ' ');

    // Get the list of plants
    List<Plant> plants = await PlantController.fetchPlants();

    // Find the matching plant based on commonName
    Plant? identifiedPlant = plants.firstWhere(
      (plant) => plant.commonName == plantCName.tr,

      orElse: () => Plant(
          commonName: 'No Plant detected',
          description: '',
          diseases: [''],
          scientificName: '',
          diseases_desc: [''],
          treatements: [''],
          plantImage: '',
          diseaseImage: ['']), // Return null if no element is found
    );

    HistoryController.addHistory(file, identifiedPlant, getDiseaseStatus());

    // Release the TFLite resources
    Tflite.close();

    return identifiedPlant;
  }

  String getDiseaseStatus() {
    return diseaseStatus;
  }
}

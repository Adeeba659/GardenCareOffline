import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:tflite/tflite.dart';
import '../models/plant.dart';
import '../controllers/plant_controller.dart';

class IdentificationController {
  Future<Plant?> identifyPlant(File image) async {
    // Load the TFLite model
    // String modelPath =
    //     'assets/dl_model/model.tflite'; // Replace with your model file path
    // await Tflite.loadModel(
    //   model: modelPath,
    // );

    // // Run the TFLite model on the provided image
    // var recognitions = await Tflite.runModelOnImage(
    //   path: image.path,
    //   numResults: 1, // Only retrieve the top result
    // );

    // // Parse the recognition result
    // String plantName = recognitions != null && recognitions.isNotEmpty
    //     ? recognitions[0]['label']
    //     : '';

    // // Get the plant details from your data source or API based on the plant name
    // //Plant identifiedPlant = getPlantDetails(plantName);
    // // Get the list of plants
    // List<Plant> plants = await PlantController.fetchPlants();

    // // Find the matching plant based on commonName
    // Plant? identifiedPlant = plants.firstWhere(
    //   (plant) => plant.commonName == plantName,
    //   //orElse: () => null,
    // );

    // // Release the TFLite resources
    // Tflite.close();

    Plant identifiedPlant = Plant(
        commonName: 'Tomato',
        description: 'hi',
        diseases: ['Late Blight'],
        scientificName: 'df',
        diseases_desc: ['fdv'],
        treatements: ['dg'],
        plantImage: 'znjd',
        diseaseImage: ['jdf']);

    return identifiedPlant;
  }

  // Plant getPlantDetails(String plantName) {
  //   // Fetch the plant details from your data source or API based on the plant name
  //   // Replace this with your actual implementation
  //   // You can retrieve additional information like disease from your data source
  //   String commonName = plantName;
  //   //String disease = 'Powdery Mildew';

  //   // Create and return the Plant object with the identified details
  //   return Plant(
  //     commonName: commonName,
  //     disease: disease,
  //   );
  // }
}

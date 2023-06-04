import 'dart:io';
import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../../view/screens/history.dart';

import 'dart:typed_data';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import '../models/saved_plant_model.dart';
import '../data/saved_plants.dart';

class HistoryController {
  static void addHistory(File image, Plant plantDetail) async {
    // Create a new history entry with the provided image and plant detail
    // history(image: image, plantDetail: plantDetail);

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String imagesDirectoryPath = path.join(appDirectory.path, 'images');
    await Directory(imagesDirectoryPath).create(recursive: true);

    final String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final String imagePath = path.join(imagesDirectoryPath, '$imageName.jpg');

    await image.copy(imagePath);
    //DUMMY DISEASE
    String targetDisease = 'Late Blight';
    int disease_index =
        plantDetail.diseases.indexWhere((disease) => disease == targetDisease);
    // SavedPlantModel savedPlant = SavedPlantModel(
    //   imagePath: imagePath,
    //   diseaseIndex: disease_index,
    //   plant_detail: plantDetail,
    // );

    SavedPlants savedPlants = SavedPlants();
    savedPlants.add(imagePath, plantDetail, disease_index);
  }
}

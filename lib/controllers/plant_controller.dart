import 'dart:async';
import '../../models/plant.dart';
import '../data/data.dart';

class PlantController {
  static Future<List<Plant>> fetchPlants() async {
    // Simulating an API call or data retrieval process
    //await Future.delayed(Duration(seconds: 2));

    // Placeholder data for demonstration

    List<Plant> plants = plantDataList;

    return plants;
  }
}

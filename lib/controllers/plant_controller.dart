import 'dart:async';
import '../../models/plant.dart';
import '../data/data.dart';

class PlantController {
  static Future<List<Plant>> fetchPlants() async {
    // Placeholder data for demonstration

    List<Plant> plants = plantDataList;

    return plants;
  }
}

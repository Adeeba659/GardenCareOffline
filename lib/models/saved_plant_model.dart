import 'plant.dart';

class SavedPlantModel {
  final String imagePath;
  final int diseaseIndex;
  final Plant plant_detail;

  const SavedPlantModel({
    required this.imagePath,
    required this.diseaseIndex,
    required this.plant_detail,
  });

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'diseaseIndex': diseaseIndex,
      'plantDetail': plant_detail.toJson(),
    };
  }

  factory SavedPlantModel.fromJson(Map<String, dynamic> json) {
    return SavedPlantModel(
      imagePath: json['imagePath'],
      diseaseIndex: json['diseaseIndex'],
      plant_detail: Plant.fromJson(json['plantDetail']),
    );
  }
}

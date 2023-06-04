import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../data/data.dart';
import '../../models/plant.dart';
import '../widgets/information.dart';
import 'bottomNavBar.dart';

class PlantDetailWidget {
  final Plant plant_detail;
  PlantDetailWidget(this.plant_detail);

  late Widget scientificName = scientific_name();
  late Widget plantDescription = plant_description();
  late Widget diseaseHeading = diseases_heading();
  late List Diseases = diseases();

  List<Widget> widget_list = [];
  // late List<Widget> widget_list = [
  //   scientificName,
  //   plantDescription,
  //   diseaseHeading,
  //   Diseases,
  // ];

  void initializeWidgetList() {
    widget_list = [
      scientificName,
      plantDescription,
      diseaseHeading,
      ...diseases(),
    ];
  }

  plant_name() {
    return Text(
      plant_detail.commonName,
      style: TextStyle(
          fontSize: 20,
          color: primaryColor,
          fontFamily: fontName,
          fontWeight: FontWeight.bold),
    );
  }

  scientific_name() {
    return Column(
      children: [
        Information('Scientific Name', plant_detail.scientificName),
        SizedBox(height: 50),
        Image(
          image: AssetImage(plant_detail.plantImage),
          height: 290,
        ),
      ],
    );

    // Column(
    //   //mainAxisAlignment: MainAxisAlignment.start,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   //crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Text(
    //       'Scientific Name  ',
    //       style: TextStyle(
    //           fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold),
    //     ),
    //     Text(
    //       plant_detail.scientificName,
    //       style: TextStyle(
    //         fontSize: 14,
    //         color: primaryColor,
    //       ),
    //     ),
    //   ],
    // );
  }

  plant_description() {
    //Description
    return Information('Description ', plant_detail.description);
  }

  diseases_heading() {
    //Diseases

    return Column(
      children: [
        Center(child: Information('\nDiseases ', '')),
        SizedBox(height: 30),
        Image(
          image: AssetImage('assets/images/plants/disease.png'),
          height: 290,
        ),
      ],
    );
  }

  List<Widget> diseases() {
    List<Widget> diseaseWidgets = [];

    for (int index = 0; index < plant_detail.diseases.length; index++) {
      diseaseWidgets.add(
        Column(
          children: [
            Information(plant_detail.diseases[index], ''),
            SizedBox(height: 30),
            Image(
              image: AssetImage(plant_detail.diseaseImage[index]),
              height: 350,
            ),
          ],
        ),
      );

      diseaseWidgets.add(
        Information(
            'Diseases Description  ', plant_detail.diseases_desc[index]),
      );

      diseaseWidgets.add(
        Information('Treatments  ', plant_detail.treatements[index]),
      );
    }

    return diseaseWidgets;
  }
}

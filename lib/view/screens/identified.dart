import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:GardenCare/view/screens/disease_detected.dart';
import 'package:GardenCare/view/screens/no_disease.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../widgets/crousel.dart';
import '../../models/plant.dart';
import '../../data/data.dart';

class Identified extends StatelessWidget {
  final Uint8List? imageFile;

  Identified({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    Plant plant_detail = plantDataList[0];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Display'),
      //   backgroundColor: primaryColor,
      // ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Text(
                      'Plant Identified!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fontName,
                        fontWeight: FontWeight.normal,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Tomato',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    // Container(
                    //   // decoration: BoxDecoration(
                    //   //     border: Border.all(
                    //   //       color: primaryColor,
                    //   //     ),
                    //   //     borderRadius: BorderRadius.all(Radius.circular(20))),
                    //   margin: EdgeInsets.all(10),
                    //   padding: EdgeInsets.all(10),
                    //   height: 300,
                    //   width: 400,
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(20),
                    //     child: Image.memory(
                    //       imageFile,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 20,
                    ),

                    //Display Info

                    Crousel(plant_detail, 500.0, 'identified'),

                    //Detect Plant Disease Button
                    SizedBox(
                      height: 40,
                    ),

                    SizedBox(
                      height: 30, //height of button
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  // DiseaseDetected(imageFile: imageFile!),
                                  NoDisease(imageFile: imageFile!),
                            ),
                          );
                        },
                        //color: Colors.blue,
                        child: Text(
                          'Detect Disease',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: fontName,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // child: Image.memory(
              //   imageFile,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          BottomNavBar(0),
        ],
      ),
    );
  }
}

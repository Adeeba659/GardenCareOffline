import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../widgets/crousel.dart';
import '../../models/plant.dart';
import '../../data/data.dart';

class DiseaseDetected extends StatelessWidget {
  final Uint8List imageFile;

  DiseaseDetected({required this.imageFile});

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
                    SizedBox(height: 30),

                    Text(
                      'Plant Identified & \nDisease Detected!',
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

                    Crousel(plant_detail, 500.0, 'detected'),

                    //Detect Plant Disease Button
                    SizedBox(
                      height: 10,
                    ),

                    // SizedBox(
                    //   height: 30, //height of button
                    //   width: 250,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: primaryColor,
                    //       minimumSize: const Size.fromHeight(50),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     onPressed: () {},
                    //     //color: Colors.blue,
                    //     child: Text(
                    //       'Detect Disease',
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           fontFamily: fontName,
                    //           color: Colors.white),
                    //     ),
                    //   ),
                    // ),
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

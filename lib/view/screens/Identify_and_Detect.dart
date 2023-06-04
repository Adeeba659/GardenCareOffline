import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:GardenCare/view/screens/disease_detected.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../screens/identified.dart';
import '../../models/plant.dart';
import 'no_plant_found.dart';

class Identify_and_Detect extends StatelessWidget {
  final Uint8List? imageFile;
  final Plant resultPlant;

  Identify_and_Detect({required this.imageFile, required this.resultPlant});

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(height: 80),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/choose.png"),
                          size: 50,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Choose an option',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: fontName,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: primaryColor,
                      //     ),
                      //     borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      height: 400,
                      width: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          imageFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //Identify Plant Button
                    SizedBox(
                      height: 60, //height of button
                      width: 300,
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
                                  Identified(imageFile: imageFile!),
                            ),
                          );
                        },
                        //color: Colors.blue,
                        child: Text(
                          'Identify Plant',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: fontName,
                              color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    //Detect Plant Disease Button

                    SizedBox(
                      height: 60, //height of button
                      width: 300,
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
                                  DiseaseDetected(imageFile: imageFile!),
                            ),
                          );
                        },
                        //color: Colors.blue,
                        child: Text(
                          'Detect Disease',
                          style: TextStyle(
                              fontSize: 18,
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

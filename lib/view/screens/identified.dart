import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../widgets/bottomNavBar.dart';
import '../../utils/theme.dart';
import '../widgets/crousel.dart';
import '../../models/plant.dart';
import 'package:get/get.dart';
import 'package:GardenCare/controllers/disease_controller.dart';

class Identified extends StatelessWidget {
  final Uint8List? imageFile;
  Plant resultPlant;
  String diseaseStatus;

  Identified(
      {required this.imageFile,
      required this.resultPlant,
      required this.diseaseStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: 50),

                    Text(
                      'Plant Identified!'.tr,
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
                      resultPlant.commonName.tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: fontName,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Display Info

                    Crousel(resultPlant, 500.0, 'identified'),

                    //Detect Plant Disease Button
                    SizedBox(
                      height: 20,
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
                          DiseaseController.handleNavigation(
                              context, imageFile!, resultPlant, diseaseStatus);
                        },
                        child: Text(
                          'Detect Disease'.tr,
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
            ),
          ),
          BottomNavBar(0),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../data/data.dart';
import '../../models/plant.dart';
import '../widgets/information.dart';
import '../widgets/bottomNavBar.dart';
import '../widgets/plant_detail_widget.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/crousel.dart';

class plantDetail extends StatelessWidget {
  //final String plantName;
  final Plant plant_detail;

  plantDetail(this.plant_detail);

  @override
  Widget build(BuildContext context) {
    //final PlantDetailWidget detail_widget = PlantDetailWidget(plant_detail);
    //detail_widget.initializeWidgetList();
    //List<Widget> finalWidgetList = detail_widget.widget_list;

    //double deviceWidth = MediaQuery.of(context).size.width;
    //double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  //width: deviceWidth,
                  //constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),

                  // ignore: prefer_const_literals_to_create_immutables
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    // ignore: prefer_const_literals_to_create_immutables

                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 50,
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/detail_icon.png"),
                              size: 50,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Plant Details',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: primaryColor,
                                  fontFamily: fontName,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),

                      SizedBox(
                        height: 50,
                      ),

                      //Start
                      //detail_widget.plant_name(),
                      // Text(
                      //   plant_detail.commonName,
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       color: primaryColor,
                      //       fontFamily: fontName,
                      //       fontWeight: FontWeight.bold),
                      // ),

                      // SizedBox(
                      //   height: 20,
                      // ),

                      // ignore: prefer_const_constructors
                      //detail_widget.scientific_name(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       'Scientific Name : ',
                      //       style: TextStyle(
                      //           fontSize: 16,
                      //           color: primaryColor,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     Text(
                      //       plant_detail.scientificName,
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: primaryColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(
                      //   height: 10,
                      // ),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     //Description
                      //     detail_widget.plant_description(),
                      //     // Information(
                      //     //     'Description: ', plant_detail.description),

                      //     //Diseases

                      //     detail_widget.diseases_heading(),

                      //     // Information('\nDiseases: ', ''),

                      //     detail_widget.diseases(),

                      //     // Column(
                      //     //   children: List<Widget>.generate(
                      //     //       plant_detail.diseases.length, (index) {
                      //     //     return Column(
                      //     //       children: [
                      //     //         Information(plant_detail.diseases[index], ''),

                      //     //         //Disease Description

                      //     //         Information('Diseases Description : ',
                      //     //             plant_detail.diseases_desc[index]),

                      //     //         //Treatements

                      //     //         Information('Treatements : ',
                      //     //             plant_detail.treatements[index]),
                      //     //       ],
                      //     //     );
                      //     //   }),
                      //     // ),
                      //   ],
                      // ),

                      Crousel(plant_detail, 500.0, 'default'),
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: 400.0,
                      //     enlargeCenterPage: true,
                      //     enableInfiniteScroll: true,
                      //   ),
                      //   items: (finalWidgetList).map((widget) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return Container(
                      //           width: MediaQuery.of(context).size.width,
                      //           margin: EdgeInsets.symmetric(horizontal: 0.0),
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(8.0),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Colors.black.withOpacity(0.1),
                      //                 blurRadius: 5.0,
                      //                 spreadRadius: 2.0,
                      //               ),
                      //             ],
                      //           ),
                      //           child: Card(
                      //             elevation: 0.0,
                      //             margin: EdgeInsets.all(0.0),
                      //             color: Colors.transparent,
                      //             child: Padding(
                      //               padding: EdgeInsets.all(16.0),
                      //               child: SingleChildScrollView(
                      //                 child: widget,
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),

                      //           SizedBox(
                      //               height: 900,
                      //               child: PageView.builder(
                      //                   itemCount: 2,
                      //                   pageSnapping: true,
                      //                   itemBuilder: (context, pagePosition) {
                      //                     return Padding(
                      // padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      // child:  detail_widget.widget_list.map((e) => pagePosition),

                      // );
                      //                   }))
                    ],
                  ),
                ),
              ),
            ),
          ),

          // BottomNavBar(
          //   key: UniqueKey(),
          // ),
          BottomNavBar(0),
        ],
      ),
    );
  }
}

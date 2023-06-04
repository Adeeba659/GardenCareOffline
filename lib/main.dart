// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'view/screens/home_page.dart';
import 'utils/theme.dart';
import 'package:flutter/services.dart';
//import 'package:tflite/tflite.dart';
//import 'dart:ui';

void main() {
  // Disable system overlays (status bar)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  // Hide system overlays (status bar)
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  //SystemChrome.setEnabledSystemUIOverlays([]);
  // Initialize Tflite
  // WidgetsFlutterBinding.ensureInitialized();
  // Tflite.loadModel(
  //   model: 'assets/dl_model/model.tflite',
  // ).then((value) {
  //   runApp(MaterialApp(home: MyApp()));
  // });
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    //final appColor = Color.fromRGBO(40, 6, 31, 1);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSwatch().copyWith(
          //   // or from RGB

          //   primary: const Color.fromRGBO(40, 6, 31, 1),
          //   secondary: const Color(0xFFFFC107),
          // ),

          // primarySwatch: Colors.green,
          //accentColor: Colors.white,
          fontFamily: 'Poppins'),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          //constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home3.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            // ignore: prefer_const_literals_to_create_immutables
            // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
            children: [
              SizedBox(
                height: 60,
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    AssetImage("assets/images/leaf.png"),
                    //color: Colors.red,
                    size: 29,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Garden For Life',
                    style: TextStyle(
                      fontSize: 24,
                      color: purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 60,
              ),

              Text(
                "Let's Make Your \n Dream Garden",
                style: TextStyle(
                  fontSize: 18,
                  color: purpleColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // ignore: prefer_const_constructors
              Image(
                image: AssetImage("assets/images/home2.png"),
              ),

              SizedBox(
                height: 50,
              ),

              SizedBox(
                height: 50, //height of button
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    //side: BorderSide(width: 3, color: Colors.white),
                  ),

                  //color: Colors.blue,
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: purpleColor),
                  ),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home_page()));
                  },
                ),
              ),
            ],
          ),

          //child: const Text(
          //'Image in fullscreen',
          //style: TextStyle(fontSize: 34, color: Colors.red),
          //),
        ),

        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

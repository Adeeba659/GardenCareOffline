import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Identify_and_Detect.dart';
import '../../utils/theme.dart';
import '../widgets/bottomNavBar.dart';
import '../../controllers/capture_image_controller.dart';
import '../../controllers/identification_controller.dart';
import '../../models/plant.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TakePic extends StatefulWidget {
  @override
  _TakePicState createState() => _TakePicState();
}

class _TakePicState extends State<TakePic> {
  Uint8List? imageFile;
  final ImagePicker imgP = ImagePicker();
  late CaptureImageController _captureImageController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _captureImageController =
        CaptureImageController(IdentificationController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        color: secondaryColor,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              primaryColor), // Customize the color of the loading circle
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox.shrink(),
                      ),
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
                              fontWeight: FontWeight.bold,
                              fontFamily: fontName,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 400,
                        padding: EdgeInsets.all(20),
                        // child: imageFile != null
                        //     ? Image.memory(
                        //         imageFile!,
                        //         fit: BoxFit.cover,
                        //       )
                        //     :
                        child: Image.asset(
                          "assets/images/taking_pic.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(100, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            _getFromCamera();
                            // setState(() {
                            //   if (imageFile != null) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => Identify_and_Detect(
                            //             imageFile: imageFile!),
                            //       ),
                            //     );
                            //     //Identify_and_Detect(imageFile: imageFile!);
                            //   }
                            // });
                          },
                          child: const Text(
                            'Camera',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      SizedBox(
                        height: 60,
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
                            _getFromGallery();

                            // setState(() {
                            //   if (imageFile != null) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => Identify_and_Detect(
                            //             imageFile: imageFile!),
                            //       ),
                            //     );
                            //     //Identify_and_Detect(imageFile: imageFile!);
                            //   }
                            // });
                          },
                          child: Text(
                            'Gallery',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavBar(1),
          ],
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    setState(() {
      _isLoading = true;
    });
    var pickedFile = await imgP.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() async {
      //3-6-23
      imageFile = await pickedFile.readAsBytes();

      File image = File(pickedFile.path);
      Plant? resultPlant = await _processImage(image);

      if (resultPlant != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Identify_and_Detect(
              imageFile: imageFile!,
              resultPlant: resultPlant,
            ),
          ),
        );
      } else {
        // Handle case when plant identification failed
        // ...
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Identify_and_Detect(imageFile: imageFile!),
      //   ),
      // );
      //Identify_and_Detect(imageFile: imageFile!);
      // });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    setState(() {
      _isLoading = true;
    });
    var pickedFile = await imgP.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      //setState(() {
      imageFile = File(pickedFile.path).readAsBytesSync();

      File image = File(pickedFile.path);
      Plant? resultPlant = await _processImage(image);

      if (resultPlant != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Identify_and_Detect(
              imageFile: imageFile!,
              resultPlant: resultPlant,
            ),
          ),
        );
      } else {
        // Handle case when plant identification failed
        // ...
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Identify_and_Detect(imageFile: imageFile!),
      //   ),
      // );
      // });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<Plant?> _processImage(File image) async {
    Plant? resultPlant = await _captureImageController.processImage(image);

    return resultPlant;
  }
}

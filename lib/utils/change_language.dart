// import 'dart:ui';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class MyController extends GetxController {

//   void changeLanguage(var param1, var param2) {
//     var locate = Locale(param1, param2);

//     Get.updateLocale(locate);
//   }
// }

import 'dart:ui';
import 'package:get/get.dart';

class MyController extends GetxController {
  Rx<Locale> selectedLocale = Rx<Locale>(const Locale('en', 'US'));

  void changeLanguage(String languageCode, String countryCode) {
    selectedLocale.value = Locale(languageCode, countryCode);
    Get.updateLocale(selectedLocale.value);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MySnackBar {
 static void showCustomSnackBar(String message,
      Color backgroundColor) {

   Get.showSnackbar(GetSnackBar(

     message: message,
     backgroundColor: backgroundColor,
     duration: Duration(seconds: 3),
   ));

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DialogueBox{
  displayDialogueBox({required String title,required void Function()? onTap}){
   Get.defaultDialog(
     backgroundColor: Colors.white,
     title: title,
middleText: "press yes to continue.",
     textCancel: "No",
     textConfirm: "Yes",
     onCancel: (){
       Get.back();
     },
     onConfirm: onTap,
   );
 }




  }




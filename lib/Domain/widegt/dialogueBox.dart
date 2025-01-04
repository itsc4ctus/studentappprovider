import 'package:flutter/material.dart';
import 'package:studentapp/Domain/widegt/button.dart';

class DialogueBox extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const DialogueBox({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
      actions: [
        Button(buttonName: "No", onTap: (){Navigator.pop(context);}),
        Button(buttonName: "Yes", onTap: onTap)
      ],
    );
  }
}

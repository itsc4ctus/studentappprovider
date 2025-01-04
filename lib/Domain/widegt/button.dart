import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final double? width;
  final void Function()? onTap;
  const Button({required this.buttonName,required this.onTap,this.width = null, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.yellow.shade800,
        hoverColor: Colors.yellow,

        onTap: onTap,
        child: Container(
          height: 60,
          width: width,
          child: Center(child: Text(buttonName,style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,color: Colors.yellow.shade800
          ),)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade800),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

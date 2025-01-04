import 'package:flutter/material.dart';

class Feild extends StatelessWidget {
  final TextEditingController controller;
  final String feildName;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const Feild({required this.controller,required this.feildName,required this.validator,required this.prefixIcon,this.keyboardType = TextInputType.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [],
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(feildName),
          fillColor: Colors.white,
filled: true,
          hintText: "Enter ${feildName}",
          prefixIcon: prefixIcon,


        ),
      ),
    );
  }
}

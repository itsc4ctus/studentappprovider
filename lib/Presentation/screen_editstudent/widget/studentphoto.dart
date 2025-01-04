import 'package:flutter/material.dart';

class StudentPhoto extends StatelessWidget {
  const StudentPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(maxRadius: 50,minRadius: 50,),
        ElevatedButton(onPressed: (){}, child: Text("Upload"))
      ],
    );
  }
}

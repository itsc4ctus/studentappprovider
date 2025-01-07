import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentapp/Modal/studentmodel.dart';


class ViewStudent extends StatelessWidget {
  final StudentModal student;
  const ViewStudent({required this.student, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: student.image != null
                  ? FileImage(File(student.image!))
                  : const AssetImage('assets/default_avatar.png') as ImageProvider,
              child: student.image == null
                  ? const Icon(Icons.person, size: 80)
                  : null,
            ),
          ),
          const SizedBox(height: 20),

          // Display the student's details
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: Text(student.name),
          ),
          ListTile(
            leading: const Icon(Icons.view_agenda),
            title: const Text('Age'),
            subtitle: Text(student.age.toString()),
          ),
          ListTile(
            leading: const Icon(Icons.numbers),
            title: const Text('Roll No'),
            subtitle: Text(student.rollNo),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Department'),
            subtitle: Text(student.department),
          ),
          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text('CGPA'),
            subtitle: Text(student.cgpa.toString()),
          ),
        ],
      ),
    );
  }
}

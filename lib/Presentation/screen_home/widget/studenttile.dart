import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Domain/widegt/dialogueBox.dart';
import 'package:studentapp/Domain/widegt/snackbar.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_editstudent/screen_editstudent.dart';
import 'package:studentapp/Presentation/screen_view_student/viewStudent.dart';
import 'package:studentapp/controller/student_controller.dart';

class StudentTile extends StatelessWidget {
  final StudentModal student;  // Add the student parameter to pass student data

  StudentTile({super.key, required this.student});
  final controller = Get.find<StudentListController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: InkWell(
        onTap: () {
          Get.to(ViewStudent(student: student));
        },
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(File(student.image)),
            ),
            title: Text(student.name),
            subtitle: Text('Roll No: ${student.rollNo}'),
            trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(EditStudentPage(student: student));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      DialogueBox().displayDialogueBox(
                        title: "Do you want to delete?",
                        onTap: () {
                          controller.deleteStudent(student.rollNo);
                          Get.back();
                          MySnackBar.showCustomSnackBar(
                              "Student Deleted Successfully!", Colors.red);
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

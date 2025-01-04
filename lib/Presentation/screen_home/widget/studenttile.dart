import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Domain/widegt/dialogueBox.dart';
import 'package:studentapp/Domain/widegt/snackbar.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_editstudent/screen_editstudent.dart';
import 'package:studentapp/Presentation/screen_view_student/viewStudent.dart';
import 'package:studentapp/Provider/student_provider.dart';

class StudentTile extends StatelessWidget {
  final StudentModal student;  // Add the student parameter to pass student data

  const StudentTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewStudent(student: student,),));
        },
        child: Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(File(student.image))
            ),
            title: Text(student.name),
            subtitle: Text('Roll No: ${student.rollNo}'),
            trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditStudentPage(student: student),));

                    },
                    icon: const Icon(Icons.edit,color: Colors.blue,),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context){
                        return DialogueBox(title: "Do you want to delete?", onTap: (){
                          Provider.of<StudentProvider>(context,listen: false).deleteStudent(student.rollNo);
                          Navigator.pop(context);
                          MySnackBar.showCustomSnackBar(context, "Student Deleted Succesfly!", Colors.red);
                        });

                      }
                      );

                      },
                    icon: const Icon(Icons.delete,color: Colors.red,),
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

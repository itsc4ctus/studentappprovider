import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/services/student_services.dart';

class StudentListController extends GetxController {
  var studentList = <StudentModal>[].obs;  // Observable list of students

  @override
  void onInit() {
    super.onInit();
    fetchStudents();  // Fetch students on initialization
  }

  void fetchStudents() async {
    studentList.value = await StudentService().getStudents(); // Fetch and update the list
  }

  void addStudent(StudentModal student) async {
    await StudentService().addStudent(student);
    fetchStudents();  // Refresh the student list after adding a new student
  }

  void updateStudent(String rollNo, StudentModal student) async {
    await StudentService().updateStudent(rollNo, student);
    fetchStudents();  // Refresh the student list after updating
  }

  void deleteStudent(String rollNo) async {
    await StudentService().deleteStudent(rollNo);
    fetchStudents();  // Refresh the student list after deleting
  }
}

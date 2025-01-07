import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/services/student_services.dart';

class StudentListController extends GetxController {
  var studentList = <StudentModal>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    studentList.value = await StudentService().getStudents();
  }

  void addStudent(StudentModal student) async {
    await StudentService().addStudent(student);
    fetchStudents();
  }

  void updateStudent(String rollNo, StudentModal student) async {
    await StudentService().updateStudent(rollNo, student);
    fetchStudents();
  }

  void deleteStudent(String rollNo) async {
    await StudentService().deleteStudent(rollNo);
    fetchStudents();
  }
}

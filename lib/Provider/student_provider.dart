import 'package:flutter/material.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/services/student_services.dart';

class StudentProvider extends ChangeNotifier {

  Future<List<StudentModal>> _studentList = StudentService().getStudents();
  Future<List<StudentModal>> get studentList => _studentList;


  void addStudent(StudentModal student) async {
    await StudentService().addStudent(student);
    _studentList = StudentService().getStudents();
    notifyListeners();
  }


  void updateStudent(String rollNo, StudentModal student) async {
    await StudentService().updateStudent(rollNo, student);
    _studentList = StudentService().getStudents();
    notifyListeners();
  }

  void deleteStudent(String rollNo) async {
    await StudentService().deleteStudent(rollNo);
    _studentList = StudentService().getStudents();
    notifyListeners();
  }
}

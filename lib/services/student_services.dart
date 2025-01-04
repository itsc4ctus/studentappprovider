import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentapp/Modal/studentmodel.dart';

class StudentService {
  Box<StudentModal>? studentBox;

  Future<void> openBox() async {
    studentBox = await Hive.openBox<StudentModal>('studentBox');
  }

  Future<void> closeBox() async {
    await studentBox?.close();
  }

  Future<void> addStudent(StudentModal student) async {
    if (studentBox == null) {
      await openBox();
    }
    // Use rollNo as the key
    await studentBox!.put(student.rollNo, student);
  }

  Future<List<StudentModal>> getStudents() async {
    if (studentBox == null) {
      await openBox();
    }
    return studentBox!.values.toList();
  }

  Future<void> updateStudent(String rollNo, StudentModal student) async {
    if (studentBox == null) {
      await openBox();
    }

    await studentBox!.put(rollNo, student);
  }

  Future<void> deleteStudent(String rollNo) async {
    if (studentBox == null) {
      await openBox();
    }

    await studentBox!.delete(rollNo);
  }
}

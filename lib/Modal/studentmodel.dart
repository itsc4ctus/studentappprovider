import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


part 'studentmodel.g.dart';


@HiveType(typeId:0)
class StudentModal {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final String rollNo;
  @HiveField(3)
  final String department;
  @HiveField(4)
  final String image;
  @HiveField(5)
  final double cgpa;

  StudentModal(
      {required this.name,
      required this.age,
      required this.department,
      required this.image,
      required this.cgpa,
      required this.rollNo});
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/Presentation/screen_addstudent/screen_addstudent.dart';
import 'package:studentapp/Presentation/screen_home/widget/studenttile.dart';
import 'package:studentapp/controller/student_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
final controller = Get.find<StudentListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STUDENT APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddStudentPage());
        },
        child: Icon(Icons.add, size: 30, weight: 500),
      ),
      body: Obx((){
    if (controller.studentList.isEmpty) {
    return const Center(child: Text("No students to display"));
    }

    return ListView.separated(
    padding: const EdgeInsets.all(8.0),
    itemBuilder: (context, index) {
    final student = controller.studentList[index];
    return StudentTile(student: student);
    },
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemCount: controller.studentList.length,
    );
    }),

    );
  }
}

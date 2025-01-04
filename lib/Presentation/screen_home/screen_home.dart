import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_addstudent/screen_addstudent.dart';
import 'package:studentapp/Presentation/screen_home/widget/studenttile.dart';
import 'package:studentapp/Provider/student_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STUDENT APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentPage()),
          );
        },
        child: Icon(Icons.add, size: 30, weight: 500),
      ),
      body: Consumer<StudentProvider>(
        builder: (context, value, child) {
          return FutureBuilder<List<StudentModal>>(
            future: value.studentList,
            builder: (context, snapshot) {
              // Check if snapshot has data or is still loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }

              // If data is null or empty, show a message
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(child: Text("No students to display"));
              }

              // Once data is available, display the list
              var studentList = snapshot.data!;
              return ListView.separated(
                itemBuilder: (context, index) {
                  return StudentTile(student: studentList[index]);
                },
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: studentList.length,
              );
            },
          );
        },
      ),
    );
  }
}

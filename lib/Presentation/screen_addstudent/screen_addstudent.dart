import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Domain/widegt/button.dart';
import 'package:studentapp/Domain/widegt/dialogueBox.dart';
import 'package:studentapp/Domain/widegt/snackbar.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_addstudent/widget/feild.dart';
import 'package:studentapp/Provider/student_provider.dart';
import 'package:studentapp/services/student_services.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController depController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();
  final ValueNotifier<File?> _photoNotifier = ValueNotifier<File?>(null);

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _photoNotifier.value = File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD STUDENT"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Photo widget with validation
                  ValueListenableBuilder<File?>(
                    valueListenable: _photoNotifier,
                    builder: (context, imageFile, _) {
                      return Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 50,
                            backgroundImage: imageFile != null ? FileImage(imageFile) : null,
                            child: imageFile == null ? Icon(Icons.person, size: 50) : null,
                          ),
                          const SizedBox(height: 10),
                          Button(buttonName: "Upload Photo", onTap: _pickImage,width: 200,)
                        ],
                      );
                    },
                  ),
                  Feild(
                    validator: validateRequired,
                    controller: nameController,
                    feildName: "Student Name",
                    prefixIcon: const Icon(Icons.person),
                  ),
                  Feild(
                    validator: validateAge,
                    controller: ageController,
                    feildName: "Student Age",
                    prefixIcon: const Icon(Icons.view_agenda),
                    keyboardType: TextInputType.number,
                  ),
                  Feild(
                    validator: validateNumber,
                    controller: rollNoController,
                    feildName: "Student Roll No",
                    prefixIcon: const Icon(Icons.numbers),
                    keyboardType: TextInputType.number,
                  ),
                  Feild(
                    validator: validateRequired,
                    controller: depController,
                    feildName: "Department",
                    prefixIcon: const Icon(Icons.account_balance),
                  ),
                  Feild(
                    validator: validateCGPA,
                    controller: cgpaController,
                    feildName: "CGPA",
                    prefixIcon: const Icon(Icons.grade),
                    keyboardType: TextInputType.number,
                  ),
                  Button(
                    onTap: () {
                      if (_photoNotifier.value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please upload a photo")),
                        );
                        return;
                      }
                      if (_key.currentState?.validate() ?? false) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogueBox(
                              title: "Do you want to Add Student?",
                              onTap: () {
                                String name = nameController.text;
                                int age = int.parse(ageController.text);
                                String rollNo = rollNoController.text;
                                String department = depController.text;
                                double cgpa = double.parse(cgpaController.text);
                                File? photo = _photoNotifier.value;

                                StudentModal student = StudentModal(
                                  name: name,
                                  age: age,
                                  department: department,
                                  image: photo!.path,
                                  cgpa: cgpa,
                                  rollNo: rollNo,
                                );

                                Provider.of<StudentProvider>(context, listen: false)
                                    .addStudent(student);

                                nameController.clear();
                                ageController.clear();
                                rollNoController.clear();
                                depController.clear();
                                cgpaController.clear();
                                _photoNotifier.value = null;

                                MySnackBar.showCustomSnackBar(context, "Student Added Succesfly!", Colors.green);
                                // Close the dialog
                                Navigator.pop(context);

                                // Navigate back to the home screen
                                Navigator.pop(context);

                              },
                            );
                          },
                        );

                      }

                    },
                    buttonName: "ADD",
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return "Please enter a valid number";
    }
    return null;
  }

  String? validateCGPA(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return "Please enter a valid number";
    }
    double cgpa = double.parse(value);
    if (cgpa > 10) {
      return "CGPA is out of 10";
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty || double.tryParse(value) == null) {
      return "Please enter a valid Age";
    }
    if (int.parse(value) > 100) {
      return "Enter age below 100";
    }
    return null;
  }


}

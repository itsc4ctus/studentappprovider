import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/Domain/widegt/dialogueBox.dart';
import 'package:studentapp/Domain/widegt/snackbar.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_addstudent/widget/feild.dart';
import 'package:studentapp/controller/student_controller.dart';


class EditStudentPage extends StatelessWidget {
  final StudentModal student;
  EditStudentPage({required this.student, super.key});
final controller = Get.find<StudentListController>();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey();
    final TextEditingController nameController =
    TextEditingController(text: student.name);
    final TextEditingController ageController =
    TextEditingController(text: student.age.toString());
    final TextEditingController rollNoController =
    TextEditingController(text: student.rollNo.toString());
    final TextEditingController depController =
    TextEditingController(text: student.department.toString());
    final TextEditingController cgpaController =
    TextEditingController(text: student.cgpa.toString());
    final ValueNotifier<File?> _photoNotifier = ValueNotifier<File?>(null);
    _photoNotifier.value =
    student.image != null ? File(student.image!) : null;

    Future<void> _pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _photoNotifier.value = File(image.path);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT STUDENT"),
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
                  ValueListenableBuilder<File?>(
                    valueListenable: _photoNotifier,
                    builder: (context, imageFile, _) {
                      return Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 50,
                            backgroundImage: imageFile != null
                                ? FileImage(imageFile)
                                : null,
                            child: imageFile == null
                                ? Icon(Icons.person, size: 50)
                                : null,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text("Upload Photo"),
                          ),
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
                  ElevatedButton(
                    onPressed: () {
                      if (_photoNotifier.value == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please upload a photo")),
                        );
                        return;
                      }
                      if (_key.currentState?.validate() ?? false) {

                        Get.dialog(
                           DialogueBox().displayDialogueBox(title: "Do you want to Edit?", onTap: (){
                            String name = nameController.text;
                            int age = int.parse(ageController.text);
                            String rollNo = rollNoController.text;
                            String department = depController.text;
                            double cgpa = double.parse(cgpaController.text);
                            File? photo = _photoNotifier.value;
                            StudentModal updatedStudent = StudentModal(
                              name: name,
                              age: age,
                              department: department,
                              image: photo!.path,
                              cgpa: cgpa,
                              rollNo: rollNo,
                            );

                            controller.updateStudent(rollNo, updatedStudent);

                            nameController.clear();
                            ageController.clear();
                            rollNoController.clear();
                            depController.clear();
                            cgpaController.clear();
                            _photoNotifier.value = null;
                            Navigator.pop(context);

                            MySnackBar.showCustomSnackBar("Student Edited Succesfly!", Colors.blue);
                            Navigator.pop(context);
                          })

                        );


                      }


                    },
                    child: const Text("UPDATE"),
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

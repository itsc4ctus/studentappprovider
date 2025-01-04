import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_home/screen_home.dart';
import 'package:studentapp/controller/student_controller.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Get.put(StudentListController());
  Hive.registerAdapter(StudentModalAdapter());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow.shade800,
          foregroundColor: Colors.yellow,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
          titleTextStyle: TextStyle(
            color: Colors.yellow.shade800,
            fontSize: 24,
            fontWeight: FontWeight.w800
          )
        ),
        scaffoldBackgroundColor: Colors.yellow.shade50
      ),
      home: HomePage(),
    );
  }
}

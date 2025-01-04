import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Modal/studentmodel.dart';
import 'package:studentapp/Presentation/screen_home/screen_home.dart';
import 'package:studentapp/Provider/student_provider.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModalAdapter());
  runApp(ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

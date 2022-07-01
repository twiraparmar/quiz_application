import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_application/screens/quiz/quiz_screen.dart';
import 'package:quiz_application/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Welcome_Screen(),
    );
  }
}

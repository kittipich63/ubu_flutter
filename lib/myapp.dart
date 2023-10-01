import 'package:flutter/material.dart';
import 'package:ubuapp/mockup/data.dart';
import 'package:ubuapp/pages/coursedetailpage.dart';
import 'package:ubuapp/pages/firstpage.dart';
import 'package:ubuapp/pages/login.dart';
import 'package:ubuapp/pages/myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UBU APP',
      routes: {
        '/': (context) => const FirstPage(),
        '/Login': (context) => const Login(),
        '/Homeview': (context) => const HomeView(),
        '/detail': (context) => CourseDetailPage(course: randomCourse()),
      },
    );
  }
}
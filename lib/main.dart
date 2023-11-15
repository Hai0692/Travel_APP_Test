import 'package:flutter/material.dart';
import 'package:flutter_application_travel/pages/detail_page.dart';
import 'package:flutter_application_travel/pages/home_page.dart';
import 'package:flutter_application_travel/pages/navpages/main_page.dart';
import 'package:flutter_application_travel/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        primarySwatch: Colors.blue,

      ),
      home:  WelcomePage(),
    );
  }
}

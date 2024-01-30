import 'package:camera_practice/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera_practice/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Camera Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
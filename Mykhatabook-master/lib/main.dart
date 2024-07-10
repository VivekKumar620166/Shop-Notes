// lib/main.dart

import 'package:flutter/material.dart';


import 'Screens/splash_screen.dart'; // Adjust path as per your project structure

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Hotstar Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Set the splash screen as the home widget
    );
  }
}

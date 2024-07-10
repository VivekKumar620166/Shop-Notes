import 'dart:async';
import 'package:flutter/material.dart';

import 'package:vivekbook/Screens/scrolling_ui.dart';
import 'MainScreen.dart'; // Import your main screen as needed

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming operation, like fetching data or loading resources
    Timer(Duration(seconds: 4), () {
      // After 2 seconds, navigate to the main screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => RotationScreen()), // Replace with your desired screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 200, // Adjust height as needed
          width: 200,  // Adjust width as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'), // Adjust path as per your asset location
              fit: BoxFit.cover, // Cover the entire container
            ),
          ),
        ),
      ),
    );
  }


  }


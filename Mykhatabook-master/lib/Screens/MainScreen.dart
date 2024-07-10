// lib/MainScreen.dart

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Hotstar Main Screen!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

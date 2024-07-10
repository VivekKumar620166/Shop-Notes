import 'dart:async';
import 'package:flutter/material.dart';

import 'login_screendart.dart'; // Assuming this is the correct file name

void main() => runApp(RotationScreen());

class RotationScreen extends StatefulWidget {
  @override
  State<RotationScreen> createState() => _RotationScreenState();
}

class _RotationScreenState extends State<RotationScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          _buildPage(
                            imageUrl: 'https://bsscommerce.com/blog/wp-content/uploads/2021/11/How-to-Show-Product-Magnification-zoom-in-Product-View-Page-in-m2-1024x512-1.png',
                            title: 'Add Customer',
                            bottomText: 'Please provide the necessary details for the new customer, including name, contact information, and billing address.',
                          ),
                          _buildPage(
                            imageUrl: 'https://imgur.com/58US0K9.png',
                            title: 'Get Bill',
                            bottomText: 'Review the itemized bill, verify the details, and proceed to generate the final invoice for the customer.',
                          ),
                          _buildPage(
                            imageUrl: 'https://bsscommerce.com/blog/wp-content/uploads/2022/05/magento-2-customize-checkout-page-3.png',
                            title: 'Select Products',
                            bottomText: 'Browse and select the products or services you wish to include in the customer\'s bill.',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String imageUrl,
    required String title,
    required String bottomText,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: Image.network(imageUrl),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 10),
          Text(
            bottomText,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

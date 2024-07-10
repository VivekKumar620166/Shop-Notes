import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import for HTTP requests
import 'dart:convert'; // Import for JSON decoding

import 'Home_page.dart'; // Adjust import based on your project structure

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController =
  TextEditingController(text: "9399471428");
  final TextEditingController passwordController =
  TextEditingController(text: "12345678");

  bool obscureText = true; // State variable for password visibility

  void _login(BuildContext context) async {
    String phoneNumber = phoneController.text.trim();
    String password = passwordController.text.trim();

    // Replace with your actual API endpoint
    String apiUrl = 'https://dailybills.languagenectar.in/api/user/login';

    // Make POST request to API
    var response = await http.post(Uri.parse(apiUrl), body: {
      "mobile_number": phoneNumber,
      "password": password,
    });

    // Check response status code
    if (response.statusCode == 200) {
      // Parse response JSON
      var jsonResponse = json.decode(response.body);

      // Example assuming JSON structure matches your expected response
      bool status = jsonResponse['status'];
      String message = jsonResponse['message'];

      if (status) {
        // Navigate to HomeScreen on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Show snackbar with error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } else {
      // Show snackbar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to login. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Bills',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Replace with your desired color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                          width:
                          10), // Optional: Adds space between icon and text
                      Text(
                        'trusted by 5 lakh + business across \nindia',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fill color of the TextField
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: InputBorder.none, // Remove border here
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Fill color of the TextField
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none, // Remove border here
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        // Toggle the obscureText state of the password field
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 350),
              SizedBox(
                width: double.infinity, // Full width
                height: 50, // Set height of the button
                child:ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

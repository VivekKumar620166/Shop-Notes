import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(GaveScreen());
}

class GaveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue, // Replace with your desired color
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Customize arrow color here
            onPressed: () {
              Navigator.pop(context); // Handle back arrow tap to pop the current route
            },
          ),// Automatically show leading button
        // Replace with your desired title
          actions: [
            // Add any actions here if needed
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTextField(labelText: 'Enter Amount', prefixIcon: Icons.attach_money),
                  SizedBox(height: 16.0),
                  _buildTextField(labelText: 'Enter Note', prefixIcon: Icons.note),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _showCalendar(context); // Open calendar when tapped
                          },
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.red),
                                SizedBox(width: 12.0),
                                Text(
                                  'Select Date',
                                  style: TextStyle(fontSize: 16.0, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          _attachBills(context); // Handle attach bills action
                        },
                        child: Container(
                          width: 180.0, // Set width as needed
                          height: 50.0, // Set height as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.attach_file, color: Colors.red),
                              SizedBox(width: 8.0),
                              Text(
                                'Attach Bills',
                                style: TextStyle(fontSize: 16.0, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 360),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for the button here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      minimumSize: Size(340, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText, required IconData prefixIcon}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            counterText: '', // Hides the counter text below the TextField
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.red,
            ),
          ),
          maxLength: 10, // Maximum character limit
        ),
      ),
    );
  }

  Future<void> _showCalendar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), // Choose your theme
          child: child!,
        );
      },
    );
    if (picked != null) {
      print('Selected date: $picked');
      // Handle selected date logic here
    }
  }

  void _attachBills(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.red),
                title: Text('Take a picture'),
                onTap: () {
                  _takePicture(context); // Call method to handle taking a picture
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.red),
                title: Text('Choose from gallery'),
                onTap: () {
                  _chooseFromGallery(context); // Call method to handle choosing from gallery
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _takePicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      print('Image picked from camera: ${pickedFile.path}');
    }
    Navigator.pop(context);
  }

  void _chooseFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image picked from gallery: ${pickedFile.path}');
    }
    Navigator.pop(context);
  }
}

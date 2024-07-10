import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(GotScreen());
}

class GotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(

         title: Padding(
           padding: const EdgeInsets.only(left:60),
           child: Text("You Got 0 ₹",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
         ),

         automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Customize arrow color here
          onPressed: () {
            Navigator.pop(context); // Handle back arrow tap to pop the current route
          },
        ),
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
                                Icon(Icons.calendar_today, color: Colors.green),
                                SizedBox(width: 12.0),
                                Text(
                                  'Select Date',
                                  style: TextStyle(fontSize: 16.0, color: Colors.green),
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
                              Icon(Icons.attach_file, color: Colors.green),
                              SizedBox(width: 8.0),
                              Text(
                                'Attach Bills',
                                style: TextStyle(fontSize: 16.0, color: Colors.green),
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
                      foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                      minimumSize: Size(340, 50), // Width and height minimum size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Button border radius
                      ),
                    ),
                    child: Text('Save'), // Button text
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
              color: Colors.green,
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
                leading: Icon(Icons.camera_alt, color: Colors.green),
                title: Text('Take a picture'),
                onTap: () {
                  _takePicture(context); // Call method to handle taking a picture
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.green),
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

  // Method to handle taking a picture
  void _takePicture(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Handle the picked image (e.g., display it in an ImageView)
      print('Image picked from camera: ${pickedFile.path}');
    }
    Navigator.pop(context); // Close the bottom sheet after selection
  }

  // Method to handle choosing from gallery
  void _chooseFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle the picked image (e.g., display it in an ImageView)
      print('Image picked from gallery: ${pickedFile.path}');
    }
    Navigator.pop(context); // Close the bottom sheet after selection
  }
}

// import 'package:flutter/material.dart';
//
// class LogOut extends StatefulWidget {
//   const LogOut({Key? key}) : super(key: key);
//
//   @override
//   State<LogOut> createState() => _LogOutState();
// }
//
// class _LogOutState extends State<LogOut> {
//   bool _passwordVisible = false; // State variable to track password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Padding(
//             padding: EdgeInsets.only(left: 50),
//             child: Text(
//               'Calculator',
//               style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
//             ),
//           ),
//           backgroundColor: Colors.blue,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Container(
//                   width: 350,
//                   height: 100, // Adjusted height to accommodate both content and text fields
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 5,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: const [
//                           Padding(
//                             padding: EdgeInsets.all(10.0),
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 20),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors.blue,
//                                 child: Icon(
//                                   Icons.check,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "trusted by 5 Lakh + business across\nindia",
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 20), // Adjust the height as needed
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20), // Adjust the height as needed
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: 'Enter Phone Number',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10), // Set border radius here
//                       borderSide: BorderSide.none, // Remove the border side
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20,), // Adjust the height as needed
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextField(
//                   obscureText: !_passwordVisible, // Toggle obscureText based on _passwordVisible
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: 'Enter Password',
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _passwordVisible = !_passwordVisible; // Toggle the state variable
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10), // Set border radius here
//                       borderSide: BorderSide.none, // Remove the border side
//                     ),
//                     contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 350), // Adjust the height as needed
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Handle button press
//                   },
//                   child: Text('Log Out', style: TextStyle(color:Colors.white)),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     backgroundColor: Colors.blue, // Background color of the button
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(LogOut());
// }

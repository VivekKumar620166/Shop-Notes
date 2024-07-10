// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(ProfilePage());
// }

// class ProfilePage extends StatefulWidget {
//   @override
//   State<ProfilePage> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<ProfilePage> {
//   final TextEditingController _nameController = TextEditingController();
//   String _savedName = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Padding(
//             padding: const EdgeInsets.only(left: 80),
//             child: const Text('About Us', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
//           ),
//           backgroundColor: Colors.blue,
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(top: 60),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         // Replace with your image URL
//                       ),
//                       Positioned(
//                         bottom: 1,
//                         child: CircleAvatar(
//                           radius: 59.4,
//                           backgroundColor: Colors.blue,
//                           child: Icon(
//                             Icons.person,
//                             size: 50,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: TextField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Search',
//                       prefixIcon: Icon(Icons.person),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 370),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _savedName = _nameController.text;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue, // Background color
//                     padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15), // Padding
//                   ),
//                   child: Text('Save Name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

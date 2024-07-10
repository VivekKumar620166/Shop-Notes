// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:vivekbook/Screens/Add_Customer.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(HomePage());
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePageContent(), // Use a separate stateful widget for content
//     );
//   }
// }
//
// class HomePageContent extends StatefulWidget {
//   @override
//   _HomePageContentState createState() => _HomePageContentState();
// }
//
// class _HomePageContentState extends State<HomePageContent> {
//   CustomerModel? customerModel;
//   List<Datum> filteredCustomers = [];
//   bool _isLoading = false;
//   String authToken =
//       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2RhaWx5YmlsbHMubGFuZ3VhZ2VuZWN0YXIuaW4vYXBpL3VzZXIvbG9naW4iLCJpYXQiOjE3MTk1NTQxMjMsImV4cCI6MTcyMDc2MzcyMywibmJmIjoxNzE5NTU0MTIzLCJqdGkiOiJCRWFObndDYnlhT3FqMTg5Iiwic3ViIjoiMTAxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.2mgF7pPbeGaH0EFFv2OvVQM4O1ubev5jBatioxOFj6k'; // Replace with your actual auth token
//   String apiUrl =
//       'https://dailybills.languagenectar.in/api/customerlist?page=1';
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData(authToken);
//   }
//
//   Future<void> fetchData(String authToken) async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       var response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {'Authorization': 'Bearer $authToken'},
//       );
//       if (response.statusCode == 200) {
//         setState(() {
//           var jsonResponse = jsonDecode(response.body);
//           customerModel = CustomerModel.fromJson(jsonResponse);
//           filteredCustomers.addAll(customerModel!.data!.data!);
//           _isLoading = false;
//         });
//       } else {
//         print('Failed to load profile data: ${response.statusCode}');
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void _navigateToDetails(Datum customer) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => CustomerDetailsPage(customer)),
//     );
//   }
//
//   void filterSearchResults(String query) {
//     List<Datum> dummySearchList = [];
//     dummySearchList.addAll(customerModel!.data!.data!);
//     if (query.isNotEmpty) {
//       List<Datum> dummyListData = [];
//       dummySearchList.forEach((item) {
//         if (item.name!.toLowerCase().contains(query.toLowerCase())) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         filteredCustomers.clear();
//         filteredCustomers.addAll(dummyListData);
//       });
//     } else {
//       setState(() {
//         filteredCustomers.clear();
//         filteredCustomers.addAll(customerModel!.data!.data!);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customer List'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 125, // Adjust height as needed
//             // Existing financial overview container code
//             decoration: BoxDecoration(
//               color: Colors.white, // Set background color to white
//               borderRadius: BorderRadius.circular(8.0), // Optional: Adds border radius
//             ),
//             margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//             child: Stack(
//               children: <Widget>[
//                 // Your existing content for financial overview
//                 Positioned(
//                   top: 20,
//                   left: 50,
//                   child: RichText(
//                     text: TextSpan(
//                       text: '₹ ',
//                       style: TextStyle(color: Colors.black, fontSize: 14),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: '0.00',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 20,
//                   right: 16,
//                   child: RichText(
//                     text: TextSpan(
//                       text: '₹ ',
//                       style: TextStyle(color: Colors.black, fontSize: 14),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: '19219.00',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: 180,
//                   top: 20,
//                   bottom: 50,
//                   width: 2,
//                   child: Container(
//                     color: Colors.black,
//                   ),
//                 ),
//                 Positioned(
//                   left: 10,
//                   right: 10,
//                   bottom: 38,
//                   height: 2,
//                   child: Container(
//                     color: Colors.black,
//                   ),
//                 ),
//                 Positioned(
//                   left: 10,
//                   right: 10,
//                   bottom: 10,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'View Reports',
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       SizedBox(width: 5),
//                       Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.black,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   left: 20,
//                   top: 42,
//                   child: Text(
//                     'You will give',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//                 Positioned(
//                   left: 270,
//                   top: 42,
//                   child: Text(
//                     'You will get',
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(8.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search by name...',
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                   ),
//                   prefixIcon: Icon(Icons.search, color: Colors.blue),
//                   contentPadding:
//                   EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//                 onChanged: (value) {
//                   filterSearchResults(value);
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ? Center(
//               child: CircularProgressIndicator(),
//             )
//                 : filteredCustomers.isEmpty
//                 ? Center(
//               child: Text('No results found'),
//             )
//                 : ListView.builder(
//               itemCount: filteredCustomers.length,
//               itemBuilder: (context, index) {
//                 Datum customer = filteredCustomers[index];
//                 return GestureDetector(
//                   onTap: () => _navigateToDetails(customer),
//                   child: _buildDataCard(customer),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left:200),
//             child: Container(
//               margin: EdgeInsets.all(8.0),
//               child: TextButton(
//                 onPressed: () {
//                   // Navigate to the second screen using MaterialPageRoute
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AddCustomerScreen(),
//                     ),
//                   );
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.green),
//                   padding: MaterialStateProperty.all(
//                     EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min, // To restrict the row size to its children
//                   children: [
//                     Icon(
//                       Icons.person_add,
//                       color: Colors.white,
//                       size: 20.0, // Adjust the size as needed
//                     ),
//                     SizedBox(width: 8.0), // Adds space between icon and text
//                     Text(
//                       'Add Customer',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDataCard(Datum customer) {
//     return Card(
//       elevation: 2.0,
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               child: Text(
//                 customer.name![0].toUpperCase(),
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//               backgroundColor: Colors.blue,
//               radius: 24.0,
//             ),
//             SizedBox(width: 16.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Name',
//                   style:
//                   TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   customer.name ?? 'Not available',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomerModel {
//   bool? status;
//   String? message;
//   Data? data;
//
//   CustomerModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
//     status: json["status"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
// }
//
// class Data {
//   int? currentPage;
//   List<Datum>? data;
//
//   Data({
//     this.currentPage,
//     this.data,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     currentPage: json["current_page"],
//     data: json["data"] == null
//         ? []
//         : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
// }
//
// class Datum {
//   int? id;
//   String? name;
//   String? phoneNumber;
//   String? runningBalance;
//
//   Datum({
//     this.id,
//     this.name,
//     this.phoneNumber,
//     this.runningBalance,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     phoneNumber: json["phone_number"],
//     runningBalance: json["running_balance"],
//   );
// }
//
// class CustomerDetailsPage extends StatelessWidget {
//   final Datum customer;
//
//   CustomerDetailsPage(this.customer);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customer Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Name:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               customer.name ?? 'Not available',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Phone Number:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               customer.phoneNumber ?? 'Not available',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Running Balance:',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//             ),
//             SizedBox(height: 8.0),
//             Text(
//               customer.runningBalance ?? 'Not available',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';

import '../Screens/Got_screen.dart';
import '../Screens/gave_screen.dart';
import '../Screens/view_report.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KhataBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<User> users = generateRandomUsers(20);
  String searchQuery = '';

  static List<User> generateRandomUsers(int count) {
    List<User> users = [];
    Random random = Random();
    List<String> firstNames = [
      'Alice', 'Bob', 'Carol', 'David', 'Emma', 'Frank', 'Grace', 'Henry', 'Ivy', 'Jack',
      'Kate', 'Leo', 'Mia', 'Noah', 'Olivia', 'Peter', 'Queen', 'Ryan', 'Sarah', 'Tom'
    ];
    List<String> lastNames = [
      'Adams', 'Brown', 'Clark', 'Davis', 'Evans', 'Ford', 'Garcia', 'Hill', 'Irwin', 'Jones',
      'King', 'Lee', 'Miller', 'Nelson', 'Owens', 'Patel', 'Quinn', 'Roberts', 'Smith', 'Taylor'
    ];
    for (int i = 0; i < count; i++) {
      String firstName = firstNames[random.nextInt(firstNames.length)];
      String lastName = lastNames[random.nextInt(lastNames.length)];
      int mobileNumber = 1000000000 + random.nextInt(4294967295 - 1000000000 + 1);
      users.add(User('$firstName $lastName', '+91 $mobileNumber', addedTime: DateTime.now().subtract(Duration(minutes: random.nextInt(1440)))));
    }
    return users;
  }

  void addNewUser(String username, String mobileNumber) {
    DateTime currentTime = DateTime.now(); // Get current time
    setState(() {
      users.add(User(username, mobileNumber, addedTime: currentTime));
    });
    Navigator.pop(context); // Close add customer screen
  }

  List<User> get filteredUsers {
    if (searchQuery.isEmpty) {
      return users;
    } else {
      return users.where((user) => user.username.toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 80, // Adjust the height as needed
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.menu_book, color: Colors.white), // Replace with your desired icon
                SizedBox(width: 8), // Adjust spacing between icon and text
                Text('vivek', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 2), // Adjust spacing as needed
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4.0, color: Colors.white), // Adjust thickness and color as needed
                ),
              ),
              child: Text('CUSTOMERS', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        centerTitle: false, // Set to false if you want to align title to the left
      ),




      body: Column(
        children: [
          Container(
            height: 125, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Stack(
              children: <Widget>[
                // Your existing content for financial overview
                Positioned(
                  top: 20,
                  left: 50,
                  child: RichText(
                    text: TextSpan(
                      text: '₹ ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: '0.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 16,
                  child: RichText(
                    text: TextSpan(
                      text: '₹ ',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: '19219.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 20,
                  bottom: 50,
                  width: 0.5,
                  child: Container(
                    color: Colors.brown,
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 38,
                  height: 0.5,
                  child: Container(
                    color: Colors.brown,
                  ),
                ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReport()), // Replace YourNewPage with your actual page widget
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VIEW REPORTS',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
                Positioned(
                  left: 20,
                  top: 42,
                  child: Text(
                    'You will give',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Positioned(
                  left: 270,
                  top: 42,
                  child: Text(
                    'You will get',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50, // Height of the search field
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // White background
                  hintText: 'Search by name...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(filteredUsers[index].username[0]),
                        ),
                        title: Text('${filteredUsers[index].username}'),
                        subtitle: Text('Added: ${filteredUsers[index].getFormattedTime()}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(user: filteredUsers[index]),
                            ),
                          );
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: Container(
        width: 200,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCustomerScreen(
                  users: users,
                  addNewUser: addNewUser,
                ),
              ),
            );
          },
          icon: Icon(Icons.person_add,color: Colors.white,),
          label: Text("Add User",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              side: BorderSide(color: Colors.green, width: 2.0), // Border
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  final String username;
  final String mobileNumber;
  final DateTime addedTime;

  User(this.username, this.mobileNumber, {required this.addedTime});

  String getFormattedTime() {
    Duration difference = DateTime.now().difference(addedTime);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

class UserDetailsScreen extends StatefulWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String dropdownValue = 'Option 1'; // Example dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(widget.user.username[0]),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.user.username}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      '${widget.user.mobileNumber}',
                      style: TextStyle(fontSize: 14, color: Colors.white60),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _showPopupMenu(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 8),
                        Text(
                          'You Will Give',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 170),
                        Icon(
                          Icons.attach_money,
                          color: Colors.green,
                          size: 24,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.brown,
                      thickness: 1,
                      height: 30,
                      indent: 27,
                      endIndent: 27,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'set collection date',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Transaction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 330),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GaveScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'You Gave ₹',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GotScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'You got ₹',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(overlay.size.bottomLeft(Offset.zero)),
          overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
        ),
        // Adjust the size of the dropdown menu here
        Offset.zero & Size(300, 300), // Adjust width and height as needed
      ),
      items: [
        PopupMenuItem<String>(
          value: 'All Bills',
          child: Padding(
            padding: const EdgeInsets.only(right:200),
            child: Text('All Bills'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('All Draft'),
        ),
        PopupMenuItem<String>(
          value: 'Option 3',
          child: Text('Generate Pdf'),
        ),
        PopupMenuItem<String>(
          value: 'Option 4',
          child: Text('Clear All Transication'),
        ),
        PopupMenuItem<String>(
          value: 'Option 5',
          child: Text('Delete'),
        ),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {
        setState(() {
          dropdownValue = value;
        });
      }
    });
  }

}


class AddCustomerScreen extends StatefulWidget {
  final List<User> users;
  final Function(String, String) addNewUser;

  AddCustomerScreen({required this.users, required this.addNewUser});

  @override
  _AddCustomerScreenState createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Customize arrow color here
            onPressed: () {
              Navigator.pop(context); // Handle back arrow tap to pop the current route
            },
          ),
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(left:50),
          child: Text('Add Customer', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white, // White background
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // No border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _mobileNumberController,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                filled: true,
                fillColor: Colors.white, // White background
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // No border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String mobileNumber = _mobileNumberController.text;
                widget.addNewUser(username, mobileNumber); // Pass the mobile number to addNewUser
                // Clear text fields after adding user
                _usernameController.clear();
                _mobileNumberController.clear();
              },
              child: Text('Save',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Existing Customer:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.white, // Add white color here
                  child: ListView.builder(
                    itemCount: widget.users.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(widget.users[index].username[0]),
                            ),
                            title: Text('${widget.users[index].username}'),
                            subtitle: Text('Added: ${widget.users[index].getFormattedTime()}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsScreen(user: widget.users[index]),
                                ),
                              );
                            },
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

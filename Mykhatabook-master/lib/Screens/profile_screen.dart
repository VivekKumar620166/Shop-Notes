import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:vivekbook/Screens/privacy_policy.dart';
import 'package:vivekbook/Screens/term_condition.dart';


import 'about_khatabook.dart';
import 'customer.dart';
import 'login_screendart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showSettings = true; // Example flag for visibility settings
  bool appLockEnabled = false; // Flag to indicate if app lock is enabled
  String enteredPasscode = '';
  String savedName = ''; // Variable to store the saved name

  void toggleAppLock() {
    setState(() {
      if (appLockEnabled) {
        appLockEnabled = false;
        enteredPasscode = ''; // Reset passcode if app lock is disabled
      } else {
        // Start passcode setting process
        navigateToPasscodeScreen();
      }
    });
  }

  void handleLogout() {
    // Implement your logout functionality here
    print('Logout tapped');
  }

  void navigateToPasscodeScreen() {
    screenLockCreate(
      context: context,
      onConfirmed: (passcode) {
        setState(() {
          enteredPasscode = passcode;
        });
        // Ask for confirmation
        confirmPasscodeScreen();
      },
    );
  }

  void confirmPasscodeScreen() {
    screenLock(
      context: context,
      correctString: enteredPasscode,
      onUnlocked: () {
        setState(() {
          appLockEnabled = true;
        });
        print('Correct passcode entered and confirmed. App lock enabled.');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      onCancelled: () {
        setState(() {
          appLockEnabled = false;
        });
        print('Passcode setup cancelled.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Icon(Icons.menu_book_outlined, color: Colors.white),
        ),
        title: Row(
          children: const [
            SizedBox(width: 8),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 60),
              child: Text(
                'vivek',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage(onSave: (name) {
                            setState(() {
                              savedName = name;
                            });
                          })),
                        );
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      SizedBox(height: 5),

                      SizedBox(height: 10),
                      // Display saved name if available
                      if (savedName.isNotEmpty)
                        Text(
                          savedName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                      Text(
                        '6267195756',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              width:400,
              color: Colors.white10,
            ),


            Container(
              height: 140,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.phone_android, size: 60),
                  SizedBox(height: 10),
                  Text(
                    'Share App',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 22,
                child: Icon(Icons.restore, color: Colors.white),
              ),
              title: Text('Restore'),
              children: [
                ListTile(
                  title: Text('Customers'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 22,
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text('Setting'),
                ],
              ),
              children: [
                ListTile(
                  title: Text('AppLock'),
                  trailing: Switch(
                    value: appLockEnabled,
                    onChanged: (value) {
                      toggleAppLock();
                      if (value) {
                        navigateToPasscodeScreen();
                      }
                    },
                  ),
                ),
              ],
            ),

            ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 22,
                child: Icon(Icons.help_outlined, color: Colors.white),
              ),
              title: Text('Help & support'),
              children: [
                ListTile(
                  title: Text('How to Use'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Help on WhatsApp'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                ),

                ListTile(
                  title: Text('Call Us'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerPage()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 22,
                    child: Icon(Icons.info, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text('AboutUs'),
                ],
              ),
              children: [
                ListTile(
                  title: Text('AboutKhatabook'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutKhatabook()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Term and Condition'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsCondition()),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                handleLogout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.redAccent,
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final Function(String) onSave;

  const ProfilePage({Key? key, required this.onSave}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: const Text(
            'About Us',
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      // Replace with your image URL
                    ),
                    Positioned(
                      bottom: 1,
                      child: CircleAvatar(
                        radius: 59.4,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 370),
              ElevatedButton(
                onPressed: () {
                  String name = _nameController.text;
                  widget.onSave(name); // Callback to save name in parent widget
                  Navigator.pop(context); // Close profile page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15), // Padding
                ),
                child: Text(
                  'Save Name',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

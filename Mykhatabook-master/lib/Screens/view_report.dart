import 'package:flutter/material.dart';

void main() {
  runApp(ViewReport());
}

class ViewReport extends StatefulWidget {
  @override
  State<ViewReport> createState() => _MyAppState();
}

class _MyAppState extends State<ViewReport> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _suggestions = [
    'Select report duration',
    'This Month',
    'Last Month',
    'Last Week',
  ];
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _filteredSuggestions = _suggestions;
    _controller.addListener(() {
      setState(() {
        _filteredSuggestions = _suggestions
            .where((suggestion) => suggestion
            .toLowerCase()
            .contains(_controller.text.toLowerCase()))
            .toList();
      });
    });
  }

  void _showSuggestions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: _filteredSuggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: _filteredSuggestions[index] != 'Select report duration'
                    ? Icon(
                  Icons.circle,
                  size: 24.0,
                  color: Colors.blue,
                )
                    : null,
                title: Text(_filteredSuggestions[index]),
                onTap: () {
                  _controller.text = _filteredSuggestions[index];
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // This will pop the current route off the navigator stack
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              'View Report',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(
          child: ListView(
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
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(Icons.calendar_month_rounded, color: Colors.black),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Start date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 250,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(Icons.calendar_month_rounded, color: Colors.black),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'End date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 180,
                      top: 20,
                      bottom: 60,
                      width: 0.5,
                      child: Container(
                        color: Colors.brown,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 3,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          suffixIcon: InkWell(
                            onTap: () {
                              _showSuggestions(context);
                            },
                            child: Icon(Icons.arrow_drop_down, color: Colors.black),
                          ),
                        ),
                        onSubmitted: (value) {
                          // Handle search action here
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 155, // Adjust height as needed
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
                      left: 10,
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'NET BALANCE',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 250,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Icon(Icons.currency_rupee, color: Colors.red),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '0.0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 100,
                      height: 0.5,
                      child: Container(
                        color: Colors.brown,
                      ),
                    ),

                    Positioned(
                      top: 50,
                      left: 10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:43),
                                  child: Text(
                                    'ENTRIES',
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  ' 0  ENTRIES',
                                  style: TextStyle(color: Colors.black, fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),



                    // New Rows for 'you gave' and 'you got'

                    Positioned(
                      top: 50,
                      left: 280,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  'YOU GOT',
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  '₹ 0',
                                  style: TextStyle(color: Colors.green, fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 180,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  'YOU GAVE',
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  '₹ 0',
                                  style: TextStyle(color: Colors.red, fontSize: 20, ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              )

              ,
            ],
          ),
        ),
      ),
    );
  }
}

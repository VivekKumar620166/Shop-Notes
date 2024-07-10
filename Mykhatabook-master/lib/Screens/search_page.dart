import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Search());
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemList? itemList; // Declare itemList as nullable
  final TextEditingController textFieldController1 = TextEditingController();
  final TextEditingController textFieldController2 = TextEditingController();
  final TextEditingController textFieldController3 = TextEditingController();
  final TextEditingController searchController = TextEditingController(); // Controller for search field
  int newItemNumber = 1;

  get dropdownValue => null; // Track the number for new items

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String apiUrl =
        'https://dailybills.languagenectar.in/api/Itemlist?customer_id=2';
    const String authToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2RhaWx5YmlsbHMubGFuZ3VhZ2VuZWN0YXIuaW4vYXBpL3VzZXIvbG9naW4iLCJpYXQiOjE3MTk1NjA4NzAsImV4cCI6MTcyMDc3MDQ3MCwibmJmIjoxNzE5NTYwODcwLCJqdGkiOiJEUDgzcFRKQTRCMzJ3OUpWIiwic3ViIjoiMTAxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.5VPsn2wPH0da-pvK2qFOcT6tBuo2aZ0LMIPSgccmvyU'; // Your auth token

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          itemList = itemListFromJson(response.body);
        });
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Error message: ${response.body}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void addItem() {
    // Create a new item using input from text fields
    final newItem = Item(
      number: newItemNumber,
      name: textFieldController1.text,
      basePrice: textFieldController2.text,
      salePrice: textFieldController3.text,
    );

    setState(() {
      // Initialize itemList if it's null
      if (itemList == null || itemList!.data == null) {
        itemList = ItemList(data: Data(data: []));
      }

      // Add the new item to the existing list
      itemList!.data!.data!.add(newItem);
      newItemNumber++; // Increment item number for the next item
    });

    // Clear text fields after adding the item
    textFieldController1.clear();
    textFieldController2.clear();
    textFieldController3.clear();
  }

  List<Item> getFilteredItems(String query) {
    // If itemList or itemList.data is null, return an empty list
    if (itemList == null ||
        itemList!.data == null ||
        itemList!.data!.data == null) {
      return [];
    }

    // Convert query to lowercase for case-insensitive comparison
    final String lowercaseQuery = query.toLowerCase();

    // Filter items based on whether the item name contains the query
    return itemList!.data!.data!.where((item) =>
    item.name?.toLowerCase().contains(lowercaseQuery) ?? false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left:150),
          child: Text("Item",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController1,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Item Name',
                border: InputBorder.none, // Remove border line
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController2,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Item Price',
                border: InputBorder.none, // Remove border line
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textFieldController3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Choose unit',
                labelStyle: TextStyle(color: Colors.black), // Ensure label text color is visible
                border: InputBorder.none, // Remove border line
                suffixIcon: DropdownButton<String>(
                  isExpanded: true, // Set this to true to expand the dropdown width
                  value: dropdownValue, // Manage the selected value
                  onChanged: (String? newValue) {
                    // Handle dropdown value change
                  },
                  items: <String>['Pkt', 'Pcs', 'Btl', 'Cone', 'Dzn', 'Kg', 'Mtr', 'new', 'Roll'] // Example dropdown items
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),


          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: addItem,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                backgroundColor: Colors.blue, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                ),
              ),
              child: const Text(
                'Add Item',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {}); // Trigger a rebuild when the user types in the search field
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none, // Remove border line
                labelText: 'Search Items',
              ),
            ),
          ),
          Expanded(
            child: itemList == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: searchController.text.isEmpty
                  ? itemList!.data!.data!.length
                  : getFilteredItems(searchController.text).length,
              itemBuilder: (context, index) {
                final filteredList = searchController.text.isEmpty
                    ? itemList!.data!.data!
                    : getFilteredItems(searchController.text);
                final item = filteredList[index];
                return Card(
                  child: Container(
                    width:
                    MediaQuery.of(context).size.width * 0.9, // Set width to 90% of screen width
                    height: 70, // Set height of the container
                    color: Colors.white, // Set background color to white
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${item.number ?? index + 1}: ${item.name ?? 'Unnamed'}',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Added SizedBox for spacing
                          Padding(
                            padding: const EdgeInsets.only(left:50),
                            child: Text(
                              item.basePrice ?? 'Price not available',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Model classes

ItemList itemListFromJson(String str) =>
    ItemList.fromJson(json.decode(str));

class ItemList {
  ItemList({
    this.data,
  });

  Data? data;

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  Data({
    this.data,
  });

  List<Item>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: json["data"] == null
        ? null
        : List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );
}

class Item {
  Item({
    this.number,
    this.name,
    this.basePrice,
    this.salePrice,
  });

  int? number; // New property to store item number
  String? name;
  String? basePrice;
  String? salePrice;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    number: json["number"] == null ? null : json["number"],
    name: json["name"] == null ? null : json["name"],
    basePrice: json["base_price"] == null ? null : json["base_price"].toString(),
    salePrice: json["sale_price"] == null ? null : json["sale_price"].toString(),
  );
}

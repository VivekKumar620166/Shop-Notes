import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deleted Customer', style:TextStyle(fontWeight:FontWeight.w400, color:Colors.white)),
        backgroundColor: Colors.blue,
      ),
      // body: const Center(


    );
  }
}

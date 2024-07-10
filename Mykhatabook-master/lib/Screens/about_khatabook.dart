import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutKhatabook extends StatefulWidget {
  const AboutKhatabook({Key? key}) : super(key: key);

  @override
  State<AboutKhatabook> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<AboutKhatabook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left:80),
          child: const Text('About Us', style:TextStyle(fontWeight:FontWeight.w400, color:Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(


        child: Padding(
          padding: EdgeInsets.only(bottom: 650,right:180),
          child: Text(
            'Our Calculated Application',
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
        ),


      ),
    );
  }
}

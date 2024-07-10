import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left:22),
          child: const Text('Terms & Conditions', style:TextStyle(fontWeight:FontWeight.w400, color:Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
          child:Padding(
            padding: EdgeInsets.only(bottom: 440, left:20, right:40, ),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris', style:TextStyle(fontWeight:FontWeight.bold)),
          )


      ),
    );
  }
}

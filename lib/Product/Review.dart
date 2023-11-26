import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class reviewpage extends StatefulWidget {
  reviewpage({Key? key,}) : super(key: key);


  @override
  State<reviewpage> createState() => _reviewpageState();
}

class _reviewpageState extends State<reviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 40,
        color: Colors.blue,
      ),
    );
  }
}

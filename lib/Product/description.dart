import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class decriptionpage extends StatefulWidget {
   decriptionpage({Key? key, required this.description}) : super(key: key);
   final String description;

  @override
  State<decriptionpage> createState() => _decriptionpageState();
}

class _decriptionpageState extends State<decriptionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        child: Html(data: widget.description ?? "",),
      ),
    );
  }
}

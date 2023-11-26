import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';

import '../../../Models/Account/DAOInfoDetails.dart';

class InfoDetails extends StatefulWidget {
   InfoDetails({Key? key, required this.id,}) : super(key: key);
   final int id;


  @override
  State<InfoDetails> createState() => _InfoDetailsState();
}

class _InfoDetailsState extends State<InfoDetails> {
   bool loaded = false;

  @override
  void initState() {
    listdetails();
    super.initState();
  }
  Details? listdata;

   String SessionId = "";
  void listdetails() async{
    print("detail callled");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.infodetails("123", SessionId, "application/json", widget.id)
    .then((value) {
      if (value.success == 1) {
        print("success");
        listdata = value.data;
        print(JsonEncoder().convert(listdata));
      }else{
        print("failed");
      }
      setState(() {
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (!loaded) ? Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,)),
    )
     : Scaffold(
      appBar: AppBar(
        title: Text(listdata!.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child:  Html(data: listdata!.description,),
      ),
    );
  }
}

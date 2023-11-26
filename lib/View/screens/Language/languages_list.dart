import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';

import '../../../Models/Language/DAOLanguageList.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {

  bool _isChecked = false;

  void _handleCheckboxChange(bool? value) {
    if (value != null) {
      setState(() {
        _isChecked = value;
      });
    }
  }

  @override
  void initState() {
    languagelist();
    super.initState();
  }

  List<LangList> langlist = [];

  String SessionId = "";
  void languagelist() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.languages("123",SessionId, "application/json")
    .then((value) {
      if(value.success == 1){
          print("success");
          langlist.addAll(value.data!);
         print(JsonEncoder().convert(langlist));
      }else{
        print("fail");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
        actions: [
          TextButton(onPressed: ( ){},
              child: Text("Save",style: TextStyle(fontSize: 18),)),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: langlist.length,
            itemBuilder: (context, index) {
              var i = langlist[index];
              return InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder
                  //     : (context) => InfoDetails(id: i.id,)
                  // ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        i.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),),
                      Checkbox(
                        value: _isChecked,
                        onChanged: _handleCheckboxChange,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

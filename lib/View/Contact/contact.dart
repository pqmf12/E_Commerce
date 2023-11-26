import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';

import '../../Utils/InMemory.dart';

class ContactPage extends StatefulWidget {
   ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
 var txtController = TextEditingController();
 var emailController = TextEditingController();
 var msgController = TextEditingController();
  
  @override
  void initState() {
    // contactus();
    super.initState();
  }

 String SessionId = '';

  void contactus() async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print("object: ${SessionId}");
    client.contact("123", SessionId,
        jsonEncode({
          "name": txtController.text,
          "email": emailController.text,
          "enquiry": msgController.text})
    ).then((value)  {
      if(value.success == 1){
        print("successful");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("Your message has been sent")));
      }else{
        print("failed");
      }
    });
  }

 final _formKey = GlobalKey<FormState>();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        blurRadius: 2,
                        color: Colors.grey.shade400,
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Field Required";
                        }
                      },
                      controller: txtController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Name",
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.person_3_outlined,size: 18,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        blurRadius: 2,
                        color: Colors.grey.shade400,
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Field Required";
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Email",
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.email_outlined,size: 18,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        blurRadius: 2,
                        color: Colors.grey.shade400,
                      ),
                    ]
                ),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Field Required";
                        }
                        if(value!.length < 10) {
                          return "Please enter at least 10 words";
                        }
                      },
                      controller: msgController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Message",
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.message,size: 18,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // foregroundColor: Colors.white,
                  // backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder( //to set border radius to button
                      borderRadius: BorderRadius.circular(12)),// foreground (text) color
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    contactus();
                  }
                },
                child:  Text("Send",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    // color: Colors.red
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

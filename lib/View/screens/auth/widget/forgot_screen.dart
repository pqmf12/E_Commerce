import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/View/screens/auth/widget/sign_in.dart';

import '../../HomeScreen/home_screen.dart';

class Page3 extends StatefulWidget {
    Page3({Key? key,}) : super(key: key);
      // final callback;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {

  var emailController = TextEditingController();

  void forgot() {
    final client = RestClient(Dio());
    client.forgotten(json.encode({"email": emailController.text}),
        "123", "voluptate")
        .then((value) {
      if (value.success == 1) {
        print("mail sent");
        // Navigator.push(context, MaterialPageRoute(builder
        //     : (context) => HomePage()));
        showDeleteConfirmation(context);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
        Text("wrong email")));
        print("something went wrong  ?? ""}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.arrow_back_ios_outlined,
                    )),
                Text("Password Recovery",
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(""
                          "Enter the email address with your account and we'll send an email with confirmation to reset your password.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 45,),
                  Row(
                    children: [
                      Text("Email"),
                    ],
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.grey.shade400,
                          ),
                        ]
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Field Required";
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(Icons.email_outlined, size: 18,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60,),
                  Container(
                    height: 45,
                    width: 650,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          colors: [
                            Colors.pink.shade50,
                            Colors.red.shade50,
                          ],
                        )
                    ),
                    child: InkWell(
                      onTap: () {
                        forgot();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.red.shade900
                            ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Delete profile Confirmation'),
          content: Text('mail sent',
            textAlign: TextAlign.center, style:
            TextStyle(fontSize: 20,color: Colors.black),
          ),
          actions: <Widget>[

            ElevatedButton(
              child: Text('ok',
                textAlign: TextAlign.center, style:
                TextStyle(fontSize: 18),),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder
                //         : (context) => HomePage(callback: widget.callback,)));
                // Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}

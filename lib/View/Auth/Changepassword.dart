import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool canPressBtn = true;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String SessionId = "";

  void changePassword() async{
    print("change Password called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print(oldController.text);
    print(newController.text);
    client.changepswd(
        "123", SessionId,
        'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
        json.encode ({
          "password": newController.text,
          "confirm": confirmController.text,
        })).then((value) {
        if(value.success == 1){
          print("success");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Password has been changed")));
        }else{
          print("failed");
        }
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Password"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text("Your new password must be different from previously used passwards.",
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200,color: Colors.black54),
                      textAlign: TextAlign.justify,),
                  ),
                     SizedBox(height: 25,),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        // Container(
                        //   height: 55,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //             offset: Offset(1,1),
                        //             blurRadius: 2,
                        //             color: Colors.grey.shade400
                        //         ),
                        //       ]
                        //    ),
                        //   child: TextFormField(
                        //     validator: (value) {
                        //       if (value!.isEmpty) {
                        //         return 'Required field';
                        //       }
                        //       return null;
                        //     },
                        //     controller:  oldController,
                        //     obscureText: _obscureText,
                        //     decoration: InputDecoration(
                        //       border: InputBorder.none,
                        //       contentPadding: EdgeInsets.only(top: 14),
                        //       suffixIcon: GestureDetector(onTap: (){
                        //         setState(() {
                        //           _obscureText =! _obscureText;
                        //         });
                        //       },
                        //         child: Icon(_obscureText
                        //             ? Icons.visibility
                        //             : Icons.visibility_off ),),
                        //       prefixIcon: Icon(
                        //         Icons.lock_outline_rounded,
                        //       ),
                        //
                        //       hintText: "Old Password",
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 25,),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 2,
                                    color: Colors.grey.shade400
                                ),
                              ]
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required field';
                              }
                              return null;
                            },
                            controller:  newController,
                            obscureText: _obscureText1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              suffixIcon: GestureDetector(onTap: (){
                                setState(() {
                                  _obscureText1 =! _obscureText1;
                                });
                              },
                                child: Icon(_obscureText1
                                    ? Icons.visibility
                                    : Icons.visibility_off ),),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                              ),
                              hintText: "New Password",
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 2,
                                    color: Colors.grey.shade400
                                ),
                              ]
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required field';
                              }
                              if (value != newController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            controller:  confirmController,
                            obscureText: _obscureText2,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              suffixIcon: GestureDetector(onTap: (){
                                setState(() {
                                  _obscureText2 =! _obscureText2;
                                });
                              },
                                child: Icon(_obscureText2
                                    ? Icons.visibility
                                    : Icons.visibility_off ),),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                              ),
                              hintText: "Confirm Password",
                            ),
                          ),
                        ),
                        SizedBox(height: 55,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                                changePassword();
                              },
                              child:  canPressBtn
                                  ? Text(
                                "Save",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                ),
                              )
                                  : CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
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
}

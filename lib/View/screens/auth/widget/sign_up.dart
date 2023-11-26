import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'RawData.dart';

class Page2 extends StatefulWidget {
   Page2({Key? key,}) : super(key: key);
     // final callback;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confpasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;

  RawData request = RawData(
      lastname: "User1",
      firstname: "Alexa",
      confirm: "paswd",
      telephone: "1-541-754-3010",
      city: "Berlin",
      address_1: "Demos",
      country_id: 81,
      postcode: "3333",
      agree: 1,
      zone_id: 1256,
      email: "alexa@gmail.com",
      password: "paswd",
      fax: "1-541-754-3010",
      company_id: "officia sunt",
      company: "aute do cupidatat",
      address_2: "Demo",
      tax_id: 1,
      customer_group_id: 1,
      custom_field: {
        "account": {
          "1": "+364545454"
        },
        "address": {
          "4": "+364545454"
        }
      }
  );


  void signup() {
    final client = RestClient(Dio());
    client.getSignUp(json.encode(request), "voluptate", "123")
    .then((value) {
      if(value.success == 1) {
        print("signup");
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid input fields"))
        );
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 35,),
                  Row(
                    children: [
                      Text("Name"),
                    ],
                  ),
                  Container(
                    height: 50,
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
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if(value == null || value.isEmpty) {
                              return "Field Required";
                            }
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(Icons.person_outlined,size: 18,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(Icons.email_outlined,size: 18,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Password"),
                    ],
                  ),
                  Container(
                    height: 50,
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
                    child: TextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Field Required";
                        }
                      },
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.lock_outline,size: 18,),
                        suffixIcon: GestureDetector(onTap: (){
                          setState(() {
                            _obscureText =! _obscureText;
                          });
                        },
                          child: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility ,color: Colors.red.shade900,),),
                        // prefixIcon: Icon(
                        //   Icons.lock_outline_rounded,
                        // ),
                        // hintText: "Enter your password",
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text("Confirm Password"),
                    ],
                  ),
                  Container(
                    height: 50,
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
                    child: TextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty) {
                          return "Field Required";
                        }
                      },
                      controller: passwordController,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.lock_outline,size: 18,),
                        suffixIcon: GestureDetector(onTap: (){
                          setState(() {
                            _obscureText2 =! _obscureText2;
                          });
                        },
                          child: Icon(_obscureText2
                              ? Icons.visibility_off
                              : Icons.visibility ,color: Colors.red.shade900,),),
                      ),
                    ),
                  ),

                  SizedBox(height: 28,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // foregroundColor: Colors.white,
                            // backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(12)),// foreground (text) color
                          ),
                          onPressed: (){
                            // signup();
                            // Navigator.push(context, MaterialPageRoute(builder
                            //     : (context) => HomePage(callback: widget.callback,) ));
                          },
                          child:  Text("Let's Get Started",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              // color: Colors.red
                            ),),
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
    );
  }
}

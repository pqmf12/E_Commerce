import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Models/Session/session.dart';
import 'package:opencart_ecommapp1/View/Auth/signup.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/View/screens/HomeScreen/homescreen.dart';
import 'package:provider/provider.dart';
import '../../Utils/InMemory.dart';
import '../screens/auth/Auth_Provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;
  bool canPressBtn = true;

  // String SessionId = '';
  // String sessionid = '';

  // Data setn =  Data();

  // void session() {
  //   final client = RestClient(Dio());
  //   print("session called");
  //   client.Session("123", "application/json", "application/json", "voluptate")
  //       .then((value) {
  //     if(value.success == 1) {
  //       print("session success");
  //       setn = value.data!;
  //       print("Session ID: ${setn.session}");
  //       InMemory().setSession(setn.session);
  //       sessionid = setn.session;
  //       print("new sesionid ${sessionid}");
  //       login();
  //     }else{
  //       print("fail");
  //     }
  //     setState(() {});
  //   });
  // }

  // void login() async {
  //   setState(() {
  //     canPressBtn = false;
  //   });
  //   print("login called");
  //   final client = RestClient(Dio());
  //   print(emailController.text);
  //   print(passwordController.text);
  //   SessionId = await InMemory().getSession();
  //   client.getLogin(
  //       jsonEncode({ "email": emailController.text,
  //         "password": passwordController.text,}),
  //       SessionId, '123',
  //     'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
  //      )
  //       .then((value) {
  //     print("emailController.text" + emailController.text);
  //     print("passwordController.text" + passwordController.text);
  //     print("sessioid... ${SessionId}");
  //     if (value.success == 1) {
  //       InMemory().setUser(value.data!).then((value) {});
  //       print("Logged In");
  //        Navigator.pop(context);
  //        print(JsonEncoder().convert(value.data));
  //     }
  //     else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Invalid input fields"))
  //       );
  //       print("something went wrong  ?? ""}");
  //     }
  //     setState(() {
  //       canPressBtn = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login here"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:   EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Email",
                        style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.w300),),
                    ],
                  ),
                  SizedBox(height: 3,),
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
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Text("Password",
                        style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.w300),),
                    ],
                  ),
                  SizedBox(height: 3,),
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
                          print("press");
                          setState(() {
                            _obscureText =! _obscureText;
                          });
                        },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility ,color: Colors.red.shade900,),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,width: 240,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // foregroundColor: Colors.white,
                            // backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(12)),// foreground (text) color
                          ),
                          onPressed: (){
                            // session();
                            context.read<LoginProvider>().loggedin(
                                emailController.text, passwordController.text)
                                .then((value) => Navigator.pop(context));
                            setState(() {});
                          },
                          child: canPressBtn
                            ?  Text("LogIn",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              // color: Colors.red
                            ),)
                              : CircularProgressIndicator()
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,width: 40,
                        color: Colors.black,
                      ),
                      SizedBox(width: 3,),
                      Text("OR"),
                      SizedBox(width: 3,),
                      Container(
                        height: 1,width: 40,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,width: 240,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // foregroundColor: Colors.white,
                            // backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(12)),// foreground (text) color
                          ),
                          // onPressed: () async{
                          //    FacebookAuth.instance.login(
                          //      permissions: ["public_profile", "email"]
                          //    ).then((value) {
                          //      FacebookAuth.instance.getUserData().then((value) {
                          //        FacebookAuth.instance.getUserData().then((userData) async {
                          //
                          //          setState(() {
                          //            userobj = userData;
                          //          });
                          //        });
                          //      });
                          //    });
                          // },
                          onPressed: (){
                            // signInWithFacebook();
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                              Text("LogIn with Facebook",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("New User?"),
                      TextButton(onPressed: ( ){
                        Navigator.push(context, MaterialPageRoute(builder
                            : (context) => SignupPage()));
                      },
                          child: Text("Register here")),
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

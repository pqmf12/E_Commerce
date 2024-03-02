
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import '../../../../Models/Session/session.dart';
import 'forgot_screen.dart';

class Page1 extends StatefulWidget {
    Page1({Key? key, required this.callback}) : super(key: key);
       final callback;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;
  Data setn =  Data();

  // @override
  // void initState() {
  //   session();
  //   super.initState();
  // }

  String  SessionId  = "";
  
  void session() {
    final client = RestClient(Dio ());
    print("session called");
    client.Session("123", "application/json", "application/json", "voluptate")
    .then((value) {
      if(value.success == 1) {
        print("session success");
        setn = value.data!;
        print("Session ID: ${setn.session}");
           // InMemory().setSession(setn.session);
        SessionId = setn.session;
        // login();
      }else{
        print("fail");
      }
    });
  }


  //  void login() async {
  //   print("login called");
  //   final client = RestClient(Dio());
  //   print(emailController.text);
  //   print(passwordController.text);
  //   SessionId = await InMemory().getSession();
  //   client.getLogin(
  //      jsonEncode({ "email": emailController.text,
  //       "password": passwordController.text,}),
  //       SessionId, '123')
  //       .then((value) {
  //     print("setn.session" + setn.session);
  //     print("emailController.text" + emailController.text);
  //     print("passwordController.text" + passwordController.text);
  //     if (value.success == 1) {
  //       print("Logged In");
  //       // sessionID = setn.session;
  //       InMemory().setUser(value.data!).then((value) {
  //         widget.callback();
  //       });
  //     }
  //     else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Invalid input fields"))
  //       );
  //       print("something went wrong  ?? ""}");
  //       // ScaffoldMessenger.of(context).showSnackBar(
  //       //     SnackBar("${value.message ?? "Something went wrong"}"));
  //     }
  //   });
  // }

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
                  SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder
                              : (context) => Page3()));
                        },
                        child: Text("Forgot Password?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.red.shade900,
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
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
                            session();
                            // login();
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


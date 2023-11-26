import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/View/Auth/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register here"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
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
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // foregroundColor: Colors.white,
                          // backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(12)),// foreground (text) color
                        ),
                        onPressed: (){
                          // session();
                          // login();
                        },
                        child:  Text("SignUp",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            // color: Colors.red
                          ),),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered?"),
                    TextButton(onPressed: ( ){
                      Navigator.push(context, MaterialPageRoute(builder
                          : (context) => LoginPage()));
                    },
                        child: Text("Login")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

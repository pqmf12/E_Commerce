import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/View/screens/auth/widget/sign_in.dart';
import 'package:opencart_ecommapp1/View/screens/auth/widget/sign_up.dart';

class Screen extends StatefulWidget {
   Screen({Key? key, required this.callback}) : super(key: key);
       final callback;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          // Container(
          //   height: 30,
          //   child: Center(
          //     child: Image.asset("assets/Images/logo.jpg",
          //       fit: BoxFit.fill,),
          //   ),
          // ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              // border: Border.symmetric(vertical: BorderSide.none, horizontal: Border.),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Column(
                    children: [
                      Text("In association with",style: TextStyle(fontSize: 12),),
                      Container(
                        height: 30,
                        child: Center(
                          child: Image.network("https://keyword.sbs/newTab/assets/images/social-media/amazon3.png",
                            fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Text("program partner",style: TextStyle(fontSize: 12),),
                      Container(
                        height: 30,
                        child: Center(
                          child: Image.network("https://keyword.sbs/newTab/assets/images/social-media/ebay2.png",
                            fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          // Text(" Welcome Back, Please enter Your details", style: TextStyle(color: Colors.black38,fontSize: 18),),
          SizedBox(height: 20,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
            child: Container(
              // width: 230,
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 25),
                tabs: [
                  Tab(child: Text("Signin" ,style: TextStyle(fontSize: 16,),),),
                  Tab(child: Text("Signup",style: TextStyle(fontSize: 16,), ),),
                  // Tab(child: Text("Recovery" ),),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Add your pages here
                Page1(callback: widget.callback,),
                Page2(),
                // Page3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
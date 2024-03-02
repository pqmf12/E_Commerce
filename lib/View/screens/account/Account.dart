import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import 'package:opencart_ecommapp1/View/Auth/login.dart';
import 'package:opencart_ecommapp1/View/screens/Language/languages_list.dart';
import 'package:opencart_ecommapp1/View/screens/WishList/wishlist.dart';
import 'package:opencart_ecommapp1/View/screens/auth/Auth_Provider/login_provider.dart';
import 'package:provider/provider.dart';
import '../../../Models/Account/DAOInformation.dart';
import '../../../Models/Account/account.dart';
import '../../../Provider/get_profile_provider.dart';
import '../../Auth/Changepassword.dart';
import '../Language/timezone.dart';
import 'Profile.dart';
import 'edit_profile.dart';
import 'package:dio/dio.dart';
import 'list_details.dart';


class AccountPage extends StatefulWidget {
   AccountPage({Key? key,}) : super(key: key);


  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<InformationList> accountdata = [];
  bool loaded = false;

  @override
  void initState() {
    // getprofile();
    context.read<ProfileProvider>().getprofile();
    accountlist();
    super.initState();
  }

  String SessionId = "";
  void accountlist() async{
    print("list called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.information("123", SessionId, "application/json")
    .then((value) {
      if(value.success == 1){
        print("succes");
       accountdata.addAll(value.data!);
       print(JsonEncoder().convert(accountdata));
      }else{
        print("failed");
      }
      setState(() {
        loaded = true;
      });
    });
  }
  // Profile profile = Profile();

  // void getprofile() async{
  //   final client = RestClient(Dio());
  //   SessionId = await InMemory().getSession();
  //   print(":getprofile called");
  //   client.account("123", SessionId, "application/json",
  //     'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
  //   ).then((value) {
  //     if(value.success == 1) {
  //       print("successs");
  //       profile = value.data!;
  //       context.read<ProfileProvider>().getprofile();
  //       print(JsonEncoder().convert(profile));
  //       // print("sessionID ${InMemory().getSession().toString()}");
  //     }else{}
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: (!loaded)
          ? Center(child: CircularProgressIndicator())
        : Column(
          children: [
            // (InMemory.isLogged == true)
               context.read<LoginProvider>().isLogged ? Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.red[50],
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.red.shade100,
                            child: Center(
                              child:  Icon(FontAwesomeIcons.user,
                                size: 25,color: Colors.red.shade800,
                              ),
                            ),
                          ),
                          // SizedBox(width: 25,),
                          SizedBox(width: 10,),
                          Text(
                            context.watch<ProfileProvider>().profile.firstname ?? "",
                            // profile.firstname ?? " ",
                            style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),),
                          SizedBox(width: 5,),
                          Text(
                            context.watch<ProfileProvider>().profile.lastname ?? "",
                            // profile.firstname ?? " ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade500),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.cube,color: Colors.red.shade800,),
                                SizedBox(width: 10,),
                                Text("Order",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context) => WishListPage()));
                          },
                          child: Container(
                            height: 40,width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.heart,color: Colors.red.shade800,),
                                SizedBox(width: 10,),
                                Text("Wishlist",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder
                            : (context) => EditPage(
                          first_name: context.read<ProfileProvider>().profile.firstname ?? "",
                          last_name:  context.read<ProfileProvider>().profile.lastname ?? "",
                          email:  context.read<ProfileProvider>().profile.email ?? "",
                          phone:  context.read<ProfileProvider>().profile.telephone ?? "",
                        )));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Edit Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),),
                            Icon(Icons.arrow_right_outlined),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => Changepassword()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Change Password",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),),
                            Icon(Icons.arrow_right_outlined),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
             : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Login to Show your details",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder
                      : (context) => LoginPage()));
                  setState(() {});
                },
                    child: Text("Login"))
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                (context) => LanguageList()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Language",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),),
                    Icon(Icons.arrow_right_outlined),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => Timezonepage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Timezone",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),),
                    Icon(Icons.arrow_right_outlined),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: accountdata.length,
                  itemBuilder: (context, index) {
                    var i = accountdata[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder
                            : (context) => InfoDetails(id: i.id,)
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(i.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),),
                             Icon(Icons.arrow_right_outlined),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )
      ),
    );
  }
}

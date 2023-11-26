import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import 'package:opencart_ecommapp1/View/screens/Language/languages_list.dart';
import '../../../Models/Account/DAOInformation.dart';
import '../Language/timezone.dart';
import 'Profile.dart';
import 'edit_profile.dart';
import 'package:dio/dio.dart';
import 'list_details.dart';


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<InformationList> accountdata = [];

  @override
  void initState() {
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
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
              InkWell(
                onTap: () {
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red.shade50,
                        child: Center(
                          child:  Icon(FontAwesomeIcons.user,
                            size: 25,color: Colors.red.shade800,
                          ),
                        ),
                      ),
                      SizedBox(width: 25,),
                      Text("Alex",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),),
                      SizedBox(width: 165,),
                      IconButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder
                            : (context) => ProfilePage()
                        ));
                      },
                          icon: Icon(Icons.arrow_right_outlined)),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 25,),
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
        ),
      ),
    );
  }
}

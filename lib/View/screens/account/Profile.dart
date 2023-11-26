import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import '../../../Models/Account/account.dart';
import '../../../Models/RestApiClient.dart';
import '../../../Models/Session/session.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Delete profile Confirmation'),
          content: Text('Are you sure you want to Delete Profile?',
            textAlign: TextAlign.center,style:
            TextStyle(fontSize: 16,),
          ),
          actions: <Widget>[

            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Close the dialog
              },
            ),
            SizedBox(width: 60,),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getprofile();
    super.initState();
  }

  // String session = "";

  // void printSession() async {
  //   session = await InMemory().getSession();
  //   print("Session Value: $session");
  // }


  Profile profile = Profile();

  String SessionId = "";

  void getprofile() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(":getprofile called");
    client.account("123", SessionId!, "application/json")
    .then((value) {
      if(value.success == 1) {
       print("successs");
       profile = value.data!;
       // print("sessionID ${InMemory().getSession().toString()}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
                Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child:
                          CircleAvatar(
                            radius: 80,
                            // child: Icon(Icons.person),
                            // backgroundColor:Colors.,
                            backgroundImage:
                            NetworkImage("https://www.homeaway.com/bizops/travelerHome/picturePublicPathByAccount?accountUuid=2da8b4c8-43a6-4c0a-b039-35e0f48c8c66&pictureSize=large")
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                             profile.firstname ?? "alex",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Container(
                          child: Text(
                           profile.email ?? "alex@gmail.com",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined,color:  Colors.grey),
                              SizedBox(height: 5,),
                              Text(
                                "Lowa",
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                "  |  ",
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                "California",
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(12)),// foreground (text) color
                          ),
                          onPressed: () {
                            showDeleteConfirmation(context);
                          },
                          child:  Text("Delete Profile?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                            ),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}


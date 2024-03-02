import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/get_profile_provider.dart';
import 'edit_profile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileProvider>().getprofile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder
                : (context) => EditPage(
              first_name: context.read<ProfileProvider>().profile.firstname ?? "",
              last_name:  context.read<ProfileProvider>().profile.lastname ?? "",
            email:  context.read<ProfileProvider>().profile.email ?? "",
              phone:  context.read<ProfileProvider>().profile.telephone ?? "",
            )));
          }, child: Text("Edit"))
        ],
        elevation: 0,
      ),
        body: (context.read<ProfileProvider>().loaded)
       ? SingleChildScrollView(
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
                              child: CircleAvatar(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    context.read<ProfileProvider>().profile.firstname ?? "",
                                     // profile.firstname ?? " ",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    context.read<ProfileProvider>().profile.lastname ?? "",
                                    // profile.email ?? " ",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Text(
                                context.read<ProfileProvider>().profile.email ?? "",
                                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on_outlined,color:  Colors.grey),
                                  SizedBox(height: 5,),
                                  Text(
                                    context.read<ProfileProvider>().profile.telephone ?? "",
                                    // profile.telephone ?? " ",
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    "  |  ",
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    context.read<ProfileProvider>().profile.fax ?? "",
                                    // profile.fax ?? " ",
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
                    ],
                  ),
                ],
              ),
            )
      : Center(child: CircularProgressIndicator())
    );
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SizedBox(
// width: 280,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder( //to set border radius to button
// borderRadius: BorderRadius.circular(12)),// foreground (text) color
// ),
// onPressed: () {
// showDeleteConfirmation(context);
// },
// child:  Text("Delete Profile?",
// style: TextStyle(
// fontWeight: FontWeight.w500,
// fontSize: 17,
// ),),
// ),
// )
// ],
// ),
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

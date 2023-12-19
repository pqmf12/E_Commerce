import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/AppConstants.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';

import '../../../Models/Account/account.dart';

class EditPage extends StatefulWidget {
   EditPage({Key? key,
     this.callback, this.first_name, this.last_name,
     this.phone, this.email}) : super(key: key);
   final callback;
   final first_name;
   final last_name;
   final phone;
   final email;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  File? pickedImage;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  void imagePickerOption() {
    showDialog (context: context, builder: (context) =>  Dialog(
      child:  ClipRRect(
        borderRadius:  BorderRadius.all(Radius.circular(12.0)
          // topLeft: Radius.circular(10.0),
          // topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 160, width: 100,
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Select Photo From",
                  style: GoogleFonts.rubik(fontSize: 20,fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                        // Navigator.pop(context);
                      },
                      icon:  Icon(Icons.camera),
                      label: Text("CAMERA",
                        style: GoogleFonts.rubik(),
                      ),
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.image),
                      label: Text("GALLERY",
                        style: GoogleFonts.rubik(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  Future<void> pickImage(ImageSource imageType) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? photo = await _picker.pickImage(source: imageType, imageQuality: 50,);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        print('ImageResolve: ${tempImage.resolveSymbolicLinks()}');
        pickedImage = tempImage;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Future<void> selectDate(BuildContext context) async {
  //   DateTime currentDate = DateTime.now();
  //
  //   DateTime? selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: currentDate,
  //     firstDate: currentDate.subtract(Duration(days: 365)), // One year ago from now
  //     lastDate: currentDate.add(Duration(days: 365)), // One year from now
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.light().copyWith(
  //           primaryColor: Colors.blue, // Set the primary color of the date picker header
  //           hintColor: Colors.blue, // Set the accent color of the buttons
  //           colorScheme: ColorScheme.light(primary: Colors.blue), // Set the colors for the buttons
  //           buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Set the button text color
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (selectedDate != null && selectedDate != currentDate) {
  //     // Date selected
  //     // You can format and use the selected date as needed
  //     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
  //     dobController.text = formattedDate;
  //   }
  // }

  final _formKey = GlobalKey<FormState>();
  String? Statecode = "Madhaya Paradesh";
  String? Citycode = "Balaghat";
  String dropdownvalue2 = "Madhaya Paradesh";
  // String val = "Select State";
  List state = [
    "M.P.",
    "C.G.",
    "J.D.",
  ];
  var listofStates = [];
  var listofstatecode = [];
  bool loaded = false;
  String dropdownvalue3 = "Balaghat";
  List  city = [
    "Durg",
    "Bhilai",
    "JAbalpur",
    "Balaghat",
  ];
  var listofcity = [];
  var listofcitycode = [];
  // var listofstateCode = [];
  bool canPressBtn = true;
  String SessionId = "";

  @override
   void initState() {
     super.initState();
     firstnameController.text = widget.first_name ?? "";
     lastnameController.text = widget.last_name ?? "";
     emailController.text = widget.email ?? "";
     telephoneController.text = widget.phone ?? "";
   }

  Future<void> update() async {
    print("Update called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.update_profile("123", SessionId, "application/json",
        'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
        json.encode({
          "firstname":  firstnameController.text,
          "lastname": lastnameController.text,
          "email": emailController.text,
          "telephone": telephoneController.text,
        })
    ).then((value) {
      if (value.success == 1){
        print("object");
        // Profile profile = Profile();
        widget.callback();
        Navigator.pop(context);
      }else{}
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update your Profile",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
        elevation: 0,
        // centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  child: Stack(
                    children: [
                      SizedBox(height: 30,),
                      ClipOval(
                          child:  pickedImage != null? Image.file(
                            pickedImage!,
                            // pickedImage!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          )
                              : Image.network(
                            "https://www.homeaway.com/bizops/travelerHome/picturePublicPathByAccount?accountUuid=2da8b4c8-43a6-4c0a-b039-35e0f48c8c66&pictureSize=large",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,)
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        height: 40,
                        child: InkWell(
                          onTap: (){
                            imagePickerOption();
                          },
                          child: SizedBox(
                            height: 60, width: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.pink.shade50,
                              radius: 12,
                              child: Icon(Icons.add_a_photo_outlined,
                                size: 25, color: Colors.red.shade900,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("First Name"),
                          ],
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 2,
                                    color: Colors.grey
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
                            controller: firstnameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "First Name",

                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Last Name"),
                          ],
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 1,
                                    color: Colors.grey
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
                            controller: lastnameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "Last Name"
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Email"),
                          ],
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 1,
                                    color: Colors.grey
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
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "Last Name"
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Telephone"),
                          ],
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1,1),
                                    blurRadius: 1,
                                    color: Colors.grey
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
                            controller: telephoneController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "Last Name"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        update();
                      }
                    },
                    child: Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
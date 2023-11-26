import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';


class EditPage extends StatefulWidget {
   EditPage({Key? key}) : super(key: key);


  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  File? pickedImage;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Personal Details : ",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 18,),
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
                            Text("DOB"),
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
                            controller: dobController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = "";
                                // DateFormat('dd/MM/yyyy').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dobController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate = "";
                                    // DateFormat('dd-MM-yyyy').format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dobController.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                                icon: Icon(Icons.arrow_drop_down_outlined),),
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "DOB"
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Address : ",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 18,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Street Address"),
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
                            controller: addressController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "Street Address"
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),

                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("State"),
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
                          // child:
                          // DropdownButton<String>(
                          //     underline: Container(),
                          //     isExpanded: true,
                          //     value:  dropdownvalue2 ,
                          //     hint: Text("Select State"),
                          //     style:  TextStyle(color: Colors.black),
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         dropdownvalue2 = newValue!;
                          //         print("value: "+newValue);
                          //       });
                          //     },
                          //     items: [
                          //       DropdownMenuItem(
                          //         value: "",
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Text("Select State"),
                          //         ),
                          //       ),
                          //       ...listofStates.map<DropdownMenuItem<String>>((value) {
                          //         return DropdownMenuItem(
                          //           value: value,
                          //           child: Padding(
                          //             padding:  EdgeInsets.all(8.0),
                          //             child: Padding(
                          //               padding: const EdgeInsets.all(8.0),
                          //               child: Text(value),
                          //             ),
                          //           ),
                          //         );
                          //       }).toList(),
                          //     ]
                          // ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("City"),
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
                          // child: DropdownButton<String>(
                          //   isExpanded: true,
                          //   value: dropdownvalue3,
                          //   // icon:  Icon(Icons.arrow_drop_down_sharp,color:  Color(0xFF9E32DD),),
                          //   // elevation: 16,
                          //   hint: Text("Select City"),
                          //   style:  TextStyle(color: Colors.black),
                          //   underline: Container(),
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownvalue3 = newValue!;
                          //       print("value: "+newValue);
                          //         });
                          //   },
                          //   items:  listofcity.map<DropdownMenuItem<String>>((value) {
                          //     return DropdownMenuItem(
                          //       value: value,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Text(value,style: TextStyle(color: Colors.black),),
                          //         ),
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),
                        ),
                        // Container(
                        //   height: 66,
                        //   width: 450,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //             offset: Offset(1,1),
                        //             blurRadius: 1,
                        //             color: Colors.grey
                        //         ),
                        //       ]
                        //   ),
                        //   margin: EdgeInsets.symmetric(horizontal: 12),
                        //   child: Column(
                        //     // mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           SizedBox(width: 15,),
                        //           Text("City",style: TextStyle(fontSize:12, color: Colors.grey.shade700),),
                        //         ],
                        //       ),
                        //       DropdownButton<String>(
                        //         isExpanded: true,
                        //         value: dropdownvalue3,
                        //         // icon:  Icon(Icons.arrow_drop_down_sharp,color:  Color(0xFF9E32DD),),
                        //         // elevation: 16,
                        //         hint: Text("Select City"),
                        //         style:  TextStyle(color: Colors.black),
                        //         underline: Container(),
                        //         onChanged: (String? newValue) {
                        //           setState(() {
                        //             dropdownvalue3 = newValue!;
                        //             print("value: "+newValue);
                        //             String Statecode = (listofstatecode.elementAt(listofcity.indexOf(newValue)));
                        //             print(Statecode);
                        //             print(listofstatecode);
                        //             print(listofcity);
                        //             Citycode = listofcitycode.elementAt(listofcity.indexOf(newValue));
                        //           });
                        //           // final selectedStateId = getStateId(newValue);
                        //           // This is called when the user selects an item.
                        //           // setState(() {
                        //           //   selectedItem = newValue!;
                        //           //   SelectDistricts != null;
                        //           //   print("value: "+newValue);
                        //           //   String StateId = (listofStatesId.elementAt(listofStates.indexOf(newValue)));
                        //           //   DistrictList(StateId);
                        //           //   print(listofStatesId);
                        //           //   print(listofStates);
                        //           //   print(listofStatesId.elementAt(listofStates.indexOf(newValue)));
                        //           //   print(StateId);
                        //           // });
                        //         },
                        //         items:  listofcity.map<DropdownMenuItem<String>>((value) {
                        //           return DropdownMenuItem(
                        //             value: value,
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Text(value),
                        //             ),
                        //           );
                        //         }).toList(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   height: 55,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       boxShadow: [
                        //         BoxShadow(
                        //             offset: Offset(1,1),
                        //             blurRadius: 2,
                        //             color: Colors.grey
                        //         ),
                        //       ]
                        //   ),
                        //   child: TextFormField(
                        //     controller: cityController,
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                        //         labelText: "City"
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Zip Code"),
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
                            controller: zipController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                              // labelText: "Zip Code"
                            ),
                          ),
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
                                  if (_formKey.currentState!.validate()) {
                                  }
                                },
                                child:  Text("Save",
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
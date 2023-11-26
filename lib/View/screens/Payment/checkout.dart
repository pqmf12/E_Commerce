import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? gender;
  bool visibility = false;
  bool visibility1 = false;
  bool visibility2 = false;
  bool visibility3 = false;
  bool visibility4 = false;
  bool visibility5 = false;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proceed to Pay"),
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.rectangle,
                        // border: Border.all(color: Colors.lime.shade900,),
                      ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                                     padding:  EdgeInsets.only(top: 6,left: 12),
                                     child: Text("Customer Details",
                                     style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                                   ),
                           Icon(Icons.arrow_drop_down_outlined),
                       ],
                     ),),
                  ),
                SizedBox(height: 15,),
                Visibility(
                  visible: visibility,
                  child: CustomerDetails(
                    firstnameController: firstnameController,
                    lastnameController: lastnameController,),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visibility1 = !visibility1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                      // border: Border.all(color: Colors.lime.shade900,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6,left: 12),
                          child: Text("Delivery Details",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Visibility(
                    visible: visibility1,
                    child: DeliveryDetails(
                        addressController: addressController,
                        zipController: zipController)),
                InkWell(
                  onTap: () {
                    setState(() {
                      visibility5 = !visibility5;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                      // border: Border.all(color: Colors.lime.shade900,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6,left: 12),
                          child: Text("Billing Details",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: visibility5,
                    child: BillingDetails(
                        addressController: addressController,
                        zipController: zipController)),
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    setState(() {
                      visibility2 = !visibility2;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                      // border: Border.all(color: Colors.lime.shade900,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6,left: 12),
                          child: Text("Payment Method",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Visibility(
                  visible: visibility2,
                    child: paymentMethod()),
                InkWell(
                  onTap: () {
                    setState(() {
                      visibility3 = !visibility3;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                      // border: Border.all(color: Colors.lime.shade900,),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 6,left: 12),
                          child: Text("Order Summary",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.black),),
                        ),
                        Icon(Icons.arrow_drop_down_outlined),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Visibility(
                  visible: visibility3,
                    child: OrderSummary()),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 350,
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
                        child:  Text("Make Payment",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            // color: Colors.red
                          ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container paymentMethod() {
    return Container(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text("Case On Delivery",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "On Delivery",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("UPI",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "UPI",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Credit Card",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "Credit Card",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Debit Card",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "other",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Net Banking",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "Banking",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Pay Later",
                        style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),),
                      value: "Pay",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                Text("₹ 3,900", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                Text("₹ 100", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 20,color: Colors.black),),
                  Text("₹ 4000",
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 20,color: Colors.black),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({
    super.key,
    required this.addressController,
    required this.zipController,
  });

  final TextEditingController addressController;
  final TextEditingController zipController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10,),
              Text("Street Address",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
              ],
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
              Text("State",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("City",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("Zip Code",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
        ],
      ),
    );
  }
}

class BillingDetails extends StatefulWidget {
  const BillingDetails({
    super.key,
    required this.addressController,
    required this.zipController,
  });

  final TextEditingController addressController;
  final TextEditingController zipController;

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('same as above',
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("Street Address",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),
              ),
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
              ],
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required field';
                }
                return null;
              },
              controller: widget.addressController,
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
              Text("State",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("City",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text("Zip Code",
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
              controller: widget.zipController,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15,left: 15.0),
                // labelText: "Zip Code"
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({
    super.key,
    required this.firstnameController,
    required this.lastnameController,
  });

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 18,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text("Full Name",
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
                Text("Email",
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
                Text("Password",
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
                Text("Phone Number",
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
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
          ],
        ),
      ),
    );
  }
}

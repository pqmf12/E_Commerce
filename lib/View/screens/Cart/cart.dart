import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/Cart/GetCart.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    cartitems();
    super.initState();
  }

  List<AddItem> cartlist = [];
  List<ProductList> products = [];

  String SessionId = "";
  void cartitems() async{
    print("cart called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print("cart called succefully");
    client.getcart("123",
        SessionId,
        "application/json")
    .then((value) async {
      if(value.success == 1){
        print("success");
        print(SessionId);
        // print(productResponse.data.products[0].name);
        // cartlist = value.data!;
        // cartlist.addAll(value.data!);
        cartlist.clear();
        for (var i in value.data!) {
          products.addAll(i.products!);
          print(JsonEncoder().convert(i.products!));
        }
        // products.addAll(cartlist.first.products!);
        print(JsonEncoder().convert(value.data));

        print(JsonEncoder().convert(cartlist));
      }
      else{
        print("fail");
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 150 ,),
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           decoration: BoxDecoration(
          //             gradient: LinearGradient(
          //               colors:  [
          //                 Colors.pink.shade50,
          //                 Colors.white,
          //                 Colors.pink.shade50,
          //               ],
          //             ),
          //           ),
          //           height: MediaQuery.of(context).size.height,
          //           width: double.infinity,
          //           child: ListView.builder(
          //           scrollDirection: Axis.vertical,
          //           itemCount: 12,
          //           itemBuilder: (BuildContext context,int index) {
          //             // var i = products[index];
          //             return SingleChildScrollView(
          //               child: Row(
          //                 children: [
          //                   Column(
          //                     children: [
          //                       Container(
          //                         height: 220,
          //                         width: 160,
          //                         decoration: BoxDecoration(
          //                           border: Border.all(color: Colors.lime.shade900),
          //                         ),
          //                         margin: EdgeInsets.all(12),
          //                         child:  Padding(
          //                           padding: const EdgeInsets.all(6.0),
          //                           child: Image.asset(
          //                             "assets/images/background.jpg", // Replace with the image path
          //                             fit: BoxFit.cover,
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Padding(
          //                     padding: EdgeInsets.symmetric( vertical: 16),
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         Text("GANESHA MURTI",
          //                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          //                         SizedBox(height: 20,),
          //                         Text("Product Code: VH 120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //                         SizedBox(height: 8,),
          //                         Text("Price : ₹ 3,999", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //                         SizedBox(height: 58,),
          //                         Row(
          //                           children: [
          //                             Container(
          //                               height: 40,
          //                               width: 70,
          //                               decoration: BoxDecoration(
          //                                   borderRadius: BorderRadius.circular(6.0),
          //                                   color: Colors.red.shade50,
          //                                   border: Border.all(color: Colors.lime.shade900)
          //                               ),
          //                               child: Row(
          //                                 mainAxisAlignment: MainAxisAlignment.center,
          //                                 children: [
          //                                   Text("Qty:  1"),
          //                                   Icon(Icons.arrow_drop_down_outlined),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(width: 8,),
          //                             ElevatedButton(
          //                               style: ElevatedButton.styleFrom(
          //                                   shape: RoundedRectangleBorder(borderRadius:
          //                                   BorderRadius.circular(6.0),),
          //                                   side: BorderSide(color: Colors.lime.shade900)
          //                               ),
          //                               onPressed: () {},
          //                               child:  Text("Remove"),
          //                             ),
          //                           ],
          //                         ),
          //
          //                       ],
          //                     ),
          //                   ),
          //
          //                 ],
          //               ),
          //             );
          //           }
          //           ),
          //         ),
          //         // Container(
          //         //   decoration: BoxDecoration(
          //         //     gradient: LinearGradient(
          //         //       colors:  [
          //         //         Colors.pink.shade50,
          //         //         Colors.white,
          //         //         Colors.pink.shade50,
          //         //       ],
          //         //     ),
          //         //   ),
          //         //   height: 280,
          //         //   width: double.infinity,
          //         //   child: Row(
          //         //     children: [
          //         //       Column(
          //         //         children: [
          //         //           Container(
          //         //             height: 220,
          //         //             width: 160,
          //         //             decoration: BoxDecoration(
          //         //               border: Border.all(color: Colors.lime.shade900),
          //         //             ),
          //         //             margin: EdgeInsets.all(12),
          //         //             child:  Padding(
          //         //               padding: const EdgeInsets.all(6.0),
          //         //               child: Image.asset(
          //         //                 "assets/images/delivery.png", // Replace with the image path
          //         //                 fit: BoxFit.cover,
          //         //               ),
          //         //             ),
          //         //           ),
          //         //         ],
          //         //       ),
          //         //       Padding(
          //         //         padding: EdgeInsets.symmetric( vertical: 16),
          //         //         child: Column(
          //         //           mainAxisAlignment: MainAxisAlignment.start,
          //         //           children: [
          //         //             Text("Ceramic Doll",
          //         //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          //         //             SizedBox(height: 20,),
          //         //             Text("Product Code: VH 220", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //         //             SizedBox(height: 8,),
          //         //             Text("Price :₹ 1,999", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //         //             SizedBox(height: 58,),
          //         //             Row(
          //         //               children: [
          //         //                 Container(
          //         //                   height: 40,
          //         //                   width: 70,
          //         //                   decoration: BoxDecoration(
          //         //                       borderRadius: BorderRadius.circular(6.0),
          //         //                       color: Colors.red.shade50,
          //         //                       border: Border.all(color: Colors.lime.shade900)
          //         //                   ),
          //         //                   child: Row(
          //         //                     mainAxisAlignment: MainAxisAlignment.center,
          //         //                     children: [
          //         //                       Text("Qty:  1"),
          //         //                       Icon(Icons.arrow_drop_down_outlined),
          //         //                     ],
          //         //                   ),
          //         //                 ),
          //         //                 SizedBox(width: 8,),
          //         //                 ElevatedButton(
          //         //                   style: ElevatedButton.styleFrom(
          //         //                       shape: RoundedRectangleBorder(borderRadius:
          //         //                       BorderRadius.circular(6.0),),
          //         //                       side: BorderSide(color: Colors.lime.shade900)
          //         //                   ),
          //         //                   onPressed: () {},
          //         //                   child:  Text("Remove"),
          //         //                 ),
          //         //               ],
          //         //             ),
          //         //
          //         //           ],
          //         //         ),
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //         // Container(
          //         //   decoration: BoxDecoration(
          //         //     gradient: LinearGradient(
          //         //       colors:  [
          //         //         Colors.pink.shade50,
          //         //         Colors.white,
          //         //         Colors.pink.shade50,
          //         //       ],
          //         //     ),
          //         //   ),
          //         //   height: 280,
          //         //   width: double.infinity,
          //         //   child: Row(
          //         //     children: [
          //         //       Column(
          //         //         children: [
          //         //           Container(
          //         //             height: 220,
          //         //             width: 160,
          //         //             decoration: BoxDecoration(
          //         //               border: Border.all(color: Colors.lime.shade900),
          //         //             ),
          //         //             margin: EdgeInsets.all(12),
          //         //             child:  Padding(
          //         //               padding: const EdgeInsets.all(6.0),
          //         //               child: Image.asset(
          //         //                 "assets/images/edit.png", // Replace with the image path
          //         //                 fit: BoxFit.cover,
          //         //               ),
          //         //             ),
          //         //           ),
          //         //         ],
          //         //       ),
          //         //       Padding(
          //         //         padding: EdgeInsets.symmetric( vertical: 16),
          //         //         child: Column(
          //         //           mainAxisAlignment: MainAxisAlignment.start,
          //         //           children: [
          //         //             Text("Horse Wall Frame",
          //         //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          //         //             SizedBox(height: 20,),
          //         //             Text("Product Code: VH 132", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //         //             SizedBox(height: 8,),
          //         //             Text("Price : ₹ 3,899", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          //         //             SizedBox(height: 58,),
          //         //             Row(
          //         //               children: [
          //         //                 Container(
          //         //                   height: 40,
          //         //                   width: 70,
          //         //                   decoration: BoxDecoration(
          //         //                       borderRadius: BorderRadius.circular(6.0),
          //         //                       color: Colors.red.shade50,
          //         //                       border: Border.all(color: Colors.lime.shade900)
          //         //                   ),
          //         //                   child: Row(
          //         //                     mainAxisAlignment: MainAxisAlignment.center,
          //         //                     children: [
          //         //                       Text("Qty:  1"),
          //         //                       Icon(Icons.arrow_drop_down_outlined)
          //         //                     ],
          //         //                   ),
          //         //                 ),
          //         //                 SizedBox(width: 8,),
          //         //                 ElevatedButton(
          //         //                   style: ElevatedButton.styleFrom(
          //         //                       shape: RoundedRectangleBorder(borderRadius:
          //         //                       BorderRadius.circular(6.0),),
          //         //                       side: BorderSide(color: Colors.lime.shade900)
          //         //                   ),
          //         //                   onPressed: () {},
          //         //                   child:  Text("Remove"),
          //         //                 ),
          //         //               ],
          //         //             ),
          //         //
          //         //           ],
          //         //         ),
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //         // Divider(),
          //         // SizedBox(height: 6,),
          //         // Row(
          //         //   children: [
          //         //     Text("  COUPONS"),
          //         //   ],
          //         // ),
          //         // Row(
          //         //   children: [
          //         //     Text("  Best Coupon For You",style: TextStyle(fontWeight: FontWeight.w600,
          //         //         fontSize: 16,color: Colors.black),),
          //         //     SizedBox(width: 70,),
          //         //     Text("All Coupons",style: TextStyle(fontWeight: FontWeight.w300,
          //         //         fontSize: 16,color: Colors.red.shade800),),
          //         //     IconButton(onPressed: () {},
          //         //         icon: Icon(Icons.arrow_forward_ios_outlined,size: 12,color: Colors.red.shade800,)),
          //         //   ],
          //         // ),
          //         // Container(
          //         //   height: 150,
          //         //   decoration: BoxDecoration(
          //         //     border: Border.all(color: Colors.lime.shade800),
          //         //     borderRadius: BorderRadius.circular(8.0),
          //         //   ),
          //         //   margin: EdgeInsets.all(10.0),
          //         //   child: Column(
          //         //     children: [
          //         //       SizedBox(height: 12,),
          //         //       Row(
          //         //         children: [
          //         //           SizedBox(width: 10,),
          //         //           Text("Extra ₹ 201 Off",
          //         //             style: TextStyle(fontWeight: FontWeight.w600,
          //         //                 fontSize: 14,color: Colors.black),),
          //         //         ],
          //         //       ),
          //         //       SizedBox(height: 8,),
          //         //       Row(
          //         //         children: [
          //         //           SizedBox(width: 10,),
          //         //           Text("₹ 200 off on minimum purchase of ₹ 799",
          //         //             style: TextStyle(fontWeight: FontWeight.w300,
          //         //                 fontSize: 13,color: Colors.black),)
          //         //         ],
          //         //       ),
          //         //       SizedBox(height: 16,),
          //         //       Row(
          //         //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         //         children: [
          //         //           Container(
          //         //             height: 40,width: 80,
          //         //             // color: Colors.cyan,
          //         //             decoration: BoxDecoration(
          //         //                 border: Border.all(color: Colors.lime.shade600)
          //         //             ),
          //         //             child: Center(child: Text("KASHA200")),
          //         //           ),
          //         //           ElevatedButton(
          //         //               style: ElevatedButton.styleFrom( //<-- SEE HERE
          //         //                 side: BorderSide(
          //         //                   color: Colors.red.shade800,
          //         //                 ),
          //         //                 shape: RoundedRectangleBorder(
          //         //                     borderRadius: BorderRadius.circular(8.0)),
          //         //               ),
          //         //               onPressed: ( ){},
          //         //               child: Text("LOGIN"))
          //         //         ],
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //         // SizedBox(height: 26,),
          //         // Row(
          //         //   children: [
          //         //     Text("  PRICE DETAILS (3 Items)",style: TextStyle(fontWeight: FontWeight.w600,
          //         //         fontSize: 14, color: Colors.black),),
          //         //   ],
          //         // ),
          //         // SizedBox(height: 16,),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //   children: [
          //         //     Text("  Total MRP",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //     Text("₹ 6899  ",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //   ],
          //         // ),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //   children: [
          //         //     Text("  Discount on MRP",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //     Text("₹ 800  ",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //   ],
          //         // ),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //   children: [
          //         //     Text("  Convenience Fee",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //     Text("₹ 99  ",style: TextStyle(fontWeight: FontWeight.w300,
          //         //       fontSize: 16, ),),
          //         //   ],
          //         // ),
          //         // SizedBox(height: 16,),
          //         // Divider(),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //   children: [
          //         //     Text("  Total Amount",style: TextStyle(fontWeight: FontWeight.w600,
          //         //       fontSize: 16, ),),
          //         //     Text("₹ 6000  ",style: TextStyle(fontWeight: FontWeight.w600,
          //         //       fontSize: 16, ),),
          //         //   ],
          //         // ),
          //         // SizedBox(height: 16,),
          //         // Container(
          //         //   height: 120,
          //         //   color: Colors.grey.shade100,
          //         //   child: SingleChildScrollView(
          //         //     child: Padding(
          //         //       padding:  EdgeInsets.all(14.0),
          //         //       child: Row(
          //         //         // mainAxisAlignment: MainAxisAlignment.center,
          //         //         children: [
          //         //           Column(
          //         //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //             children: [
          //         //               Image.asset("assets/icons/original.jpg",height: 40,width: 40,),
          //         //               SizedBox(height: 10,),
          //         //               Text("Genuine Products",style: TextStyle(color: Colors.black45,
          //         //                 fontSize: 12,),),
          //         //             ],
          //         //           ),
          //         //           Padding(
          //         //             padding: const EdgeInsets.all(8.0),
          //         //             child: Column(
          //         //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         //               children: [
          //         //                 Image.asset("assets/images/delivery.png",height: 40,width: 40,),
          //         //                 SizedBox(height: 10,),
          //         //                 Text("Contactless Delivery",style: TextStyle(color: Colors.black45,
          //         //                   fontSize: 12,),),
          //         //               ],
          //         //             ),
          //         //           ),
          //         //           Column(
          //         //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         //             children: [
          //         //               Image.asset("assets/images/paypal.png",height: 40,width: 40,),
          //         //               SizedBox(height: 10,),
          //         //               Text("Secure Payments",style: TextStyle(color: Colors.black45,
          //         //                 fontSize: 12,),),
          //         //             ],
          //         //           ),
          //         //         ],
          //         //       ),
          //         //     ),
          //         //   ),
          //         // ),
          //       ],
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder:
                    //     (contex) => CheckOutPage() ));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.lime.shade900,)
                    ),
                    width: double.infinity,
                    child: Center(child: Text('Checkout',
                        style: TextStyle(fontSize: 18,color: Colors.black))),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder:
                    //     (context) =>  HomePage()
                    // ));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.lime.shade900,)
                    ),
                    width: double.infinity,
                    child: Center(child: Text('Continue Shopping',
                      style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.center,)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

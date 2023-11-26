import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               colors:  [
      //                 Colors.red.shade50,
      //                 Colors.lime.shade50,
      //                 Colors.pink.shade50,
      //               ],
      //             ),
      //           ),
      //           height: 250,
      //           width: double.infinity,
      //           child: Row(
      //             children: [
      //               SizedBox(height: 18,),
      //               Column(
      //                 children: [
      //                   Container(
      //                     height: 220,
      //                     width: 160,
      //                     decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.lime.shade900),
      //                     ),
      //                     margin: EdgeInsets.all(12),
      //                     child:  Image.asset(
      //                       "assets/Products/fabric/bag.jpg", // Replace with the image path
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.symmetric( vertical: 16),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     // Text("Ordered Product",
      //                     //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      //                     SizedBox(height: 20,),
      //                     Text("Hand Bag",
      //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      //                     Text("Product Code: VH 120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 8,),
      //                     Text("Price : ₹ 3,999", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 58,),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           height: 40,
      //                           width: 170,
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(6.0),
      //                               color: Colors.red.shade50,
      //                               border: Border.all(color: Colors.lime.shade900)
      //                           ),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Text("View Details"),
      //                               CircleAvatar(
      //                                   backgroundColor: Colors.lime.shade900,
      //                                   radius: 12,
      //                                   child: Icon(Icons.arrow_forward_ios_rounded,size: 16,
      //                                     color: Colors.white,)),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               colors:  [
      //                 Colors.red.shade50,
      //                 Colors.lime.shade50,
      //                 Colors.pink.shade50,
      //               ],
      //             ),
      //           ),
      //           height: 250,
      //           width: double.infinity,
      //           child: Row(
      //             children: [
      //               SizedBox(height: 18,),
      //               Column(
      //                 children: [
      //                   Container(
      //                     height: 220,
      //                     width: 160,
      //                     decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.lime.shade900),
      //                     ),
      //                     margin: EdgeInsets.all(12),
      //                     child:  Image.asset(
      //                       "assets/Products/Wooden/COW.jpeg", // Replace with the image path
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.symmetric( vertical: 16),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     // Text("Ordered Product",
      //                     //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      //                     SizedBox(height: 20,),
      //                     Text("Cow Wall Frame",
      //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      //                     Text("Product Code: VH 230", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 8,),
      //                     Text("Price : ₹ 2,999", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 58,),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           height: 40,
      //                           width: 170,
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(6.0),
      //                               color: Colors.red.shade50,
      //                               border: Border.all(color: Colors.lime.shade900)
      //                           ),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Text("View Details"),
      //                               CircleAvatar(
      //                                   backgroundColor: Colors.lime.shade900,
      //                                   radius: 12,
      //                                   child: Icon(Icons.arrow_forward_ios_rounded,size: 16,
      //                                     color: Colors.white,)),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               colors:  [
      //                 Colors.red.shade50,
      //                 Colors.lime.shade50,
      //                 Colors.pink.shade50,
      //               ],
      //             ),
      //           ),
      //           height: 250,
      //           width: double.infinity,
      //           child: Row(
      //             children: [
      //               SizedBox(height: 18,),
      //               Column(
      //                 children: [
      //                   Container(
      //                     height: 220,
      //                     width: 160,
      //                     decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.lime.shade900),
      //                     ),
      //                     margin: EdgeInsets.all(12),
      //                     child:  Image.asset(
      //                       "assets/Products/Glass/stand.jpeg", // Replace with the image path
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.symmetric( vertical: 16),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     // Text("Cancelled Ordered",
      //                     //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
      //                     SizedBox(height: 20,),
      //                     Text("Boat Stand",
      //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
      //                     Text("Product Code: VH 320", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 8,),
      //                     Text("Price : ₹ 999", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      //                     SizedBox(height: 58,),
      //                     Row(
      //                       children: [
      //                         Container(
      //                           height: 40,
      //                           width: 170,
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(6.0),
      //                               color: Colors.red.shade50,
      //                               border: Border.all(color: Colors.lime.shade900)
      //                           ),
      //                           child: Row(
      //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Text("View Details"),
      //                               CircleAvatar(
      //                                   backgroundColor: Colors.lime.shade900,
      //                                   radius: 12,
      //                                   child: Icon(Icons.arrow_forward_ios_rounded,size: 16,
      //                                     color: Colors.white,)),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

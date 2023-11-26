import 'package:flutter/material.dart';
import '../../../Models/Betseller/DAOSeller.dart';

class SellerProductDetails extends StatefulWidget {
   SellerProductDetails({Key? key, required this.sellproduct}) : super(key: key);
   final SaleProduct sellproduct ;

  @override
  State<SellerProductDetails> createState() => _SellerProductDetailsState();
}

class _SellerProductDetailsState extends State<SellerProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:  [
                      Colors.red.shade50,
                      Colors.lime.shade50,
                      Colors.pink.shade50,
                    ],
                  ),
                ),
                height: 180,
                width: double.infinity,
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lime.shade900),
                          ),
                          margin: EdgeInsets.all(12),
                          child:  Image.network(
                            "https://media.istockphoto.com/id/1309717274/vector/realistic-black-modern-thin-frame-display-computer-monitor-vector-illustration-jpg.jpg?s=612x612&w=0&k=20&c=hWFdkv0V09HqWjqRy2w93ikw2RBAcoxrhXq_9AQsOhQ=", // Replace with the image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(widget.sellproduct.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 15,),
                        Text("Quantity: ${widget.sellproduct.quantity}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 5,),
                        Text('Price: ${widget.sellproduct.price_formated}',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 5,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("In Stock:  ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                            Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                              ),
                              child: Center(
                                child: Text("${widget.sellproduct.stock_status}",
                                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                Text("Description:",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500 ,
                      // color: Colors.black
                  ),),
              ],),
              Column(
                children: [
                Text(widget.sellproduct.description,
                // textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14),),
              ],),
              Divider(),
              SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text("Price Details",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, ),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("List Price",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                    Text(widget.sellproduct.price_formated,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price Excluding Tax",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                    Text(widget.sellproduct.price_excluding_tax_formated,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                    Text(widget.sellproduct.discounts.toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, ),),
                    Text(widget.sellproduct.price_formated,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, ),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../Models/Betseller/DAOSeller.dart';
import '../../../Models/Featured/DAOfeatured.dart';

class FeaturedProductDetails extends StatefulWidget {
  FeaturedProductDetails({Key? key, required this.feaproduct}) : super(key: key);
  final featuredproduct feaproduct ;

  @override
  State<FeaturedProductDetails> createState() => _FeaturedProductDetailsState();
}

class _FeaturedProductDetailsState extends State<FeaturedProductDetails> {

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
                            "https://api.opencart-api.com/image/no_image.png",
                           fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(widget.feaproduct.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 15,),
                        Text("Quantity: ${widget.feaproduct.quantity}",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 5,),
                        Text('Price: ${widget.feaproduct.price_formated}',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(height: 5,),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("In Stock:  ",
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
                            Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                              ),
                              child: Center(
                                child: Text("${widget.feaproduct.stock_status}",
                                  style: TextStyle(
                                      fontSize: 14,fontWeight: FontWeight.w300,
                                      color: Colors.white),),
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
                  Text(widget.feaproduct.description,
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
                    Text(widget.feaproduct.price_formated,
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
                    Text(widget.feaproduct.price_excluding_tax_formated,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Special Excluding Tax",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, ),),
                    Text(widget.feaproduct.special_excluding_tax_formated.toString(),
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
                    Text(widget.feaproduct.price_formated,
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

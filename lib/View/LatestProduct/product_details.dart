import 'package:flutter/material.dart';
import '../../Models/Latest/DAOLatestProduct.dart';

class LatestProductDetails extends StatefulWidget {
  LatestProductDetails({Key? key, required this.latestprdct}) : super(key: key);
  final LatestProduct latestprdct ;

  @override
  State<LatestProductDetails> createState() => _LatestProductDetailsState();
}

class _LatestProductDetailsState extends State<LatestProductDetails> {

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
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Center(
                        child: Text(widget.latestprdct.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text("Quantity: ${widget.latestprdct.quantity}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 5,),
                    Text('Price: ${widget.latestprdct.price_formated}',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,color: Colors.black),),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("In Stock: ",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                        Container(
                          height: 30,
                          width: 85,
                          decoration: BoxDecoration(
                            color: Colors.green.shade600,
                          ),
                          child: Center(
                            child: Text("${widget.latestprdct.stock_status}",
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(children: [
                TextButton(onPressed: ( ){},
                  child: Text("Description:",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500 ,color: Colors.black),),),
              ],),
              Column(
                children: [
                  Text(widget.latestprdct.description,
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
                    Text(widget.latestprdct.price_formated,
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
                    Text(widget.latestprdct.price_excluding_tax_formated,
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
                    Text(widget.latestprdct.special_excluding_tax_formated.toString(),
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
                    Text(widget.latestprdct.price_formated,
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

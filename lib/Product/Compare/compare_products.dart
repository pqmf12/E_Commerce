import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import '../../Models/Compare/DAOCompare.dart';
import '../../Models/products/list_of_product.dart';
import '../../Utils/InMemory.dart';
import 'comparison.dart';

class Compare extends StatefulWidget {
   Compare ({Key? key, required this.id}) : super(key: key);
   final int id;

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {

  @override
  void initState() {
    compareproduct();
    Product();
    super.initState();
  }

  String SessionId = '';
  List<Compareproducts>  comparedata = [];
  void compareproduct() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.compare("123",  SessionId, widget.id.toString())
        .then((value) {
      if (value.success == 1) {
        comparedata.addAll(value.data!);
        print("success");
        // Navigator.push(context, MaterialPageRoute(builder:
        // (context) => Compare()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("Product Added to Compare")));
        print(JsonEncoder().convert(comparedata));
      }else{
        print("fail object");
      }
      setState(() {
      });
    });
  }

  List<products>  product  = [];
  void Product() {
    final client = RestClient(Dio());
    client.products("123", "application/json")
        .then((value) {
      if (value.success == 1) {
        product.addAll(value.data!);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compare"),
      ),
      body:  Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                // controller: controller,
                itemCount: comparedata.length,
                itemBuilder: (BuildContext context,int index) {
                  var i = comparedata[index];
                  return Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Text("Name:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            // SizedBox(width: 20,),
                            Text(i.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          ],
                        ),
                      ),
                  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.0),
                   child:   Row(
                        children: [
                          Text("Price:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          Text("${i.price}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                        ],
                      ),),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.0),
                        child:   Row(
                          children: [
                            Text("Manufacturer:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            Text("${i.manufacturer}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          ],
                        ),),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.0),
                        child:   Row(
                          children: [
                            Text("Availability:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            Text("${i.availability}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          ],
                        ),),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                        child: Row(
                          children: [
                            Text("Reviews:  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            Text(i.reviews,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          ],
                        ),),
                  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.0, ),
                  child: Row(
                        children: [
                          Text("Description:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                        ],
                      ),),
                      Html(data: i.description),
                      SizedBox(height: 8,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          children: [
                            Text("Size : ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            Text('${i.length} X ${i.width} X ${i.height}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
            child: Row(
              children: [
                Text("Compare with Products :-",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              ],
            ),
          ),
          // SizedBox(height: 12,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (BuildContext context,int index) {
                  var i = product[index];
                  return SingleChildScrollView(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                Comparison(id: widget.id, prdcut_id: i.product_id,),
                        ));
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 110, width: 110,
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.lime.shade900),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.network( i.original_image,
                                fit: BoxFit.cover,),),
                          ),
                          Text(i.name.toString(),
                            style: TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

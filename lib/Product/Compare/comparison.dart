import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import '../../Models/Compare/DAOCompare.dart';
import '../../Utils/InMemory.dart';

class Comparison extends StatefulWidget {
  Comparison({Key? key, required this.id, required this.prdcut_id}) : super(key: key);
  final int id;
  final int prdcut_id;

  @override
  State<Comparison> createState() => _ComparisonState();
}

class _ComparisonState extends State<Comparison> {

  @override
  void initState() {
    compareproduct();
    super.initState();
  }
  String SessionId = '';
  List<Compareproducts>  comparedata = [];
  void compareproduct() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.compare("123",  SessionId,  '${widget.id},${widget.prdcut_id}')
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
             Container(
               height: MediaQuery.of(context).size.height,
               width: 100,
               color: Colors.red[100],
               child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text("Details",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                      Divider(),
                      SizedBox(height: 25,),
                      Text("Name",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                  Divider(),
                      Text("Price",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),

                      Container( height: 150,
                        child: Center(
                          child: Text("Description",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                        ),
                      ),

                      Divider(),
                      Text("Reviews",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),
                      Text("Weight",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),
                      Text("Length",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),
                      Text("Width",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),
                      Text("Height",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                      Divider(),
                    ],
               ),
             ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: comparedata.map((i) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width -150,
                  // margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                      border: Border.all(color: Colors.black54)
                    ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Text("Product",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                      Divider(),
                    SizedBox(height: 25,),
                    Text(i.name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Text("${i.price}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Container(
                      height: 150,
                        child: Html(data: i.description)),
                    Divider(),
                    Text(i.reviews,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Text('${i.weight}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Text('${i.length}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Text('${i.width}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    Text('${i.height}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    Divider(),
                    ],
                    )
                   ); }
                ).toList(),
                ),
          ),
        ],
      ),
    );
  }
}

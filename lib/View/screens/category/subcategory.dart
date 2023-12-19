import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import '../../../Models/Category/DAOSubCategory.dart';
import '../../../Models/Category/list_of_categories.dart';
import '../../../Models/RestApiClient.dart';
import 'package:dio/dio.dart';


class SubCategory extends StatefulWidget {
  SubCategory({Key? key, required this.id, required this.name}) : super(key: key);
  final int id;
  final String name;

  @override
  State<SubCategory> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategory>  {

  Data? Catdata;
  List<subcategories> SubCat = [];
  bool loaded = false;
  bool isloading = false;

  @override
  void initState() {
    SubCategory();
  }

  String SessionId ="";
  void SubCategory() async{
    print("category called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.subcategory("123", SessionId!, "application/json", widget.id)
        .then((value) {
      if (value.success == 1){
        print("category success");
        Catdata = value.data;
        SubCat.addAll(Catdata!.sub_categories!);
        print(JsonEncoder().convert(value.data));
      }
      else{
        print("fail");
      }
      setState(() {
        loaded = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        elevation: 0,
      ),
      body: (isloading) ? Center(
        child: CircularProgressIndicator(backgroundColor: Colors.cyan,),)
          : (loaded && SubCat.isEmpty) ? Center(child: Text("This Category is Empty"))
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18.0),
                child: GridView.builder(
                    itemCount: SubCat.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      var i = SubCat[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                    child: Image.network(
                                      i.original_image,
                                      fit: BoxFit.cover,)),
                              ),
                            ),
                            Center(
                              child: Container(
                                color: Colors.cyan.shade50,
                                height: 50,
                                child: Text(
                                  i.name,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                ),
              )),
        ],
      ),
    );
  }
}

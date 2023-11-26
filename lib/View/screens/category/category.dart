import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import 'package:opencart_ecommapp1/View/screens/category/subcategory.dart';
import '../../../Models/Cart/AddCart.dart';
import '../../../Models/Category/list_of_categories.dart';
import '../../../Models/RestApiClient.dart';
import 'package:dio/dio.dart';


class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoriesState();
}

class _CategoriesState extends State<Category>  {

  List<Categories> category = [];
  bool loaded = false;

  @override
  void initState() {
    Category();
  }

  String SessionId = "";

  void Category() async{
    print("category called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.listcatgory("123", SessionId, "application/json")
        .then((value) {
      if (value.success == 1){
        print("category success");
        category.addAll(value.data!);
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
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (!loaded) ? Container( margin: EdgeInsets.symmetric(vertical: 80),
              child: Center(child: CircularProgressIndicator()))
         : Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 18.0),
                child: GridView.builder(
                    itemCount: category.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 18,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      var i = category[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder
                              : (context) => SubCategory(id: i.category_id, name: i.name,
                          )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 155,
                                // padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  // color: product.color,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                    child: Image.network(
                                      i.original_image,
                                      fit: BoxFit.fill,)),
                              ),
                            ),
                            Container(
                              color: Colors.cyan.shade50,
                              height: 80,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.0,),
                                    child: Text(i.name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star, color: Colors.yellow.shade700,
                                        size: 18,),
                                      Icon(
                                        Icons.star, color: Colors.yellow.shade700,
                                        size: 18,),
                                      Icon(
                                        Icons.star, color: Colors.yellow.shade700,
                                        size: 18,),
                                      Icon(
                                        Icons.star, color: Colors.yellow.shade700,
                                        size: 18,),
                                    ],
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 4.0),
                                  //   child: Row(
                                  //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       Text("₹ ${i.}",
                                  //         style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 14),),
                                  //       // SizedBox(width: 8,),
                                  //       // Container(
                                  //       //   height: 28,
                                  //       //   width: 30,
                                  //       //   decoration: BoxDecoration(
                                  //       //     color: Colors.lime.shade900,
                                  //       //     // border: Border.all(),
                                  //       //     borderRadius: BorderRadius.circular(8.0),
                                  //       //   ),
                                  //       //   child: IconButton(
                                  //       //       onPressed: () {},
                                  //       //       icon: Icon(Icons.add_shopping_cart,
                                  //       //         color: Colors.white,size: 17,)),
                                  //       // ),
                                  //       SizedBox(width: 24,),
                                  //       Container(
                                  //         height: 30,
                                  //         width: 30,
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.lime.shade900,
                                  //           // border: Border.all(),
                                  //           borderRadius: BorderRadius.circular(
                                  //               8.0),
                                  //         ),
                                  //         child: IconButton(
                                  //             onPressed: () {},
                                  //             icon: Icon(Icons.favorite_outline,
                                  //               color: Colors.white, size: 17,)),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
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

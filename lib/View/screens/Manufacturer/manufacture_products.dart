import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:provider/provider.dart';

import '../../../Models/Cart/AddCart.dart';
import '../../../Models/products/list_of_product.dart';
import '../../../Product/product_details.dart';
import '../../../Provider/wishlist_provider.dart';
import '../../../Utils/InMemory.dart';
import '../../Auth/login.dart';
import '../auth/Auth_Provider/login_provider.dart';

class ManufacturerProducts extends StatefulWidget {
  const ManufacturerProducts({Key? key, required this.id, required this.title}) : super(key: key);
  final int id;
  final String title;

  @override
  State<ManufacturerProducts> createState() => _ManufacturerProductsState();
}

class _ManufacturerProductsState extends State<ManufacturerProducts> {

  List<products>  product  = [];
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    Product();
  }

  String? SessionId;

  void Product() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.manufacturerproducts("123", "application/json", SessionId!, widget.id, 10, 1)
        .then((value) {
      if (value.success == 1) {
        product.addAll(value.data!);
      }
      setState(() {
        loaded = true;
      });
    });
  }

  List<AddItem> data = [];

  void addtocart(id) {
    final client = RestClient(Dio());
    client.additemcart("123",
        SessionId!,
        "application/json",
        "*/*",
        'default=$SessionId;',
        jsonEncode( {
          "product_id": id,
          "quantity": 1})
    )
        .then((value) {
      if(value.success == 1){
        print("success ::");
        data.add(value.data!);
        print(JsonEncoder().convert(value.data));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")
        ));
      }
      else{
        print("fail");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title} Products"),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: 12),
          //   child: Text("All Products",
          //     style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),),
          // ),
          // SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          (loaded != true) ? Center(
            child: Container(color: Colors.white,
              child: CircularProgressIndicator( ),
            ),
          )  : (loaded && product.isEmpty) ? Center(child: Text("No Result Found "))
         : Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.60),
                itemBuilder: (context, index) {
                  var i = product[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 285, width: 175,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink.shade50,
                                  Colors.pink.shade50,
                                  Colors.red.shade50,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(onPressed: ( ){
                                      // if (InMemory.isLogged == true)
                                      if (context.watch<LoginProvider>().isLogged)
                                      {
                                        context.read<WishlistProvider>().increment(i.product_id);
                                      } else {
                                        showLoginConfirmation(context,i.product_id);
                                      }
                                      setState(() {});
                                    },
                                        icon: Icon(Icons.favorite_outline,
                                          color: Colors.black54,)),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder:
                                    //     (context) =>
                                    //     ProductDetailScreen(id: i.product_id,)
                                    // ));
                                  },
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder:
                                      (context) => ProductDetailScreen(id: i.product_id,)));
                                    },
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 8.0,),
                                      child: Center(
                                        child: SizedBox(
                                          height: 145, width: 155,
                                          child: Image.network(
                                            i.original_image,
                                            fit: BoxFit.cover,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  i.name,
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),),
                                Text(
                                  "Price: ${i.price_formated}",
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),),
                                ElevatedButton(
                                  onPressed: ( ){
                                    addtocart(i.id);
                                  },
                                  child: Text("Add To Cart",
                                    // style: TextStyle(color: Colors.white,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 17),
                                  )
                                  ,)
                                // Container(height: 35, width: 105,
                                //   color: Colors. blueAccent[100],
                                //   child: Center(
                                //     child: Text("Add To Cart",
                                //       style: TextStyle(color: Colors.white,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 17),),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
  void showLoginConfirmation(BuildContext context,id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 22,),
                  Text("Sign up to wishlist this product",
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 12.0,vertical: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.white,
                                  // backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(12)),// foreground (text) color
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Cancelled")));
                                },
                                child:  Text("cancel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    // color: Colors.red
                                  ),),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // foregroundColor: Colors.white,
                                  // backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(12)),// foreground (text) color
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder
                                      : (context) => LoginPage()));
                                  setState(() {});
                                },
                                child:  Text("ok",
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

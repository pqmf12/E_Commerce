import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Models/Session/session.dart';
import 'package:opencart_ecommapp1/View/Auth/login.dart';
import '../../../../Models/AuthDio/DioSignUp.dart';
import '../../../../Models/Cart/AddCart.dart';
import '../../../../Models/RestApiClient.dart';
import '../../../../Models/WishList/DAOGetWishlist.dart';
import '../../../../Models/products/list_of_product.dart';
import '../../../../Product/product_details.dart';
import '../../../../Utils/InMemory.dart';

class TopProducts extends StatefulWidget {
   TopProducts({Key? key,}) : super(key: key);

  @override
  State<TopProducts> createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {

  List<products>  product  = [];
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    Product();
    fetchLogged();
  }

  void Product() {
    final client = RestClient(Dio());
    client.products("123", "application/json")
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
  // List<CartProduct> cartproduct = [];
  
  // void addtocart(id) {
  //   final client = RestClient(Dio());
  //   client.additemcart("123",
  //       SessionId!,
  //       "application/json",
  //       "*/*",
  //      jsonEncode( {
  //        "product_id": id,
  //        "quantity": 1})
  //   )
  //   .then((value) {
  //     if(value.success == 1){
  //       print("success ::");
  //       data.add(value.data!);
  //       print(JsonEncoder().convert(value.data));
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to cart")
  //       ));
  //     }
  //     else{
  //       print("fail");
  //     }
  //   });
  // }

  Future<void> cartbluk(id) async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print("cartbluk called");
    client.cart_bulk("123",
        SessionId!,
        "application/json",
        "*/*",
        JsonEncoder().convert( [{
          "product_id": id,
          "quantity": 1,
        }])
    )
        .then((value) {
      if(value.success == 1){
        print("success :: cart");
        print(SessionId);
        data.add(value.data!);
        print(JsonEncoder().convert(value.data));
        print(JsonEncoder().convert(value.data!.total));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("Item Added to Cart")
        ));
      }
      else{
        print("fail");
      }
      setState(() {});
    });
  }

  // List wishlistdata = [];
  String SessionId = "";
  bool success = false;

  addwishlist(product_id) async{
    SessionId = await InMemory().getSession();
    print("Add Wishlist  called");
    print("Session id :" + SessionId.toString());
    final client = RestClient(Dio());
    print("Session id :" + SessionId);
    print("productId :" + product_id.toString());
    Future<DioSignUp> res = client.add_wishlist("123", SessionId, product_id);
     res.then((value) {
      if (value.success == 1) {
        print(" Add Wishlist success");
        print("Session id after success:" + SessionId);

      } else {
        print("failed");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error: ${value.error}")));
      }
      setState(() {});
    });
  }

  int logStatus = 0;
  String islogged = "";

  void fetchLogged() {
    print("fetching logged");
    InMemory().init().then((value) {
      // if (isDisposed) return;
      if (InMemory.isLogged) {
        logStatus = 1;
      } else {
        logStatus = 2;
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Products"),
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
          (!loaded) ? Center(child: CircularProgressIndicator())
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
                                      if (InMemory.isLogged == true){
                                        addwishlist(i.product_id);
                                      } else {
                                        showLoginConfirmation(context,i.product_id);
                                      }
                                    },
                                        icon: Icon(Icons.favorite_outline,
                                          color: Colors.black26,
                                        )),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context) =>
                                        ProductDetailScreen(id: i.product_id,)
                                    ));
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
                                    // addtocart(i.product_id);
                                    cartbluk(i.product_id);
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
                    padding:   EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

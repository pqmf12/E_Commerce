import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import '../../../Models/WishList/DAOGetWishlist.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  @override
  void initState() {
    super.initState();
    Getwishlist();
  }

  List<WishlistProduct> wishlistprdt = [];
  String SessionId = "";

  void Getwishlist() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print("getwishlist called");
    client.getwishlist("123", SessionId, "application/json")
        .then((value) {
      if (value.success == 1) {
        print("getwishlist successs");
        wishlistprdt.addAll(value.data!);
        JsonEncoder().convert(wishlistprdt);
        print(wishlistprdt);
      } else {
        print("failed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height:  250,
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.cancel_outlined)),
                  ],
                ),
                Container(
                  height: 130,
                  color: Colors.blue[300],
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: ( ){
                    // addtocart(i.product_id);
                  },
                  child: Text("Add To Cart",
                    // style: TextStyle(color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 17),
                  )
                  ,),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import 'package:provider/provider.dart';
import '../../../Models/Cart/cart_item_provider.dart';
import '../../../Models/WishList/DAOAddWishlist.dart';
import '../../../Models/WishList/DAOGetWishlist.dart';
// import 'package:http/http.dart' show get;
import '../../../Product/product_details.dart';
import '../../../Provider/wishlist_provider.dart';

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
  bool loaded = false;
  int numOfItems = 1;

  void totalwishlistcount(){
   int count = wishlistprdt.length;
  context.read<WishlistProvider>().totalcount(count);
  }

  void Getwishlist() async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
   /* final uri = Uri.parse('https://api.opencart-api.com/api/rest/wishlist');
    SessionId = await InMemory().getSession();
    final Map<String, String> headers = {
      'X-Oc-Session': '$SessionId',
      'Accept': 'application/json',
      'X-Oc-Merchant-Id': '123',
      'Cookie': 'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
      // 'id': '$product_id',
    };
    print(SessionId);
    print('wishlistprdt $wishlistprdt');
    try {
      final response = await get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        // Successful API call
        wishlistprdt = add(response.body);
        // final responseBody = await response.transform(utf8.decoder).join();
        // Process the responseBody as needed
        print(response.body);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
    return;*/
   print("getwishlist called");
    client.getwishlist(
      "123", SessionId,
      "application/json",
      'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',)
        .then((value) {
      if (value.success == 1) {
        print("getwishlist successs");
        // wishlistprdt = value.data!;
        wishlistprdt.clear();
        wishlistprdt.addAll(value.data!);
        totalwishlistcount();
        print(JsonEncoder().convert(wishlistprdt));
        // print(JsonEncoder().convert(value.data!));
        print(wishlistprdt);
      } else {
        print("failed");
      }
      setState(() {
        loaded = true;
      });
    });
  }

  Future<void> removewishlist(product_id) async{
    SessionId = await InMemory().getSession();
    final client = RestClient(Dio());
    print("Session id :" + SessionId);
    print("productId :" + product_id.toString());
    Future<DAOAddWishlist> res = client.remove_from_wishlist(
      "123",
      SessionId,
      "application/json",
      'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
      '$product_id',
    );
    res.then((value) {
      if (value.success == 1) {
        print(" Remove Wishlist success");
        print("Session id after success:" + SessionId);
        setState(() {
          wishlistprdt.removeWhere((element) => element.product_id == product_id);
        });
        context.read<WishlistProvider>().decrement();
        totalwishlistcount();
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("Product removed from wishlist")));
      } else {
        print("failed");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Error of wishlist: ${value.error}")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final wishlistprovider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        elevation: 0,
      ),
      body: (!loaded) ? Center(
        child: CircularProgressIndicator(),
      )
          : (loaded && wishlistprdt.isEmpty)
          ? Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Center(child: Image.asset("assets/eComm/empty_cart.png")),
          SizedBox(height: 20,),
          Text("Your wishlist is empty!",
            style: TextStyle(color: Colors.teal[900],
                fontSize: 20,fontWeight: FontWeight.w500),),
            SizedBox(height: 14,),
            Center(
              child: Text("Add items that you like to your wishlist. Review them anytime and easily move them to the bag.",
                style: TextStyle(color: Colors.black,
                    fontSize: 16,fontWeight: FontWeight.w500),),
            ),
          SizedBox(height: 16,),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Continue shopping",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          ),
        ],
      )
          :ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: wishlistprdt.length,
          itemBuilder: (BuildContext context,int index) {
            var i = wishlistprdt[index];
            return Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: 260,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.lime.shade800),
                ),
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            removewishlist(i.product_id);
                          },
                          child: Container(
                            height: 28,width: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.clear,size: 24,color: Colors.red,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) =>
                            ProductDetailScreen(id: i.product_id)
                        ));
                      },
                      child: Text(i.name.toString(),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) =>
                              ProductDetailScreen(id: i.product_id)
                          ));
                        },
                        child: Text("Model: ${i.model}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
                    SizedBox(height: 8,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) =>
                              ProductDetailScreen(id: i.product_id)
                          ));
                        },
                        child: Text("Price: ${i.price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
                    SizedBox(height: 8,),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) =>
                              ProductDetailScreen(id: i.product_id)
                          ));
                        },
                        child: Text("Stock: ${i.stock}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)),
                    SizedBox(height: 8,),
                    Text("Special: ${i.special}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius:
                          BorderRadius.circular(6.0),),
                          side: BorderSide(color: Colors.lime.shade900)
                      ),
                      onPressed: () {
                        context.read<CartItemProvider>().increment(i.product_id,numOfItems);
                        cartadded(context);
                      },
                      child:  Text("Add to cart"),
                    ),
                  ],
                ),
              );
          }
      ),
    );
  }

  void cartadded(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width - 45,
            height: 150,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 22,),
                  Text("Product added to cart",
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("You can see it on your cart.",
                    style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 14,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          },
                          child:  Text("ok",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              // color: Colors.red
                            ),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

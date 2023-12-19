import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:opencart_ecommapp1/Models/Session/session.dart';
import 'package:opencart_ecommapp1/View/Auth/login.dart';
import 'package:provider/provider.dart';
// import '../../../../Models/AuthDio/DioSignUp.dart';
import '../../../../Models/Cart/AddCart.dart';
import '../../../../Models/Cart/cart_item_provider.dart';
import '../../../../Models/RestApiClient.dart';
// import '../../../../Models/WishList/DAOAddWishlist.dart';
// import '../../../../Models/WishList/DAOGetWishlist.dart';
import '../../../../Models/products/list_of_product.dart';
import '../../../../Product/product_details.dart';
import '../../../../Provider/wishlist_provider.dart';
import '../../../../Utils/InMemory.dart';

class TopProducts extends StatefulWidget {
   TopProducts({Key? key,}) : super(key: key);

  @override
  State<TopProducts> createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {

  List<products>  product  = [];
  bool loaded = false;
  // bool pressed = false;
  int numOfItems = 1;
  // bool iswishlisted = false;

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

  Future<bool> fetchData(product_id) async {
    print("product_id");
    print(product_id);
    // final httpClient = HttpClient();
    final uri = Uri.parse('https://api.opencart-api.com/api/rest/wishlist/{id}');
    SessionId = await InMemory().getSession();
    final Map<String, String> headers = {
      'X-Oc-Session': '$SessionId',
      'Accept': 'application/json',
      'X-Oc-Merchant-Id': '123',
      'Cookie': 'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
      'id': '$product_id',
    };
    // return
    print(SessionId);
    print(product_id);
    try {
      final response = await get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        // Successful API call
        // final responseBody = await response.transform(utf8.decoder).join();
        // Process the responseBody as needed
        print(response.body);
        return Future(() => true);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return Future(() => false);
      }
    }
    catch (error) {
      // Handle network or other errors
      print('Error: $error');
      return Future(() => false);
    }
  }

  // Future<void> cartbluk(id) async {
  //   final client = RestClient(Dio());
  //   SessionId = await InMemory().getSession();
  //   print("cartbluk called");
  //   client.cart_bulk("123",
  //       SessionId!,
  //       "application/json",
  //       "*/*",
  //       JsonEncoder().convert( [{
  //         "product_id": id,
  //         "quantity": 1,
  //       }])
  //   )
  //       .then((value) {
  //     if(value.success == 1){
  //       print("success :: cart");
  //       print(SessionId);
  //       data.add(value.data!);
  //       print(JsonEncoder().convert(value.data));
  //       print(JsonEncoder().convert(value.data!.total));
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar
  //         (content: Text("Item Added to Cart")
  //       ));
  //     }
  //     else{
  //       print("fail");
  //     }
  //     setState(() {});
  //   });
  // }

  // List wishlistdata = [];
  String SessionId = "";
  bool success = false;

  List<AddItem> data = [];

  Future<void> addtocart(product_id) async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.additemcart("123",
        SessionId!,
        "application/json",
        "*/*",
        'default=$SessionId;',
        jsonEncode( {
          "product_id": product_id,
          "quantity": numOfItems})
    )
        .then((value) {
      if(value.success == 1){
        print("success ::");
        print(SessionId);
        data.add(value.data!);
        // context.read<CartItemProvider>().increment();
        print(JsonEncoder().convert(value.data));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("Item Added to Cart")
        ));
      }
      else{
        print("fail");
      }
    });
  }

  Future<bool> addwishlist(product_id) async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(product_id);
    print(SessionId);
    client.add_wishlist(
        "123",
        SessionId!,
        "application/json",
        'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
         product_id
       ).then((value) {
      if (value.success == 1) {
        print("success wishlist");
        print(SessionId);
        print(JsonEncoder().convert(value.data));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("Item Added to Wishlist")
        ));
        return Future(() => true);
      }
      else {
        print("fail");
        return Future(() => false);
      }
    });
    return false;
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
                  return Consumer<CartItemProvider>(builder: (context, value, child){
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
                                          // addwishlist(i.product_id)
                                          context.read<WishlistProvider>().increment(i.product_id);
                                         // .then((value)
                                         //  {
                                         //    if(value){
                                         //      i.iswishlisted = true;
                                         //      setState(() {
                                         //      });
                                         //    }
                                         //  });
                                        } else {
                                          showLoginConfirmation(context,i.product_id);
                                        }
                                        setState(() {});
                                         // fetchData(i.product_id).then((value)
                                        //  {
                                        //    if(value){
                                        //      i.iswishlisted = true;
                                        //      setState(() {
                                        //      });
                                        //    }
                                        //  });
                                      },
                                          icon: Icon(
                                              !i.iswishlisted ? Icons.favorite_outline
                                                : Icons.favorite,
                                                color: !i.iswishlisted ? Colors.black54
                                            : Colors.red,
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
                                      context.read<CartItemProvider>().increment(i.product_id,numOfItems);
                                      cartadded(context);
                                  },
                                    child: Text("Add To Cart",
                                    )
                                    ,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
        }
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

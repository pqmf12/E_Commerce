import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import 'package:provider/provider.dart';
import '../../../Models/Cart/DAOCart.dart';
import '../../../Models/Cart/DAODeleteCart.dart';
import '../../../Models/Cart/cart_item_provider.dart';
import '../../../Product/product_details.dart';
import '../../Auth/login.dart';
import '../Payment/checkout.dart';
import '../auth/Auth_Provider/login_provider.dart';

class CartPage extends StatefulWidget {
   CartPage({Key? key, }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController textcontroller = TextEditingController();
  bool isPriceDetailsVisible = false;
  bool loaded = false;
  // bool isLoading = false;

  @override
  void initState() {
    cartitems();
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  // List<AddItem> cartlist = [];
  // List<ProductList> products = [];

   ApiData? cartdata ;
  List<ProductData> productdata  = [];
  List<Total> totalamount = [];

  String SessionId = "";
  void cartitems() async {
     SessionId = await InMemory().getSession();
    /*get(Uri.parse("https://api.opencart-api.com/api/rest/cart"),headers: {
      'X-Oc-Session': "$SessionId",
      'X-Oc-Merchant-Id': '123',
      'Cookie': 'default=$SessionId;'
    }).then((value){
      print("cart called complete");
      print(value.statusCode);
      print(value.body);
      print("value.request.headers");
      print(value.request?.headers);
      print(JsonEncoder().convert(value));
    });*/
    print("cart called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print("cart called succefully");
    client.getcart("123",
        SessionId, 'default=$SessionId;')
    .then((value)  async {
      if(value.success == 1) {
        print("VALUE:${value.data}");
        print(SessionId);
        if(value.data.runtimeType != List){
          cartdata =  ApiData.fromJson(value.data);
         // cartdata = (value.data);
          productdata.clear();
          totalamount.clear();
          productdata.addAll(cartdata!.products!);
          totalamount.addAll(cartdata!.totals!);
          setState(() {
          });
        }
        print(JsonEncoder().convert(value.data));
        print(JsonEncoder().convert(productdata));
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        //  cartdata = prefs.getString(productdata.first.name) ?? " ";
      }
      else{
        print("fail");
      }
      setState(() {
        loaded = true;
        // isLoading = false;
      });
    });

  }

  DeleteData? removedata;
  void removeitems(key) async {
    SessionId = await InMemory().getSession();
    print("Removecart called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print("removeditem called succefully");
    client.deletecartitem(
        "123",
        SessionId,
        'default=$SessionId;',
        jsonEncode( {
         "key": key
        }),
      ).then((value)  {
      if(value.success == 1) {
        removedata = value.data;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Item Removed")));
        print("VALUE:${value.data}");
        print(SessionId);
        print(JsonEncoder().convert(value.data));

        setState(() {
          productdata!.removeWhere((element) => element.key == key);
        });
        context.read<CartItemProvider>().decrement(key);
      }
      else{
        print("fail");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${value.error}")));
      }
    });
  }

  int numOfItems = 1;

  Future<void> updateitem(key, newQuantity) async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print("updateitem called");
    client.updatecartitem("123", SessionId, "application/json",
        'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
      jsonEncode( {
        "key": key,
        "quantity": newQuantity
      })
    ).then((value) => {
      if(value.success == 1){
        print("successfully updated"),
        print(newQuantity),
        cartitems(),
      }else{
        print("failed")
      }
    });
  }

  void incrementQuantity(key, currentQuantity) {
    int parsedQuantity = int.parse(currentQuantity!);
    parsedQuantity++;
    setState(() {
       currentQuantity = parsedQuantity.toString();
    });
    print(parsedQuantity);
    updateitem(key, parsedQuantity);
  }

  void decrementQuantity(key, currentQuantity) {
    int parsedQuantity = int.parse(currentQuantity!);
    parsedQuantity--;
    setState(() {
      currentQuantity = parsedQuantity.toString();
    });
    print(parsedQuantity);
    updateitem(key, parsedQuantity);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Check if the user has scrolled to the end of the ListView
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        // Show the "PRICE DETAILS" column when scrolled to the end
        isPriceDetailsVisible = true;
      });
    } else {
      setState(() {
        // Hide the "PRICE DETAILS" column when not scrolled to the end
        isPriceDetailsVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItemProvider>(context);
    return  Scaffold(
      appBar: AppBar(
            title: Text("Cart"),
            elevation: 0,
          ),
      body:  (!loaded) ? Center(
       child: CircularProgressIndicator(),
        )
          : (loaded && productdata.isEmpty)
          ? Column(
           // mainAxisAlignment: MainAxisAlignment.center,
           children: [
          Center(child: Image.asset("assets/eComm/empty_cart.png")),
          SizedBox(height: 16,),
          Text("Your cart is empty!",
            style: TextStyle(color: Colors.teal[900],
                fontSize: 20,fontWeight: FontWeight.w500),),
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
         : Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (BuildContext context,int index) {
                  return Column(
                    children: [
                  for (var i in productdata!)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lime.shade800),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  // color: Colors.red.shade50,
                                  border: Border.all(color: Colors.lime.shade900)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Qty:  ${i.quantity}"),
                                  // SizedBox(
                                  //   height:20,
                                  //   width: 35,
                                  //   child: TextFormField(
                                  //     controller: textcontroller,
                                  //   ),
                                  // ),
                                  // SizedBox(width: 12,),
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                       InkWell(
                                           onTap: (){
                                             // updateitem(i.quantity);
                                             incrementQuantity(i.key, i.quantity);
                                           },
                                           child: Icon(Icons.arrow_drop_up_outlined)),
                                        InkWell(
                                            onTap: (){
                                              // updateitem(i.quantity);
                                              decrementQuantity(i.key, i.quantity);
                                            },
                                            child: Icon(Icons.arrow_drop_down_outlined)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius:
                                  BorderRadius.circular(6.0),),
                                  side: BorderSide(color: Colors.lime.shade900)
                              ),
                              onPressed: () {
                                removeitems(i.key);
                                // value.removeItem(index);
                              },
                              child:  Text("Remove"),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  for(var x in totalamount)
                   ListTile(
                   title: Text(x.title!,style: TextStyle(fontWeight: FontWeight.w400,
                   fontSize: 14,),),
                   trailing: Text(x.text!,style: TextStyle(fontWeight: FontWeight.w400,
                   fontSize: 16, ),),),
              ],
            );
             }
             ),
             Positioned(
              bottom: 0,
              // top: 0,
              right: 0,
              left: 0,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                    // if (InMemory.isLogged == true)
                    if (context.read<LoginProvider>().isLogged)
                     // Provider.of<LoginProvider>(context, listen: false);
                      {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (contex) => CheckOutPage() ));
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You can proceed now")));
                    }
                      // Provider.of<LoginProvider>(context, listen: true);
                    else
                      {
                    showLoginConfirmation(context);
                    }
                    setState(() {});
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.lime.shade900,)
                      ),
                      width: double.infinity,
                      child: Center(child: Text('Checkout',
                          style: TextStyle(fontSize: 18,color: Colors.black))),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                   Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.lime.shade900,)
                      ),
                      width: double.infinity,
                      child: Center(child: Text('Continue Shopping',
                        style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.center,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLoginConfirmation(BuildContext context) {
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
                  Text("Sign up for checking out",
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

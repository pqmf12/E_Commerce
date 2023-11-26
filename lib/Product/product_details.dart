import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Models/Session/session.dart';
import '../Models/Cart/AddCart.dart';
import 'package:dio/dio.dart';
import '../Models/Compare/DAOCompare.dart';
import '../Models/products/product_details.dart';
import '../Utils/InMemory.dart';
import '../View/screens/Payment/checkout.dart';
import 'Compare/compare_products.dart';


class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key, required this.id, this.callback, this.isloaded = false}) : super(key: key);
      final int id;
      final callback;
      bool isloaded;

  @override
  State<ProductDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin{
  TextEditingController textController = TextEditingController();
  List<String> categories = ["Description","Reviews (0)",];

  bool isLastPage = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

   int  selectedIndex = 0;
  bool loaded = false;
  bool _obscureText = true;
  final  _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
    ProductDetails();
    fetchLogged();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Details? detail ;

  void ProductDetails() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.productdetails("123", "application/json", SessionId, widget.id)
        .then((value) {
      if (value.success == 1) {
       detail = (value.data);
      }
      setState(() {});
      loaded = true;
    });
  }

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
        widget.isloaded = true;
      });
    });
  }

  List<AddItem> data = [];

  void addtocart() {
    final client = RestClient(Dio());
    client.additemcart("123",
        SessionId!,
        "application/json",
        "*/*",
        jsonEncode( {
          "product_id": widget.id,
          "quantity": numOfItems})
    )
        .then((value) {
      if(value.success == 1){
        print("success ::");
        print(SessionId);
        data.add(value.data!);
        print(JsonEncoder().convert(value.data));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar
          (content: Text("${numOfItems} Items Added to Cart")
        ));
      }
      else{
        print("fail");
      }
    });
  }

  int numOfItems = 1;

  void incrementQuantity() {
    numOfItems++;
    setState(() {
    });
  }

  void dcrementQuantity() {
    numOfItems--;
    setState(() {
    });
  }

  // Data setn =  Data();
  String SessionId = '';
  String sessionid = '';

  Data setn =  Data();

  void session() {
    final client = RestClient(Dio());
    print("session called");
    client.Session("123", "application/json", "application/json", "voluptate")
        .then((value) {
      if(value.success == 1) {
        print("session success");
        setn = value.data!;
        print("Session ID: ${setn.session}");
        InMemory().setSession(setn.session);
        sessionid = setn.session;
        print("new sesionid ${sessionid}");
        login();
      }else{
        print("fail");
      }
    });
  }

  void login() async {
    print("login called");
    final client = RestClient(Dio());
    print(emailController.text);
    print(passwordController.text);
    SessionId = await InMemory().getSession();
    client
        .getLogin(
        jsonEncode({ "email": emailController.text,
          "password": passwordController.text,}),
        SessionId, '123')
        .then((value) {
      print("emailController.text" + emailController.text);
      print("passwordController.text" + passwordController.text);
      print("sessioid... ${SessionId}");
      if (value.success == 1) {
        InMemory().setUser(value.data!).then((value) {});
        print("Logged In");
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder:
        (context) => CheckOutPage()));
        fetchLogged();
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid input fields"))
        );
        print("something went wrong  ?? ""}");
      }
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
    TabController tabController = TabController(length: 2, vsync: this);

    return  (loaded != true) ? Container(color: Colors.white,
    child: Center(child: CircularProgressIndicator( )),
    )
        : Scaffold(
        // backgroundColor: Colors.red.shade50,
        appBar: AppBar(
        // backgroundColor: Colors.red.shade50,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: ( ){},
              icon: Icon(Icons.search)),
          IconButton(onPressed: ( ){
            // Navigator.push(context, MaterialPageRoute(builder:
            //     (context) => CartPage()));
          },
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              // margin: EdgeInsets.symmetric(horizontal: 16),
              child:
              // ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     // controller: controller,
              //     itemCount: detail!.original_images.length,
              //     itemBuilder: (BuildContext context,int index) {
              //       return   Container(
              //         width: 300,
              //         margin: EdgeInsets.symmetric(horizontal: 10),
              //         child: Image.network(
              //             detail!.original_images[index] ?? "",
              //         fit: BoxFit.cover,),
              //       );
              //     }),
              PageView.builder(
                controller: _pageController,
                itemCount:  detail!.original_images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 300,
                    height: 100,
                    // margin: EdgeInsets.symmetric(horizontal: 6),
                    child: Center(
                      child: Image.network(
                        detail!.original_images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            _buildPageIndicator(),
            // SizedBox(height: 18,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(detail!.name,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Icon(Icons.star_border_outlined,color: Colors.yellow.shade700,size: 15,),
                  Icon(Icons.star_border_outlined,color: Colors.yellow.shade700,size: 15,),
                  Icon(Icons.star_border_outlined,color: Colors.yellow.shade700,size: 15,),
                  Icon(Icons.star_border_outlined,color: Colors.yellow.shade700,size: 15,),
                  SizedBox(width: 4,),
                  Container(
                    color: Colors.lime.shade900,
                    height: 20,width: 2,
                  ),
                  SizedBox(width: 4,),
                  Text("${detail!.rating} Ratings"),
                  SizedBox(width: 28,),
                  ElevatedButton(onPressed: ( ){
                    if (widget.isloaded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Compare(id: widget.id)),
                      );
                    } else {
                      compareproduct();
                    }
                    // compareproduct(detail!.product_id);
                  },
                      child: Text(widget.isloaded ? "Go to Compare" : "Add to Compare"),),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Row(
                children: [
                  Text("${detail!.price_formated}",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 8 ),
              child: Row(
                children: [
                  Text("Brand : ",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),),
                  SizedBox(width: 75,),
                  Text(detail!.manufacturer ?? "HTC",
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w300),)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 8 ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Model:",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  SizedBox(width: 75,),
                  Text(detail!.model,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Availability:",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  SizedBox(width: 40,),
                  Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                    ),
                    child: Center(
                      child: Text("${detail!.stock_status}",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.0, vertical: 8 ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Stock Count:",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  SizedBox(width: 40,),
                  Text("${detail!.viewed}",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25.0,vertical: 8),
              child: Container(
                height: 110,
                width: MediaQuery.sizeOf(context).width - 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                // child: CardCounter(id: widget.id,),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 65,
                            height: 25,
                            child: OutlinedButton(
                              onPressed: () {
                                dcrementQuantity();
                              },
                              child: Center(child: Icon(Icons.remove)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(numOfItems.toString().padLeft(2,"0"),
                              style: Theme.of(context).textTheme.headline6,),
                          ),
                          SizedBox(
                            width: 65,
                            height: 25,
                            child: OutlinedButton(
                              onPressed: () {
                                incrementQuantity();
                              },
                              child: Center(child: Icon(Icons.add)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),),
                          onPressed: ( ){
                            addtocart();
                          },
                          child: Text("Add to Cart"),),
                        // SizedBox(width: 55,),
                        // Container(
                        //   height: 34,
                        //   width: 34,
                        //   decoration: BoxDecoration(
                        //     color: Colors.red,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   child: Icon(FontAwesomeIcons.solidHeart,size: 15, color: Colors.white,),
                        // ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),),
                          onPressed: ( ){
                            if (InMemory.isLogged) {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => CheckOutPage()));
                            } else {
                              showLoginConfirmation(context);
                            }
                          },
                          child: Text("Buy Now"),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 450,
              decoration: BoxDecoration(
                // color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 30,
                        child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>  buildCategory(index)
                        ),
                      ),
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Html(data: detail!.description,),
                           // textAlign: TextAlign.justify,
                           // style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Divider(),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            //   elevation: 4,
            //   child: Container(
            //     width: 380,
            //     // decoration: BoxDecoration(
            //     //   // color: Colors.black.withOpacity(0.1),
            //     //   borderRadius: BorderRadius.circular(8),
            //     // ),
            //     child: TabBar(
            //       indicator: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         // borderRadius: BorderRadius.circular(4.0),
            //         color: Colors.white,
            //       ),
            //       controller: tabController,
            //       isScrollable: true,
            //       labelPadding: EdgeInsets.symmetric(horizontal: 28),
            //       tabs: [
            //         Tab(child: Text("Description" ,style: TextStyle(fontSize: 16,),),),
            //         Tab(child: Text("Reviews",style: TextStyle(fontSize: 16,), ),),
            //         // Tab(child: Text("Recovery" ),),
            //       ],
            //     ),
            //   ),
            // ),
            // TabBarView(
            //   controller: tabController,
            //   children: [
            //     decriptionpage(description: detail!.description,),
            //     reviewpage(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categories[index],
              style: TextStyle(
                fontSize: 16,
                // color: selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5,left: 6),
              height: 2,
              width: 45,
              color: selectedIndex == index ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  void showLoginConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 600,
            height: 380,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("LogIn to Continue",
                        style: TextStyle(fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      },
                        child: Text("X",
                          style: TextStyle(fontSize: 24,
                              fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                  // SizedBox(height: 8,),
                  Padding(
                    padding:   EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Email",
                              style: TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.w300),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ]
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if(value == null || value.isEmpty) {
                                    return "Field Required";
                                  }
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(Icons.email_outlined,size: 18,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Text("Password",
                              style: TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.w300),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ]
                          ),
                          child: TextFormField(
                            validator: (value){
                              if(value == null || value.isEmpty) {
                                return "Field Required";
                              }
                            },
                            controller: passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.lock_outline,size: 18,),
                              suffixIcon: GestureDetector(onTap: (){
                                print("press");
                                setState(() {
                                  _obscureText =! _obscureText;
                                });
                              },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility ,color: Colors.red.shade900,),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
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
                                  // login();
                                  session();
                                },
                                child:  Text("LogIn",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    // color: Colors.red
                                  ),),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New User?"),
                            TextButton(onPressed: ( ){
                              Navigator.pop(context);
                              showRegister(context);
                            },
                                child: Text("Register here")),
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

  void showRegister(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 600,
            height: 380,
            child:  SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("SignUp Here",
                        style: TextStyle(fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      },
                        child: Text("X",
                          style: TextStyle(fontSize: 24,
                              fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                  Padding(
                    padding:   EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Email",
                              style: TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.w300),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ]
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if(value == null || value.isEmpty) {
                                    return "Field Required";
                                  }
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(Icons.email_outlined,size: 18,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Text("Password",
                              style: TextStyle(fontSize: 17,
                                  fontWeight: FontWeight.w300),),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1,1),
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                ),
                              ]
                          ),
                          child: TextFormField(
                            validator: (value){
                              if(value == null || value.isEmpty) {
                                return "Field Required";
                              }
                            },
                            controller: passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(Icons.lock_outline,size: 18,),
                              suffixIcon: GestureDetector(onTap: (){
                                print("press");
                                setState(() {
                                  _obscureText =! _obscureText;
                                });
                              },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility ,color: Colors.red.shade900,),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
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
                                  // session();
                                  // login();
                                },
                                child:  Text("SignUp",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    // color: Colors.red
                                  ),),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Registered?"),
                            TextButton(onPressed: ( ){},
                                child: Text("Login")),
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

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        detail!.original_images.length,
            (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }
}


//
// class CardCounter extends StatefulWidget {
//   CardCounter( {Key? key, required this.id,  }) : super(key: key);
//   final id;
//
//   @override
//   State<CardCounter> createState() => _CardCounterState();
// }
//
// class _CardCounterState extends State<CardCounter> {
//
//   List<AddItem> data = [];
//
//   void addtocart() {
//     final client = RestClient(Dio());
//     client.additemcart("123",
//         "voluptate",
//         "application/json",
//         "*/*",
//         jsonEncode( {
//           "product_id": widget.id,
//           "quantity": numOfItems})
//     )
//         .then((value) {
//       if(value.success == 1){
//         print("success ::");
//         data.add(value.data!);
//         print(JsonEncoder().convert(value.data));
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar
//           (content: Text("${numOfItems} Items Added to Cart")
//         ));
//       }
//       else{
//         print("fail");
//       }
//     });
//   }
//
//   int numOfItems = 1;
//
//
//   void incrementQuantity() {
//     numOfItems++;
//     setState(() {
//     });
//   }
//
//   void dcrementQuantity() {
//     numOfItems--;
//     setState(() {
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 65,
//                 height: 25,
//                 child: OutlinedButton(
//                   onPressed: () {
//                     dcrementQuantity();
//                   },
//                   child: Center(child: Icon(Icons.remove)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Text(numOfItems.toString().padLeft(2,"0"),
//                   style: Theme.of(context).textTheme.headline6,),
//               ),
//               SizedBox(
//                 width: 65,
//                 height: 25,
//                 child: OutlinedButton(
//                   onPressed: () {
//                     incrementQuantity();
//                   },
//                   child: Center(child: Icon(Icons.add)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.0),
//                 ),),
//               onPressed: ( ){
//                 addtocart();
//               },
//               child: Text("Add to Cart"),),
//             // SizedBox(width: 55,),
//             // Container(
//             //   height: 34,
//             //   width: 34,
//             //   decoration: BoxDecoration(
//             //     color: Colors.red,
//             //     shape: BoxShape.circle,
//             //   ),
//             //   child: Icon(FontAwesomeIcons.solidHeart,size: 15, color: Colors.white,),
//             // ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6.0),
//                 ),),
//               onPressed: ( ){
//                 showLoginConfirmation(context);
//               },
//               child: Text("Buy Now"),),
//           ],
//         ),
//       ],
//     );
//   }
//
// }

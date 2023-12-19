import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/View/screens/Manufacturer/manufacture_products.dart';
import 'package:provider/provider.dart';
import '../../../Models/Banner/DAOBanner.dart';
import '../../../Models/Betseller/DAOSeller.dart';
import '../../../Models/Featured/DAOfeatured.dart';
import '../../../Models/Latest/DAOLatestProduct.dart';
import '../../../Models/Manufacturer/DAOManufactures.dart';
import '../../../Models/Specials/DAOSpecialProducts.dart';
import '../../../Models/products/list_of_product.dart';
import '../../../Product/product_details.dart';
import '../../../Provider/wishlist_provider.dart';
import '../../../Utils/InMemory.dart';
import '../../../Utils/background_image.dart';
import '../../Auth/login.dart';
import '../../LatestProduct/product_details.dart';
import '../Banner/banner_details.dart';
import '../BestSeller/bestseller.dart';
import '../Featured_Product/product_details.dart';
import 'Product/top_product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.callback, this.Controller,  }) : super(key: key);
  final callback;
  final Controller;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  late PageController pageController;
  final controller = PageController();
  int activeIndex = 0;
  int currScreen = 0;
  List<products>  product  = [];
  List<SaleProduct> sellerdata = [];
  List<Featured> featureddata = [];
  List<featuredproduct> featuredproducts = [];
  List<LatestProduct> latestdproducts = [];
  bool showFeaturedProducts = true;
  bool loaded = false;
  List<SpecialProduct> specialproduct = [];
  List<ManufacturerList> brandlist = [];
  List<BannerList> bannerdata = [];
  bool mayhavemore = false;
  int currentpage = 1;
  int countperpage = 15;


  @override
  void initState() {
    super.initState();
    Product();
    SellerProduct();
    FeturedProduct();
    latestProduct();
    specialproducts();
    brands();
    Banner();
  }

   String SessionId = "";

  void Product() {
    final client = RestClient(Dio());
    client.products("123", "application/json")
        .then((value) {
      if (value.success == 1) {
        product.addAll(value.data!);
        if(countperpage < value.data!.length) {
          mayhavemore = true;
        }else{
          mayhavemore = false;
        }
      }
      setState(() {
         loaded = true;
      });
    });
  }

  void SellerProduct() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.bestsellers("123", SessionId!, "application/json")
    .then((value) {
      if (value.success == 1) {
         sellerdata.addAll(value.data!);
         print("successeded");
         print(JsonEncoder().convert(value.data));
      }else{
        print("failed");
      }
    });
  }

  void FeturedProduct() {
    print("featured called");
    final client = RestClient(Dio());
    client.featured("123", SessionId, "application/json", 10)
    .then((value) {
      if (value.success == 1) {
        print("success");
        featureddata = value.data!;
        featuredproducts.addAll(featureddata.first.products!);
        print(JsonEncoder().convert(featuredproducts));
      }else{
        print("failed");
      }
      setState(() {
        showFeaturedProducts = true;
      });
    });
  }

  void latestProduct() {
    print("latestProduct called");
    final client = RestClient(Dio());
    client.latest("123", SessionId, "application/json", 10)
        .then((value) {
      if (value.success == 1) {
        print("success");
        latestdproducts.addAll(value.data!);
        print(JsonEncoder().convert(latestdproducts));
      }else{
        print("failed");
      }
      setState(() {
        showFeaturedProducts = true;
      });
    });
  }

  void specialproducts() {
    print("SpecialProduct called");
    final client = RestClient(Dio());
    client.specials("123", SessionId, "application/json", 10)
        .then((value) {
          print("VALUE SPECIAL: ${value}");
      if (value.success == 1) {
        print("success");
        specialproduct.addAll(value.data!);
        print(JsonEncoder().convert(specialproduct));
      }else{
        print("failed");
      }
      setState(() {});
    });
  }

  void brands() {
    final client = RestClient(Dio());
    print("welcome");
    client.manufacturers("123", SessionId, "application/json",)
    .then((value) {
      if (value.success == 1) {
        brandlist.addAll(value.data!);
        print(JsonEncoder().convert(brandlist));
      } else{
        print("fail");
      }
      setState(() {});
    });
  }

  void Banner() {
    final client = RestClient(Dio());
    print("Banner List Called");
    client.banners("123", SessionId, "application/json")
        .then((value) {
      if (value.success == 1) {
        bannerdata.addAll(value.data!);
        print(JsonEncoder().convert(bannerdata));
      } else{
        print("failed");
      }
      setState(() {});
    });
  }

  Future<void> handlerefresh() async {
    product.clear();
    Product();
    sellerdata.clear();
    SellerProduct();
    featuredproducts.clear();
    FeturedProduct();
    specialproduct.clear();
    specialproducts();
    bannerdata.clear();
    Banner();
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  (!loaded) ? Container( margin: EdgeInsets.symmetric(vertical: 80),
          child: Center(child: CircularProgressIndicator()))
        :SingleChildScrollView(
        controller: widget.Controller,
        child: Column(
          children: [
            SizedBox(height: 14,),
            Container(
              height: 220,
              child: PageView(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("  Top Products",
                            style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 90,),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => TopProducts()));
                            },
                            child: Text("View All",
                              style: TextStyle(
                                fontSize: 15,fontWeight: FontWeight.w500,
                                // color: Secondarycolor,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context) => TopProducts()));
                              },
                              icon: Icon(
                                Icons.double_arrow_outlined,
                                // color: Colors.red.shade900,
                                size: 16,))
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: product.length,
                            itemBuilder: (BuildContext context,int index) {
                              var i = product[index];
                              return SingleChildScrollView(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                        ProductDetailScreen(id: i.product_id,)
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 110, width: 110,
                                          decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.lime.shade900),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(14.0),
                                              child: Image.network( i.original_image,
                                                fit: BoxFit.cover,)),),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(i.name.toString(),
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            // color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CarouselSlider.builder(
              itemCount: bannerdata.length,
              itemBuilder: (context,int index, realIndex) {
             if (bannerdata.isNotEmpty && index < bannerdata.length) {
               var i = bannerdata[index];
               return InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) =>
                           BannerDetails(
                             id: i.banner_id, title: i.name,)));
                 },
                 child: Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(4.0),
                     // gradient: LinearGradient(
                     //     colors: [
                     //       Colors.red.shade50,
                     //       Colors.lime.shade50,
                     //       Colors.red.shade50,
                     //     ]
                     // ),
                     border: Border.all(color: Colors.orange.shade200),
                   ),
                   // margin: EdgeInsets.symmetric(horizontal: 3),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Column(
                         children: [
                           SizedBox(height: 8,),
                           Text(
                             i.name,
                             style: TextStyle(
                               // color: Colors.black,
                               fontWeight: FontWeight.w500, fontSize: 18,
                             ),),
                         ],
                       ),
                     ],
                   ),
                 ),
               );
               } else {
               return Container();
               }},
              options: CarouselOptions(
                  height: 50,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  viewportFraction: 0.6,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index)
              ),
            ),
            SizedBox(height: 24,),
            Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors:  [
                //     Colors.red.shade50,
                //     Colors.lime.shade100,
                //     Colors.pink.shade100,
                //   ],
                // ),
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [

                  Row(
                    children: [
                      Text(
                        "  Best Sellers", // Replace with the product name
                        style: TextStyle(
                          fontSize: 20,
                          // color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "   Explore Exciting Discounts & More", // Replace with the product name
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 8,),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "  Deal end within  ", // Replace with the product name
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //     Container(
                  //       color: Colors.red,
                  //       height: 25,
                  //       width: 85,
                  //       child: Center(
                  //         child: Text(
                  //           offsetdata.offset.toString() ?? "216", // Replace with the product name
                  //           style: TextStyle(
                  //             fontSize: 18,
                  //             // color: Colors.white,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Text(
                  //       "  hours", // Replace with the product name
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.w400,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 18,),
                  Container(
                    height: 220,
                    width: double.infinity,
                    // color: Colors.black,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sellerdata.length,
                        itemBuilder: (context, index) {
                          var i = sellerdata[index];
                          return Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime.shade900),
                            ),
                            margin: EdgeInsets.all(12),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            SellerProductDetails(sellproduct: sellerdata[index],)
                                    ));
                                  },
                                  child: Image.network(
                                    "https://media.istockphoto.com/id/1309717274/vector/realistic-black-modern-thin-frame-display-computer-monitor-vector-illustration-jpg.jpg?s=612x612&w=0&k=20&c=hWFdkv0V09HqWjqRy2w93ikw2RBAcoxrhXq_9AQsOhQ=", // Replace with the image path
                                    height: 120,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 145,
                                  // color: Colors.white,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(i.name,
                                          style: TextStyle(
                                            // color: Colors.black,
                                            fontSize: 16, fontWeight: FontWeight.w500,),),
                                        Text(i.price_formated,
                                          style: TextStyle(fontSize: 14,
                                              // color: Colors.black,
                                              fontWeight: FontWeight.w600),),
                                        // SizedBox(height: 4,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              // backgroundColor: Colors.black54,
                                              radius: 14,
                                              child: IconButton(onPressed: ( ) {
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) =>
                                                        SellerProductDetails(sellproduct: sellerdata[index],)
                                                ));
                                              },
                                                  icon: Icon(Icons.arrow_forward_ios_outlined,
                                                    size: 12,
                                                    // color: Colors.white,
                                                  )),
                                            ),
                                          ],
                                        ),
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
            ),
            Divider(),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Special Products",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,
                    color: Colors.yellow.shade800,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get It On Your Budget!",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
                    color: Colors.yellow.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Container(
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialproduct.length,
                  itemBuilder: (context, index) {
                    var y = specialproduct[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 130,
                        width: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.yellow.shade600,
                              Colors.orange.shade700,
                              Colors.red.shade400,
                              Colors.pink,
                              Colors.pink.shade700,
                            ],
                          ),
                        ),
                        margin: EdgeInsets.all(10.0),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Text(y.name,
                                style: TextStyle(
                                    color: Colors.white,
                                  fontSize: 16,fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Text(y.price_formated,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,fontWeight: FontWeight.w600,
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Divider(),
            Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors:  [
              //       Colors.cyan.shade50,
              //       Colors.cyan.shade100,
              //       Colors.cyan.shade50,
              //     ],
              //   ),
              // ),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text(
                        "  Top Brands", // Replace with the product name
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: brandlist.length,
                        itemBuilder: (context, index) {
                          var i = brandlist[index];
                          return Container(
                            height: 220,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.lime.shade900),
                            ),
                            margin: EdgeInsets.all(12),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context) => ManufacturerProducts(
                                          id: i.manufacturer_id, title: i.name,)));
                                  },
                                  child: Image.network(
                                    i.original_image,
                                  height: 120,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 145,
                                  // color: Colors.white,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(i.name,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),),
                                        SizedBox(height: 8,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.black54,
                                              radius: 14,
                                              child: IconButton(onPressed: ( ) {
                                                Navigator.push(context, MaterialPageRoute(builder:
                                                    (context) => ManufacturerProducts(id: i.manufacturer_id,
                                                      title: i.name,)));
                                              },
                                                  icon: Icon(Icons.arrow_forward_ios_outlined,
                                                    size: 12,
                                                    color: Colors.white,)),
                                            ),
                                          ],
                                        ),
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
            ),
            Container(
              height: 245,
              child: Stack(
                children: [
                  Background(),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          showFeaturedProducts ? "Featured Products" : "Latest Products", // Replace with the product name
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        // IconButton(
                        //     onPressed: ( ){
                        //     },
                        //     icon: Icon(Icons.arrow_forward,color: Colors.white,size: 28,))
                      ],
                    ),
                  ),
                  // Positioned(
                  //   left: 32,
                  //   top: (MediaQuery.of(context).size.height - 475) / 2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Column(
                  //         children: [
                  //           SizedBox(height: 20,),
                  //           Container(
                  //             height: 100,
                  //             width: 100,
                  //             decoration: BoxDecoration(
                  //               // border: Border.all(color: Colors.lime.shade900),
                  //             ),
                  //             margin: EdgeInsets.all(12),
                  //             child:  Image.network(
                  //               "assets/Products/fabric/sling_bag.jpg", // Replace with the image path
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           SizedBox(height: 10,),
                  //           Text("Boat Stand",
                  //             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),),
                  //           Row(
                  //             children: [
                  //               Text("Price : ₹ ",
                  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                  //                     // decoration: TextDecoration.lineThrough,
                  //                     color: Colors.white),),
                  //               Text("900",
                  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                  //                     decoration: TextDecoration.lineThrough,
                  //                     color: Colors.white),),
                  //               SizedBox(width: 12,),
                  //               Text("800",
                  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                  //                     color: Colors.white),),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    top: 85,
                    child: Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: showFeaturedProducts ? featuredproducts.length : latestdproducts.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context,int index) {
                           if(showFeaturedProducts) {
                             var i = featuredproducts[index];
                             return SingleChildScrollView(
                               child: InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context) =>
                                           FeaturedProductDetails(
                                             feaproduct: featuredproducts[index],)
                                   ));
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       // Column(
                                       //   children: [
                                       //     SizedBox(height: 20,),
                                       //     Container(
                                       //       height: 100,
                                       //       width: 100,
                                       //       decoration: BoxDecoration(
                                       //         // border: Border.all(color: Colors.lime.shade900),
                                       //       ),
                                       //       margin: EdgeInsets.all(12),
                                       //       child:  Image.network(
                                       //         "assets/Products/fabric/sling_bag.jpg", // Replace with the image path
                                       //         fit: BoxFit.cover,
                                       //       ),
                                       //     ),
                                       //   ],
                                       // ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           SizedBox(height: 10,),
                                           Text( i.name,
                                             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),),
                                           Row(
                                             children: [
                                               Text(i.price_formated,
                                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                                                     // decoration: TextDecoration.lineThrough,
                                                     color: Colors.white),),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             );
                           } else{
                             var x = latestdproducts[index];
                             return SingleChildScrollView(
                               child: InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context) =>
                                           LatestProductDetails(
                                             latestprdct: latestdproducts[index],)
                                   ));
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       // Column(
                                       //   children: [
                                       //     SizedBox(height: 20,),
                                       //     Container(
                                       //       height: 100,
                                       //       width: 100,
                                       //       decoration: BoxDecoration(
                                       //         // border: Border.all(color: Colors.lime.shade900),
                                       //       ),
                                       //       margin: EdgeInsets.all(12),
                                       //       child:  Image.network(
                                       //         "assets/Products/fabric/sling_bag.jpg", // Replace with the image path
                                       //         fit: BoxFit.cover,
                                       //       ),
                                       //     ),
                                       //   ],
                                       // ),
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         children: [
                                           SizedBox(height: 10,),
                                           Text( x.name,
                                             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: Colors.white),),
                                           Row(
                                             children: [
                                               Text(x.price_formated,
                                                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                                                     // decoration: TextDecoration.lineThrough,
                                                     color: Colors.white),),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             );
                           }
                          }),
                    ),
                  ),
                  Positioned(
                    top: 185,
                     right: 5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: ( ){
                        setState(() {
                          showFeaturedProducts = !showFeaturedProducts;
                          print("object");
                        });
                      },
                        child: Text(showFeaturedProducts ? "Next ->" : "<- Previous",
                        style: TextStyle(fontSize: 17),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Products For You", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),),
              ],
            ),
            SizedBox(height: 8,),
            NotificationListener<ScrollEndNotification>(
              onNotification: (scroll) {
                if (scroll.metrics.pixels >=
                    scroll.metrics.maxScrollExtent - 500) {
                  currentpage += 1;
                  print("object");
                  if (mayhavemore) {
                    Product();
                  } else {
                    currentpage -= 1;
                  }
                }
                return false;
              },
             child: GridView.count(
               childAspectRatio: 0.70,
               crossAxisCount: 2,
               // crossAxisSpacing: 10.0,
               // mainAxisSpacing: 60.0,
               scrollDirection: Axis.vertical,
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               children: List.generate(
                 product.length,
                     (index) {
                   var i = product[index];
                   return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(id: i.product_id)
                      ));},
                     child: Container(
                       height: 600,
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey),
                       ),
                       child: SingleChildScrollView(
                         child: Column(
                           children: [
                             Stack(
                               children: [
                                 Center(
                                   child: Image.network(
                                     i.original_image,
                                     fit: BoxFit.cover,
                                     height: 135,
                                   ),
                                 ),
                                 StatefulBuilder(
                                     builder: (context, setState) {
                                       bool isFavorite = true;
                                       return Row(
                                         mainAxisAlignment: MainAxisAlignment.end,
                                         children: [
                                           IconButton(
                                               onPressed: () async {
                                                  if (InMemory.isLogged == true){
                                                 context.read<WishlistProvider>().increment(i.product_id);
                                                  } else {
                                                    showLoginConfirmation(context,i.product_id);
                                                  }
                                                  setState(() {});
                                               },
                                               icon: Icon(
                                                     Icons
                                                     .favorite_border_outlined,
                                               )),
                                         ],
                                       );
                                       //   (InMemory().wishlist1.contains(i.product_id)) ? Icon(Icons.favorite_rounded,color: PRIMARY,) :Icon(
                                       //   success
                                       //       ? Icons.favorite_rounded
                                       //       : Icons.favorite_border_outlined,
                                       //   color:  (success)
                                       //       ? PRIMARY
                                       //       : Colors.grey,
                                       // ),);
                                     }),
                               ],
                             ),
                             SizedBox(
                               height: 10,
                             ),
                             Text(
                               i.name,
                               style: TextStyle(fontSize: 15),
                             ),
                             Text(
                               i.price_formated.toString(),
                               style: TextStyle(fontSize: 18,
                                   // color: Colors.black,
                                   fontWeight: FontWeight.w600),
                             ),
                             SizedBox(width: 6,),
                             Text(
                               "Free Delivery",
                               style: TextStyle(fontSize: 12),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(
                                   margin: EdgeInsets.all(8),
                                    height: 25,
                                   width: 60,
                                   decoration: BoxDecoration(
                                     color: Colors.green,
                                     borderRadius: BorderRadius.circular(12.0),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text(i.rating.toString(),
                                         style: TextStyle(color: Colors.white),),
                                       Icon(Icons.star,size: 14,color: Colors.white,),
                                     ],
                                   ),
                                    ),
                                 Text("(${i.quantity})"),
                               ],
                             ),
                           ],
                         ),
                       ),
                     ),
                   );
                 },
               ),
             ),
           ),
          ],
        ),
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



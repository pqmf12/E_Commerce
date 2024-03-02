import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Utils/AppConstants.dart';
import 'package:opencart_ecommapp1/View/Auth/login.dart';
import 'package:opencart_ecommapp1/View/Contact/contact.dart';
import 'package:opencart_ecommapp1/View/screens/Search/search.dart';
import 'package:opencart_ecommapp1/View/screens/order/order.dart';
import 'package:provider/provider.dart';
// import '../../../Fonts/font_size.dart';
import '../../../Models/Account/account.dart';
import '../../../Models/Cart/DAOCart.dart';
import '../../../Models/Cart/cart_item_provider.dart';
import '../../../Provider/get_profile_provider.dart';
import '../../../Provider/wishlist_provider.dart';
import '../../../Theme/dark_theme.dart';
// import '../../../Theme/theme_changer_provider.dart';
import '../../../Utils/InMemory.dart';
import '../../../firebase_options.dart';
import '../Cart/cart.dart';
import '../WishList/wishlist.dart';
import '../account/Account.dart';
import '../auth/Auth_Provider/login_provider.dart';
import '../category/category.dart';
import 'homescreen.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key,  this.callback}) : super(key: key);
  final callback;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ScreenTitle = ["Home","Categories", "My Orders",];
  int currScreen = 0;
  DateTime pre_backpress = DateTime.now();
  final ScrollController _scrollController = ScrollController();
  bool loaded = false;
  ApiData? cartdata;
  String SessionId = "";
  Profile profile = Profile();

  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getprofile();
  }


  void scrollHomeToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChanger>(context);
    //    final cartcount = Provider.of<ApiData>(context);
    final ThemeData theme = Theme.of(context);
    Color unselectedItemColor = theme.brightness == Brightness.light
        ? Colors.black
        : Colors.white;
    return WillPopScope(
      onWillPop: () async {
        // if(currScreen != 0){
        //   setState(() {
        //     currScreen = 0;
        //   });
        // }
        // else{
        //   return true;
        // }
        // return false;
        if (currScreen == 0) {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();
          if (cantExit) {
            // ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
            //     "Press Back button again to Exit", Notify_Status.WARNING));
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Press Back button again to Exit")));
          } else {
            return true;
          }
        }
        if (currScreen != 0) {
          setState(() {
            currScreen = 0;
          });
          return false;
        }
        return false;
      },
        child: Scaffold(
            appBar:(currScreen != 3)
                ?AppBar(
                 title: Text(ScreenTitle[currScreen]),
                 actions: [
                IconButton(onPressed: ( ){
                  Navigator.push(context, MaterialPageRoute(builder
                      : (context) => SearchPage()));
                },
                    icon: Icon(Icons.search)),
                Stack(
                  children: [
                    IconButton(onPressed: ( ){
                      // if (InMemory.isLogged == true)
                      //   Provider.of<LoginProvider>(context, listen: false);
                      if (context.read<LoginProvider>().isLogged)
                      {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) =>  WishListPage()));
                      }
                      else {
                        showLoginConfirmation(context);
                      }
                    },
                        icon: Icon(Icons.favorite_outline)),
                Consumer<WishlistProvider>(
                builder: (context, wishitemProvider, child) {
                int totalCount =  wishitemProvider.wishlistcount;
                return (totalCount == 0) ? Text("")
                 : Positioned(
                      top: 0,
                      right: 1,
                      child: CircleAvatar(
                        radius: 10, // Adjust the size of the avatar as needed
                        backgroundColor: Colors.red, // Set the background color of the avatar
                        child:Center(
                                child:
                                // Text('${context.watch<WishlistProvider>().totalcount(totalCount)}'),
                                Text('$totalCount',style: TextStyle(color: Colors.white),)
                            ),
                      ),
                     );
                     },
                    ),
                  ],
                ),
                 Stack(
                     children: [
                       IconButton(onPressed: ( ){
                         Navigator.push(context, MaterialPageRoute(builder:
                             (context) => CartPage()));
                       },
                           icon: Icon(Icons.shopping_cart_outlined)),
                       Consumer<CartItemProvider>(builder
                           : (context, cartItemProvider, child) {
                         int totalCount = cartItemProvider.totalProductCount;
                           return (totalCount == 0) ? Text("")
                           : Positioned(
                             top: 0,
                             right: 1,
                             child:CircleAvatar(
                               radius: 10, // Adjust the size of the avatar as needed
                               backgroundColor: Colors.red, // Set the background color of the avatar                       child: Center(
                               child:Center(
                                     child: Text('$totalCount',
                                       style: TextStyle(color: Colors.white),))
                             ),
                           );
                         }
                       ),
                     ],
                   ),
              ],
              elevation: 0,
            )
            :  AppBar(
               title: Text("My Account"),
             //   actions: [
             //   IconButton(onPressed: ( ){
             //        Navigator.push(context, MaterialPageRoute(builder
             //            : (context) => SearchPage()));
             //   },
             //   icon: Icon(Icons.search)),
             //  Stack(
             //       children: [
             //         IconButton(onPressed: ( ){
             //           if (InMemory.isLogged == true){
             //             Navigator.push(context, MaterialPageRoute(builder:
             //                 (context) =>  WishListPage()));
             //           } else {
             //             showLoginConfirmation(context);
             //           }
             //         },
             //             icon: Icon(Icons.favorite_outline)),
             //         Consumer<WishlistProvider>(
             //           builder: (context, wishitemProvider, child) {
             //             int totalCount =  wishitemProvider.wishlistcount;
             //             return (totalCount == 0) ? Text("")
             //            : Positioned(
             //               top: 0,
             //               right: 1,
             //               child: CircleAvatar(
             //                 radius: 10, // Adjust the size of the avatar as needed
             //                 backgroundColor: Colors.red, // Set the background color of the avatar
             //                 child:Center(
             //                     child:
             //                     // Text('${context.watch<WishlistProvider>().totalcount(totalCount)}'),
             //                     Text('$totalCount',style: TextStyle(color: Colors.white),)
             //                 ),
             //               ),
             //             );
             //           },
             //         ),
             //       ],
             //     ),
             // Stack(
             //       children: [
             //         IconButton(onPressed: ( ){
             //           Navigator.push(context, MaterialPageRoute(builder:
             //               (context) => CartPage()));
             //             },
             //             icon: Icon(Icons.shopping_cart_outlined)),
             //          Positioned(
             //               top: 0,
             //               right: 1,
             //               child:CircleAvatar(
             //                 radius: 10, // Adjust the size of the avatar as needed
             //                 backgroundColor: Colors.red, // Set the background color of the avatar                       child: Center(
             //                 child:  Consumer<CartItemProvider>(builder: (context, cartItemProvider, child) {
             //                    int totalCount = cartItemProvider.totalProductCount;
             //                 return Center(
             //                 child: Text('$totalCount',
             //                 style: TextStyle(color: Colors.white),));
             //                   },
             //                     ),
             //                  ),
             //             ),
             //       ],
             //     ),
             //   ],
              elevation: 0,
              ),
            drawer:  CustomDrawer(context),
            bottomNavigationBar: BottomNavigationBar (
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,color: Colors.black),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),
              showUnselectedLabels: true,
              // selectedItemColor: unselectedItemColor,
              unselectedItemColor: unselectedItemColor,
              onTap: (index) {
                currScreen = index;
                setState(() {});
                if(currScreen == 0){
                  scrollHomeToTop();
                }
              },
              currentIndex: currScreen,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon:  Icon(currScreen == 0 ? FontAwesomeIcons.home :  Icons.home_outlined,
                    size: 22,),
                  label: "Home",

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    currScreen == 1 ? Icons.category : Icons.category_outlined,
                    size: 22,
                  ),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    currScreen == 2 ? FontAwesomeIcons.cube :  FontAwesomeIcons.cube,
                    size: 22,
                  ),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    currScreen == 3 ? FontAwesomeIcons.userLarge : Icons.person_3_outlined,
                    size: 22,
                  ),
                  label: "Account",
                ),
              ],
            ),
            body: renderScreen()),
    );
  }

  Widget renderScreen() {
    if (currScreen == 0) return HomeScreen(Controller:  _scrollController,);
    if (currScreen == 1) return  Category();
    if (currScreen == 2) return  Order();
    if (currScreen == 3) return  AccountPage();
    return Container(
      height: 300,
      // color: Colors.grey,
    );
  }

           String welcome = "Facebook";
      Map<String, dynamic>? _userData;
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);
      if(loginResult == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        _userData = userData;
      }else{
        print(loginResult.message);
      }
      setState(() {
        welcome = _userData!['email'];
      });
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Widget CustomDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.symmetric(vertical: 0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(),
            child: context.read<LoginProvider>().isLogged
                ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                CircleAvatar(
                  radius: 32,
                  child: Icon(Icons.person_3_outlined),
                ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.watch<ProfileProvider>().profile.firstname ?? "",
                          // profile.firstname ?? " ",
                          style: TextStyle(fontSize: 16),),
                        SizedBox(width: 5,),
                        Text(
                          context.watch<ProfileProvider>().profile.lastname ?? "",
                          // profile.email ?? " ",
                          style: TextStyle(fontSize: 16),),
                      ],
                    ),
                Text(
                  context.watch<ProfileProvider>().profile.email ?? "",
                  // profile.email ?? " ",
                  style: TextStyle(fontSize: 14),),
              ],
            )
                : Text(""),
          ),
          ListTile(
            title: Text('Home',style: TextStyle(fontSize: 15),),
            trailing: Icon(FontAwesomeIcons.house,size: 16,),
            onTap: () {
              currScreen = 0;
              setState(() {});
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Divider(),
          ListTile(
            onTap: () {
              currScreen = 1;
              setState(() {
              });
              Navigator.pop(context);
            },
            title: Text("Category",style: TextStyle(fontSize: 15),),
            trailing: Icon(Icons.category,size: 18,),
          ),
          // Divider(),
          ListTile(
            title: Text('Setting',style: TextStyle(fontSize: 15),),
            trailing:  Icon(FontAwesomeIcons.gear,size: 16,),
            onTap: () {
              // Handle item 2 tap
              // Navigator.pop(context); // Close the drawer
            },
          ),
          // Divider(),
          ListTile(
            title: Text('Theme Mode',style: TextStyle(fontSize: 15),),
            trailing:  Icon(FontAwesomeIcons.moon,size: 17),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder
                  : (context) => DarkThemeScreen()));
            },
          ),
          ListTile(
            title: Text('Help',style: TextStyle(fontSize: 15),),
            trailing:  Icon(FontAwesomeIcons.questionCircle,size: 17,),
            onTap: () {
            },
          ),
          // Divider(),
          // (InMemory.isLogged == true)
            (context.watch<LoginProvider>().isLogged)
              ?  ListTile(
               title: Text('Logout',style: TextStyle(fontSize: 15),),
               trailing: Icon(FontAwesomeIcons.arrowRightFromBracket,size: 16,
                   color:Colors.red.shade800),
               onTap: () {
                showLogoutConfirmation(context);
            },
          )
              : ListTile(
               title: Text('Login',style: TextStyle(fontSize: 15),),
               trailing: Icon(FontAwesomeIcons.rightToBracket,size: 16,),
               onTap: () {
              Navigator.push(context, MaterialPageRoute(builder
                  : (context) => LoginPage()));
            },
          ),
          SizedBox(height: 20,),
          Container(
            height: 300,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CONTACT US",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(onPressed: ( ){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => ContactPage()));
                      },
                          icon: Icon(Icons.double_arrow_outlined, color: Colors.white,)),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.home_outlined,color: Colors.lime.shade900,),
                      SizedBox(width: 4,),
                      Text("Kasha The Interio",
                        // " Mumbai Pune Highway, Marble Market Ambegaon, Next To Rajveer Restaurant,Pune, Maharashtra",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text("Mumbai Pune Highway, Marble Market Ambegaon, Next To Rajveer Restaurant,Pune, Maharashtra",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.phone_in_talk_outlined,color: Colors.lime.shade900,),
                      SizedBox(width: 5,),
                      Text("+91 8530216262",
                        // " Mumbai Pune Highway, Marble Market Ambegaon, Next To Rajveer Restaurant,Pune, Maharashtra",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.mail_outline,color: Colors.lime.shade900,),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder:
                          // (context) => ContactPage()));
                        },
                        child: Text("sales@kashatheinterio.com",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 28,width: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Center(
                              // child: SvgPicture.asset('assets/Svg/facebook.svg',
                              //     colorFilter: ColorFilter.mode(Colors.grey.shade800, BlendMode.srcIn)),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 28,width: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Center(
                              // child: SvgPicture.asset('assets/Svg/instagram.svg',
                              //     colorFilter: ColorFilter.mode(Colors.grey.shade900, BlendMode.srcIn)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add more list items as needed
        ],
      ),
    );
  }

  void showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Log out?')),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    // InMemory().logout().then((value) {
                    //   widget.callback();
                    //   setState(() {});
                    //   Navigator.pop(context);
                    // });
                    context.read<LoginProvider>().logout();
                    Navigator.pop(context);
                    // Close the dialog
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  // void logout(){
  //   print("logout Called");
  //   print('Session ID: ${SessionId}');
  //  final client = RestClient(Dio());
  //   client.logout("123",  SessionId!)
  //  .then((value) {
  //    print(SessionId);
  //    if(value.success == 1) {
  //      print("logout");
  //    }
  //    else{
  //      print("fail");
  //    }
  //    setState(() {
  //
  //    });
  //   });
  // }

  void showLoginConfirmation(BuildContext context,) {
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
                  Text("Sign up to watch "
                      "wishlist",
                    style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.0,vertical: 40),
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

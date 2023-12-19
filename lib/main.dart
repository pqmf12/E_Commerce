import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:opencart_ecommapp1/Models/Session/session.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Fonts/Font_changer.dart';
import 'Models/Cart/DAOCart.dart';
import 'Models/Cart/cart_item_provider.dart';
import 'Provider/wishlist_provider.dart';
import 'Theme/theme_changer_provider.dart';
import 'Utils/InMemory.dart';
import 'View/Onboard_Screen.dart';
import 'View/screens/HomeScreen/home_screen.dart';
import 'package:dio/dio.dart';
import 'firebase_options.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent));

  runApp(MyApp( showHome:  showHome));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.showHome ,}) : super(key: key);
  final bool showHome;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int logStatus = 0;
  String islogged = "";

  Data setn =  Data();
  // bool showHome = false;
  String sessionid = "";

  @override
  void initState() {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).whenComplete(() {
      print("completed");
      setState(() {});
    });
    fetchLogged();
    session();
    super.initState();
  }

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

  void session() {
    final client = RestClient(Dio ());
    print("session called");
    client.Session("123", "application/json", "application/json", "voluptate")
        .then((value) {
      if(value.success == 1) {
        print("session success");
        setn = value.data!;
        print("Session ID: ${setn.session}");
        InMemory().setSession(setn.session);
        sessionid = setn.session;
      }else{
        print("fail");
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => CartItemProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ],
      child:  Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
              textTheme: GoogleFonts.k2dTextTheme(Theme.of(context).textTheme,),
            ),
            // theme: ThemeData(
            //   useMaterial3: true,
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade900),
            //   textTheme: fontChanger.customTextTheme,
            // ),
                // home: logStatus == 1
                // ? HomePage(callback: fetchLogged,)
                // : logStatus == 2
                // ? OnboardingScreen(callback: fetchLogged,)
                // : Scaffold()
            home:  widget.showHome ? HomePage(callback: fetchLogged,) : OnboardingScreen(),
          );
        }
      ),
    );
  }
}


// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// String prettyPrint(Map json) {
//   JsonEncoder encoder = const JsonEncoder.withIndent('  ');
//   String pretty = encoder.convert(json);
//   return pretty;
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Map<String, dynamic>? _userData;
//   AccessToken? _accessToken;
//   bool _checking = true;
//
//   @override
//   void initState() {
//     super.initState();
//     // _checkIfIsLogged();
//   }
//
//   Future<void> _checkIfIsLogged() async {
//     print("_checkIfIsLogged");
//     await FacebookAuth.instance.login();
//     final accessToken = await FacebookAuth.instance.accessToken;
//     setState(() {
//       _checking = false;
//     });
//     print("access token ----");
//     print(accessToken);
//     if (accessToken != null) {
//       print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
//       // now you can call to  FacebookAuth.instance.getUserData();
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _accessToken = accessToken;
//       setState(() {
//         _userData = userData;
//       });
//     }
//   }
//
//   void _printCredentials() {
//     print(
//       prettyPrint(_accessToken!.toJson()),
//     );
//   }
//
//   Future<void> _login() async {
//     print("login called");
//     await FacebookAuth.instance.login();
//     AccessToken? result = await FacebookAuth.instance.accessToken; // by default we request the email and the public profile
//     print("result");
//     print(result!.token);
//     print(result.applicationId);
//     print(result.userId);
//     // loginBehavior is only supported for Android devices, for ios it will be ignored
//     // final result = await FacebookAuth.instance.login(
//     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
//     //   loginBehavior: LoginBehavior
//     //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
//     // );
//
//     // if (result.status == LoginStatus.success) {
//
//     _accessToken = result;
//     print("_accessToken");
//     print(_accessToken);
//     _printCredentials();
//     //   // get the user data
//     //   // by default we get the userId, email,name and picture
//     final userData = await FacebookAuth.instance.getUserData();
//     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//     _userData = userData;
//     // } else {
//     //   print(result.status);
//     //   print(result.message);
//     // }
//
//     setState(() {
//       _checking = false;
//     });
//   }
//
//
//   Future<void> _logOut() async {
//     await FacebookAuth.instance.logOut();
//     _accessToken = null;
//     _userData = null;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title:  Text('Facebook Auth Example'),
//         ),
//         body:
//         // _checking
//         //     ?  Center(
//         //   child: CircularProgressIndicator(),
//         // ) :
//         SingleChildScrollView(
//           child: Padding(
//             padding:  EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   _userData != null ? prettyPrint(_userData!) : "NO LOGGED",
//                 ),
//                 SizedBox(height: 20),
//                 _accessToken != null
//                     ? Text(
//                   prettyPrint(_accessToken!.toJson()),
//                 )
//                     : Container(),
//                 SizedBox(height: 20),
//                 CupertinoButton(
//                   color: Colors.blue,
//                   child: Text(
//                     _userData != null ? "LOGOUT" : "LOGIN",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   onPressed: _userData != null ? _logOut : _login,
//                 ),
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


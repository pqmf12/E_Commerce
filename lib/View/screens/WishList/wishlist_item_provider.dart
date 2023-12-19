import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../../Models/WishList/DAOAddWishlist.dart';
import '../../../Models/WishList/DAOGetWishlist.dart';
import '../../../Utils/InMemory.dart';

class WishlistItemProvider  with ChangeNotifier,  DiagnosticableTreeMixin {


  String SessionId = "";
  List<WishlistProduct> wishlistprdt = [];
  // int get totalProductCount =>  cartdata!.total_product_count ?? 0;

  Future<void> Getwishlist() async {
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
        wishlistprdt.addAll(value.data!);
        print(JsonEncoder().convert(wishlistprdt));
        print(JsonEncoder().convert(value.data!));
        print(wishlistprdt);
      } else {
        print("failed");
      }
      return true;
    });
  }

  // Future<bool> fetchData(product_id) async {
  //   print("product_id");
  //   print(product_id);
  //   // final httpClient = HttpClient();
  //   final uri = Uri.parse('https://api.opencart-api.com/api/rest/wishlist/{id}');
  //   SessionId = await InMemory().getSession();
  //   final Map<String, String> headers = {
  //     'X-Oc-Session': '$SessionId',
  //     'Accept': 'application/json',
  //     'X-Oc-Merchant-Id': '123',
  //     'Cookie': 'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
  //     'id': '$product_id',
  //   };
  //   // return
  //   print(SessionId);
  //   print(product_id);
  //   try {
  //     final response = await get(
  //       uri,
  //       headers: headers,
  //     );
  //     if (response.statusCode == 200) {
  //       // Successful API call
  //       // final responseBody = await response.transform(utf8.decoder).join();
  //       // Process the responseBody as needed
  //       print(response.body);
  //       return Future(() => true);
  //     } else {
  //       // Handle errors
  //       print('Error: ${response.statusCode}');
  //       return Future(() => false);
  //     }
  //   }
  //   catch (error) {
  //     // Handle network or other errors
  //     print('Error: $error');
  //     return Future(() => false);
  //   }
  // }

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

      } else {
        print("failed");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: Text("Error of wishlist: ${value.error}")));
      }
      return true;
    });
  }

  void increment(product_id,numOfItems) {
    notifyListeners();
  }

  Future<bool> decrement(product_id) async {
    // if(_count > 0){
    //   _count--;
    removewishlist(product_id);
    notifyListeners();
    return true;
    // }
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(IntProperty('count', count));
  }

}


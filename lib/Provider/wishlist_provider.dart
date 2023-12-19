import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Models/AuthDio/DioSignIn.dart';
import '../Models/RestApiClient.dart';
import '../Models/WishList/DAOGetWishlist.dart';
import '../Utils/InMemory.dart';

class WishlistProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _wishlist_total_count = 0;
   int get wishlistcount => _wishlist_total_count;

   void totalcount(int count) {
     _wishlist_total_count = count;
     notifyListeners();
     print("wishlist_total_count");
     print(_wishlist_total_count);
     print("wishlistcount");
     print(wishlistcount);
   }

  String SessionId = "";

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
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar
        //   (content: Text("Item Added to Wishlist")
        // ));
        // totalcount(int count);
        return Future(() => true);
      }
      else {
        print("fail");
        return Future(() => false);
      }
    });
    return false;
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

  bool increment(product_id) {
    addwishlist(product_id);
    _wishlist_total_count++;
    notifyListeners();
    return true;
  }

  Future<bool> decrement() async {
    notifyListeners();
    return true;
  }

}
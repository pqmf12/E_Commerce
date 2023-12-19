import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AuthDio/DioSignIn.dart';
import '../Theme/theme_changer_provider.dart';

class InMemory{
  static var isLogged = false;
  static var customer_id = "";
  static var customer_group_id = "";
  static var store_id = "";
  static var language_id = "";
  static var firstname  = "";
  static var lastname = "";
  static var email  = "";
  static var telephone  = "";
  static var fax  = "";
  static var cart = "";
  static var wishlist = [];
  static var newsletter = "";
  static var address_id = "";
  static var custom_field = "";
  static var ip = "";
  static var status = "";
  static var approved = "";
  static var safe = "";
  static var code = "";
  static var date_added = "";
  static var custom_fields = [];
  static var account_custom_field = "";
  static var wishlist_total = "";
  static var cart_count_products = "";

  // Future getSession() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("session") ?? "";
  // }
  //
  // Future setSession(String session) async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString("session",session);
  // }

  Future init()  async {
  var prefs = await SharedPreferences.getInstance();
  isLogged = prefs.getBool("isLogged") ?? false;
  customer_id = prefs.getString("customer_id") ?? "";
  customer_group_id = prefs.getString("customer_group_id") ?? "";
  store_id = prefs.getString("store_id") ?? "";
  language_id = prefs.getString("language_id") ?? "";
  firstname  = prefs.getString("firstname") ?? "";
  lastname = prefs.getString("lastname") ?? "";
  email  = prefs.getString("email") ?? "";
  telephone  = prefs.getString("telephone") ?? "";
  fax  = prefs.getString("fax") ?? "";
  cart = prefs.getString("cart") ?? "";
  wishlist = prefs.getStringList("wishlist") ?? [];
  newsletter = prefs.getString("newsletter") ?? "";
  address_id = prefs.getString("address_id") ?? "";
  custom_field = prefs.getString("custom_field") ?? "";
  ip = prefs.getString("ip") ?? "";
  status = prefs.getString("status") ?? "";
  approved = prefs.getString("approved") ?? "";
  safe = prefs.getString("safe") ?? "";
  code = prefs.getString("code") ?? "";
  date_added = prefs.getString("date_added") ?? "";
  custom_fields = prefs.getStringList("custom_fields") ?? [];
  account_custom_field = prefs.getString("account_custom_field") ?? "";
  wishlist_total = prefs.getString("wishlist_total") ??"";
  cart_count_products = prefs.getString("cart_count_products") ??"";


  print('''    
    login ${isLogged}
    user_id ${customer_id}
    first_name ${firstname}
    last_name ${lastname}
    email ${email}
    phone ${telephone}
     wishlist ${ wishlist}
     wishlist_total ${ wishlist_total}
     adddress id ${address_id}
    ''');

  return Future(() => true);
  }

  Future getSession() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("session") ?? "";
  }

  Future setSession(String session) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("session", session);
  }

   Future setUser( UserInfo user,) async {
     var prefs = await SharedPreferences.getInstance();
     prefs.setBool("isLogged", true);
     prefs.setString("customer_id", user.customer_id ?? "");
     prefs.setString("customer_group_id", user.customer_group_id ?? "");
     prefs.setString("store_id ", user.store_id ?? "");
     prefs.setString("language_id ", user.language_id ?? "");
     prefs.setString("firstname ", user.firstname ?? "");
     prefs.setString("lastname", user.lastname ?? "");
     prefs.setString("email", user.email ?? "");
     prefs.setString("telephone ", user.telephone ?? "");
     prefs.setString("fax", user.fax ?? "");
     prefs.setString("cart", user.cart ?? "");
     prefs.setStringList("wishlist", user.wishlist ?? []);
     prefs.setString("newsletter", user.newsletter ?? "");
     prefs.setString("address_id", user.address_id ?? "");
     prefs.setString("custom_field", user.custom_field ?? "");
     prefs.setString("ip", user.ip ?? "");
     prefs.setString("status", user.status ?? "");
     prefs.setString("approved", user.approved ?? "");
     prefs.setString("safe", user.safe ?? "");
     prefs.setString("code", user.code ?? "");
     prefs.setString("date_added", user.date_added ?? "");
     prefs.setStringList("custom_field", user.custom_fields ?? []);
     prefs.setString("account_custom_field", account_custom_field) ?? "";
     prefs.setString("wishlist_total", wishlist_total) ??"";
     prefs.setString("cart_count_products", cart_count_products) ??"";

     return init().then((value) {
       return Future(() => true);
     });
   }

    Future logout() async {
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool  ("isLogged", false);
      prefs.setString("sessionID","");
      prefs.setString("customer_id","");
      prefs.setString("customer_group_id", "");
      prefs.setString("store_id ",  "");
      prefs.setString("language_id", "");
      prefs.setString("firstname ", "");
      prefs.setString("lastname", "");
      prefs.setString("email", "");
      prefs.setString("telephone", "");
      prefs.setString("fax", "");
      return Future(() => true);
   }


}
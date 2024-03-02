import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../Utils/InMemory.dart';
import 'AddCart.dart';
import 'DAOCart.dart';
import 'DAODeleteCart.dart';

class CartItemProvider  with ChangeNotifier,  DiagnosticableTreeMixin {

  CartItemProvider(){
    _loadCountFromPrefs();
  }

  // int _count = 0;
  //
  // int get count => _count;
  // static const String _countKey = 'cartItemCount';

  String SessionId = "";
  List<AddItem> data = [];
  List<ProductData> productdata  = [];
  ApiData? cartdata;
  int get totalProductCount =>  cartdata?.total_product_count ?? 0;

  Future<void> cartitems() async {
    SessionId = await InMemory().getSession();
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.getcart("123",
        SessionId,
        'default=$SessionId;'
    ).then((value)  {
      if(value.data.runtimeType != List) {
        print("VALUE:${value.data}");
        print(SessionId);
        cartdata = ApiData.fromJson(value.data);
        productdata!.clear();
        productdata!.addAll(cartdata!.products!);
        notifyListeners();
        print(JsonEncoder().convert(value.data));
        print(JsonEncoder().convert(productdata ));
      }
      else{
        productdata!.clear();
        cartdata = ApiData(total_product_count: 0);
        notifyListeners();
        print("fail");
      }
      return true;
    });
  }

  Future<void> addtocart(product_id,numOfItems) async {
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(product_id);
    client.additemcart("123",
        SessionId!,
        "application/json",
        "*/*",
        'default=$SessionId;',
        jsonEncode( {
          "product_id": product_id,
          "quantity": numOfItems})
     ).then((value) {
      if(value.success == 1){
        print("ADD TO CART success ::");
        print(SessionId);
        data.add(value.data!);
        cartitems();
        print(JsonEncoder().convert(value.data));
      }
      else{
        print("fail");
      }
      return true;
    });
  }

  DeleteData? removedata;
  Future<void> removeitems(key) async {
    SessionId = await InMemory().getSession();
    print("Removecart called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(SessionId);
    print("removeditem called  ");
    client.deletecartitem("123",
      SessionId,
      'default=$SessionId;',
      jsonEncode( {
        "key": key
      }),
    ).then((value)  {
      if(value.success == 1) {
        removedata = value.data;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Item Removed")));
        print("VALUE:${value.data}");
        print(SessionId);
        print("removeditem succefully");
        print(JsonEncoder().convert(value.data));
        // setState(() {
        //   productdata!.removeWhere((element) => element.key == key);
        cartitems();
        // });
      }
      else{
        print("fail");
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("${value.error}")));
      }return true;

    });
  }

  void increment(product_id,numOfItems) {
    // _count++;
    addtocart(product_id,numOfItems);
    _saveCountToPrefs(numOfItems);
    notifyListeners();
  }

  Future<bool> decrement(key) async {
    // if(_count > 0){
    //   _count--;
    removeitems(key);
      _saveCountToPrefs(key);
      notifyListeners();
      return true;
    // }
  }

  Future<void> _loadCountFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // _totalProductCount = prefs.getInt(totalProductCount) ?? 0;
    notifyListeners();
  }

  Future<void> _saveCountToPrefs(numOfItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(numOfItems,totalProductCount);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

}


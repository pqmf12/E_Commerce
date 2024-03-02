import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Models/Cart/DAOCart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Account/account.dart';
import '../Models/RestApiClient.dart';
import '../Utils/InMemory.dart';

class ProfileProvider with ChangeNotifier {

  ProfileProvider(){
    _loadprofile();
  }

  String SessionId = "";
  Profile profile = Profile();
  bool loaded = false;

  Future<void> getprofile() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    print(":getprofile called");
    client.account("123", SessionId, "application/json",
      'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
    ).then((value) {
      if(value.success == 1) {
        print("successs");
        profile =  value.data!;
        loaded = true;
        notifyListeners();
        print(JsonEncoder().convert(profile));
        return Future(() => true);
      } else{
        loaded = false;
        notifyListeners();
        return Future(() => false);
      }
    });
  }

  Future<void> update(String firstname,
  String lastname, String email, String phone) async {
    print("Update called");
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.update_profile(
        "123", SessionId, "application/json",
        'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
        json.encode({
          "firstname":  firstname,
          "lastname": lastname,
          "email": email,
          "telephone": phone,
        })
    ).then((value) {
      if (value.success == 1){
        print("object");
        _saveprofile();
        getprofile();
        notifyListeners();
        return Future(() => true);
      } else{
        return Future(() => false);
      }
    });
  }

  Future<void> _loadprofile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.getString(profile.firstname);
    await prefs.getString(profile.lastname);
    await prefs.getString(profile.email);
  }

  Future<void> _saveprofile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("firstname", profile.firstname);
    await prefs.setString("lastname", profile.lastname);
    await prefs.setString("email", profile.email);
  }
}
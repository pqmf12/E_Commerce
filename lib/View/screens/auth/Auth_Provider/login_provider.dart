import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Models/Session/session.dart';
import '../../../../Models/RestApiClient.dart';
import '../../../../Utils/InMemory.dart';

class LoginProvider with  ChangeNotifier, DiagnosticableTreeMixin {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLogged = false;

  Data setn =  Data();
  String  SessionId  = "";

  Future<void> session(email,password) async {
    final client = RestClient(Dio ());
    print("session called");
    client.Session("123", "application/json", "application/json", "voluptate")
        .then((value) {
      if(value.success == 1) {
        print("session success");
        setn = value.data!;
        print("Session ID: ${setn.session}");
        SessionId = setn.session;
        InMemory().setSession(setn.session);
        login(email,password);
        isLogged = true;
        notifyListeners();
        print("Sesseion: $SessionId");
        return Future(() => true);
      }else{
        print("fail");
        notifyListeners();
        return Future(() => false);
      }
    });
  }

  Future<void> login(email,password) async {
    print("login called");
    final client = RestClient(Dio());
    print(emailController.text);
    print(passwordController.text);
    client.getLogin(
      jsonEncode({
        "email": email, "password": password,
      }),
      SessionId, '123',
      'PHPSESSID=$SessionId; currency=USD; default=$SessionId; language=en-gb',
    ).then((value) {
      print("emailController.text" + emailController.text);
      print("passwordController.text" + passwordController.text);
      print("sessioid... ${SessionId}");
      if (value.success == 1) {
        print("Logged In");
        print(JsonEncoder().convert(value.data));
        isLogged = true;
        notifyListeners();
        return Future(() => true);
      }
      else {
        print("something went wrong  ?? ""}");
        notifyListeners();
        return Future(() => false);
      }
    });
  }

  Future<void> loggedin(email,password) async {
    await session(email,password);
    return Future(() => true);
  }

  void logout(){
    isLogged = false;
    notifyListeners();
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }

}
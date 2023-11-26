 import 'package:dio/dio.dart';
 import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import '../Models/Session/session.dart';

String SessionId = "";

 Data setn =  Data();
 void session() {
   final client = RestClient(Dio ());
   print("session called");
   client.Session("123", "application/json", "application/json", "voluptate")
       .then((value) {
     if(value.success == 1) {
       print("session success");
       setn = value.data!;
       print("Session ID: ${setn.session}");
       // InMemory().setSession(setn.session);
       SessionId = setn.session;
       print(SessionId);
     }else{
       print("fail");
     }
   });
 }
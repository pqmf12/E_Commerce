import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import '../../../Models/UTC/DAOOffset.dart';
import '../../../Utils/InMemory.dart';

class Timezonepage extends StatefulWidget {
  const Timezonepage({Key? key}) : super(key: key);

  @override
  State<Timezonepage> createState() => _TimezonepageState();
}

class _TimezonepageState extends State<Timezonepage> {

  bool _isChecked = false;

  void _handleCheckboxChange(bool? value) {
    if (value != null) {
      setState(() {
        _isChecked = value;
      });
    }
  }

  String SessionId = "";
  Utc offsetdata = Utc();
  void Offset() async{
    final client = RestClient(Dio());
    print("utc called");
    SessionId = await InMemory().getSession();
    client.UtcOffset("123", SessionId, "application/json")
        .then((value) {
      if  (value.success == 1){
        print("sucees");
        offsetdata = (value.data)!;
        print(SessionId);
      }else{
        print("fail");
      }
      setState(() {

      });
    });
  }

  @override
  void initState() {
    Offset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your Timezone"),
        actions: [
          TextButton(onPressed: ( ){},
              child: Text("Save",style: TextStyle(fontSize: 18),)),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     offsetdata.offset.toString() ?? "216",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),),
                    Checkbox(
                      value: _isChecked,
                      onChanged: _handleCheckboxChange,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

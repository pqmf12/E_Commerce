import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:opencart_ecommapp1/Utils/InMemory.dart';
import '../../../Models/Banner/DAOBannerDetail.dart';

class BannerDetails extends StatefulWidget {
   BannerDetails({Key? key, required this.id, this.title}) : super(key: key);
   final  id;
   final title;

  @override
  State<BannerDetails> createState() => _BannerDetailsState();
}

class _BannerDetailsState extends State<BannerDetails> {

  @override
  void initState() {
    super.initState();
    BannerDetails();
  }

  List<BannerData> bannerdetail = [];

  String SessionId = "";
  void BannerDetails() async{
    final client = RestClient(Dio());
    SessionId = await InMemory().getSession();
    client.bannersdetails("123", SessionId, "application/json", widget.id)
        .then((value) {
      if (value.success == 1) {
        bannerdetail.addAll(value.data!);
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget!.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  itemCount: bannerdetail.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    var i = bannerdetail[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder
                        //     : (context) => SubCategory(id: i.category_id, name: i.name,
                        // )));
                      },
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 65,
                            child: Center(
                                child: Image.network(
                                  i.image,
                                  fit: BoxFit.fill,)),
                          ),
                          SizedBox(height: 8,),
                          Center(
                            child: Text(i.title,
                              style: TextStyle(
                                  // color: Colors.black,
                                  fontSize: 16),),
                          ),
                          // SizedBox(height: 8,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     TextButton(onPressed: (){},
                          //       child: Text(i.link),),
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

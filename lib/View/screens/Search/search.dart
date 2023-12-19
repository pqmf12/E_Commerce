import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Models/RestApiClient.dart';
import 'package:dio/dio.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../Models/Search/search.dart';
import '../../../Product/product_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textcontroller = TextEditingController();
  SpeechToText speechToText = SpeechToText();
  var text = " ";
  bool loaded = false;
  bool isloading = false;
  List<Searchproducts>  resultdata = [];
  var isListening = false;

  void fetchproduct() {
    final client = RestClient(Dio());
    client.search("123", "application/json", textcontroller.text)
    .then((value) {
         if(value.success == 1) {
           print("success");
           resultdata.addAll(value.data!);
         }else{
           print("fail");
         }
         setState(() {
           loaded = true;
           isloading = false;
         });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 45,
          child: TextField(
            controller: textcontroller,
            onSubmitted: (val) {
              loaded = false;
              isloading = true;
              setState(() {});
              resultdata.clear();
              fetchproduct();
            },
            decoration: InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(vertical: -4),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTapDown: (details) async{
                          if(!isListening){
                            var available = await speechToText.initialize();
                            print("started");
                            if(available){
                              setState(() {
                                isListening = true;
                                speechToText.listen(
                                  onResult: (result){
                                    setState(() {
                                       text = result.recognizedWords;
                                       textcontroller.text = text;
                                      print("Text: $text");
                                    });
                                  },
                                );
                              });
                            }
                          }
                      },
                      onTapUp: (details){
                       // if (isListening) {
                        setState(() {
                          isListening = false;
                        });
                        speechToText.stop();
                        print("Stop");
                      // }
                       },
                      child: CircleAvatar(
                        radius: 18,
                        child: Icon(isListening ? Icons.mic : Icons.mic_none,),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        textcontroller.clear();
                        resultdata.clear();
                        setState(() {});
                      },
                    ),
                  ],
                ),
                hintStyle: TextStyle(fontSize: 14),
                hintText: "Search here",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (isloading) ? Center(
              child: CircularProgressIndicator(backgroundColor: Colors.white,),)
           : (loaded && resultdata.isEmpty) ? Center(child: Text("No Result Found "))
           : GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                childAspectRatio: 0.70,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // itemCount: resultdata.length,
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     mainAxisSpacing: 12,
                //     crossAxisSpacing: 5,
                //     childAspectRatio: 0.60),
                // itemBuilder: (context, index) {
                children: List.generate(
                resultdata.length,
                  (index)  {
                  var i = resultdata[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 245, width: 165,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink.shade50,
                                  Colors.pink.shade50,
                                  Colors.red.shade50,
                                ]
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.red.shade200),
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                          child: Column(
                            children: [
                              SizedBox(height: 8,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder:
                                      (context) =>
                                      ProductDetailScreen(id: i.product_id,)
                                  ));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.0,),
                                  child: Center(
                                    child: SizedBox(
                                      height: 145, width: 155,
                                      child: Image.network(
                                        i.original_image,
                                        fit: BoxFit.cover,),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text(
                                i.name,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),),
                              Text(
                                "Price: ${i.price_formated}",
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ),
          ],
        ),
      ),
    );
  }
}

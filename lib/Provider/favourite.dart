import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Provider/My_fav.dart';
import 'package:provider/provider.dart';

import 'favourite_item.dart';

class Favouritepage extends StatefulWidget {
   Favouritepage({Key? key}) : super(key: key);

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    final favouriteItem = Provider.of<FavouriteItemProvider>(context);
    print("fav_build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder:
        //         (context) => MyFavouriteItemScreen()));
        //       },
        //       icon: Container(
        //           width: 40.0,
        //           height: 40.0,
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle, // Your favorite icon color when it's not selected
        //           ),
        //           child: Center(child: Icon(Icons.favorite))))
        // ],

        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                              (context) => MyFavouriteItemScreen()));
                  // Handle your favorite icon tap here
                  // You can add the logic to toggle the favorite state or navigate to a different screen, etc.
                },
                icon: Icon(
                  Icons.favorite,
                   color: Colors.red,
                   // / Your favorite icon color when it's not selected
                ),
              ),
                Positioned(
                  right: 5.0,
                  top: 2.0,
                  child: Container(
                    height: 20,width: 20,
                    // padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        favouriteItem.selectedItem.length.toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
         Expanded(
           child: ListView.builder(
               itemCount: 100,
               itemBuilder: (context, index) {
                 return Consumer<FavouriteItemProvider>(builder: (context, value, child) {
                   return  ListTile(
                     onTap: (){
                       if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                       }else{
                         value.addItem(index);
                       }
                     },
                     title: Text("Item no. " +index.toString()),
                     trailing: value.selectedItem.contains(index)
                         ? Icon(Icons.favorite)
                         : Icon(Icons.favorite_outline),
                   );
                 });
               }),
         )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_item.dart';

class MyFavouriteItemScreen extends StatefulWidget {
   MyFavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteItem = Provider.of<FavouriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
       title: Text("Favourite List"),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
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
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteItem.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(builder:
                      (context, value, child) {
                    return  ListTile(
                      onTap: (){
                        if(favouriteItem.selectedItem.contains(index)){
                          // value.addItem(index);
                          favouriteItem.removeItem(index);
                        }
                        else {
                        // value.removeItem(index);
                          value.addItem(index);
                        }
                      },
                      title: Text("Item no. " +index.toString()),
                      trailing: favouriteItem.selectedItem.contains(index)
                          ?  Icon(Icons.favorite_outline)
                          :  Icon(Icons.favorite)  ,
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavouriteItemProvider  with ChangeNotifier  {

   List<int> _selectedItem = [];
   List<int> get selectedItem => _selectedItem ;

   void addItem (int value){
     _selectedItem.add(value);
     notifyListeners();
     print("item added");
   }

   void removeItem (int value){
     _selectedItem.remove(value);
     notifyListeners();
     print("item removed");
   }
}


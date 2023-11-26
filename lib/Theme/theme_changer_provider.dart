import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeChanger() {
    initializeTheme();
  }

  void initializeTheme() async {
   var _prefs = await SharedPreferences.getInstance();
    bool isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> setTheme(themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    var _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('isDarkMode', themeMode == ThemeMode.dark);
  }

}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontChanger with ChangeNotifier {
  // var _fontSize = ThemeData().textTheme;
  //
  // TextTheme get fontSize => _fontSize;

  var _fontSize = 16.0; // Set a default font size

  double get fontSize => _fontSize;


  FontChanger() {
    initializeTheme();
  }

  void initializeTheme() async {
    // var _prefs = await SharedPreferences.getInstance();
    // bool isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    // _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> setTheme(fontSize) async {
    _fontSize = fontSize;
    notifyListeners();
    // var _prefs = await SharedPreferences.getInstance();
    // _prefs.setBool('isDarkMode', themeMode == ThemeMode.dark);
  }

  TextTheme get customTextTheme {
    return GoogleFonts.k2dTextTheme(
      ThemeData().textTheme.copyWith(
        headline1: ThemeData().textTheme.headline1!.copyWith(fontSize: _fontSize),
        headline2: ThemeData().textTheme.headline2!.copyWith(fontSize: _fontSize),
        // Add more text styles as needed
      ),
    );
  }
}

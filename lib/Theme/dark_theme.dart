import 'package:flutter/material.dart';
import 'package:opencart_ecommapp1/Theme/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           RadioListTile<ThemeMode>(
               title: Text("Light Mode"),
               value: ThemeMode.light,
               groupValue: themeChanger.themeMode,
               onChanged: themeChanger.setTheme
           ),
          RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme
          ),
        ],
      ),
    );
  }
}

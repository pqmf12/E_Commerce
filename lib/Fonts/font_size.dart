import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Font_changer.dart';

class FontSize extends StatefulWidget {
  const FontSize({Key? key}) : super(key: key);

  @override
  State<FontSize> createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  // double _fontsize = 16.0;

  @override
  Widget build(BuildContext context) {
    final fontChanger = Provider.of<FontChanger>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Builder(
                builder: (context)
                => Text("absdjlkjfd",style: TextStyle(fontSize: fontChanger.fontSize),
                )),
            SizedBox(
                width: 280,
                child: Slider(
                  // value: _fontsize,
                  value: fontChanger.fontSize,
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  min: 10.0,
                  max: 40.0,
                  onChanged: (value) {
                    fontChanger.setTheme(value);
                  }
                  //     (value) {
                  //   setState(() {
                  //     _fontsize = value;
                  //   });
                  // },
                )),
          ],
        ),
      ),
    );
  }
}

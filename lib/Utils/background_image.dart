import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({
    Key, key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.red.shade100, Colors.pink.shade50],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        // height: 200,
        // width: 300,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn.pixabay.com/photo/2015/01/07/16/37/wood-591631_640.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.red.shade50, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}

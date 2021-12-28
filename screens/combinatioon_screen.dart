import 'package:flutter/material.dart';


import 'classpage_screen.dart';

void main() => runApp(new CombinationsScreen());

class CombinationsScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Make your daily combination',
      theme: new ThemeData(
        fontFamily: "Bryndan",
        primaryColor: Color(0xFF06630b),
        scaffoldBackgroundColor: Color(0xFFD0FFBC)
      ),
      home: Center(child: new MyHomePage(title: 'Make your daily combination')),
    );
  }
}
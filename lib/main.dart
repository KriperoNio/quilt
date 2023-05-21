import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:quilt/pages/MainPage.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen[700],
        scaffoldBackgroundColor: Colors.lightGreen[800],
        primarySwatch: Colors.lightGreen,
        primaryColorLight: Colors.lightGreen,
        primaryColorDark: Colors.lightGreen[400],
        disabledColor: Colors.lightGreen[700],
        highlightColor: Colors.lightGreen[50],
        cardColor: Colors.greenAccent,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.green[900],
        scaffoldBackgroundColor: Colors.green[150],
        primarySwatch: Colors.green,
        primaryColorDark: Colors.green, 
        primaryColorLight: Colors.green[700],
        disabledColor: Colors.green[900],
        highlightColor: Colors.green[250],
        cardColor: Colors.greenAccent,
      ),
      home: const MainPage(),
    );
  }
}

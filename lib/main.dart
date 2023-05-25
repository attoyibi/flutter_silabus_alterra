import 'package:flutter/material.dart';
import 'HomePage.dart';
// ++++++++++++++MyStatelessWidget+++++++++++++++++++

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get blue => null;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
    );
  }
}

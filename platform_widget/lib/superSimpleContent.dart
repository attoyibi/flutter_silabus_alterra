import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Perbaiki penulisan constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'platform widget',
      theme: ThemeData(primaryColor: Colors.amber.shade50),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        body: Text("hello, world"),
      ),
    );
  }
}

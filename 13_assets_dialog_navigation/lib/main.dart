import 'package:flutter/material.dart';
import 'jawaban/galeri.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("List Galeri"),
        ),
        body: MyGridView(),
        // bottomSheet: BottomSheet(builder: , onClosing: () {  },),
      ),
    );
  }
}

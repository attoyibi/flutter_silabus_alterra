import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_and_global_state/viewmodel/my_data.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${myData.myData.data}"), // Menggunakan data yang diterima
      ),
      body: Center(
        child: Text('Ini adalah halaman beranda.'),
      ),
    );
  }
}

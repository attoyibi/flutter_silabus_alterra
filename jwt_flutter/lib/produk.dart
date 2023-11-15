import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
 @override
 _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 List _products = [];

 Future<void> fetchProducts() async {
  final response = await http.get('https://example.com/api/products');

  if (response.statusCode == 200) {
    setState(() {
      _products = jsonDecode(response.body);
    });
  } else {
    throw Exception('Failed to load products');
  }
 }

 @override
 void initState() {
  super.initState();
  fetchProducts();
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Products')),
    body: ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_products[index]['name']),
          subtitle: Text('\$${_products[index]['price']}'),
        );
      },
    ),
  );
 }
}


// jwt yang bagus 

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProductPage extends StatefulWidget {
 @override
 _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 List _products = [];

 Future<void> fetchProducts() async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
 String jwtToken = prefs.getString('jwt');

 final response = await http.get(
   Uri.parse('https://example.com/api/products'),
   headers: {
     'Authorization': 'Bearer $jwtToken',//jwt token didapatkan dari local storage
   },
 );

 if (response.statusCode == 200) {
   setState(() {
     _products = jsonDecode(response.body);
   });
 } else {
   throw Exception('Failed to load products');
 }
 }

 @override
 void initState() {
 super.initState();
 fetchProducts();
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(title: Text('Products')),
   body: ListView.builder(
     itemCount: _products.length,
     itemBuilder: (context, index) {
       return ListTile(
         title: Text(_products[index]['name']),
         subtitle: Text('\$${_products[index]['price']}'),
       );
     },
   ),
 );
 }
}

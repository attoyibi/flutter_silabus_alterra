import 'package:flutter/material.dart';
import 'package:muchson/view/widget/navigation_drawer.dart';

class DetailImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerMuchson(),
      appBar: AppBar(
        title: Text('Detail Image'),
      ),
      body: Center(
        child: Text(
          'Ini adalah detail image',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

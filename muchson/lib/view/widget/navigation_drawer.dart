import 'package:flutter/material.dart';

class NavigationDrawerMuchson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text('Galeri muchson'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/contact');
            },
            child: Text('Contact'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String jwtToken;

  @override
  void initState() {
    super.initState();
    checkJwtToken();
  }

  Future<void> checkJwtToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jwtToken = prefs.getString('jwt');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (jwtToken == null) {
      return CircularProgressIndicator();
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Center(child: Text('Home')),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final Dio _dio = Dio();

  Future<Response> login(String username, String password) {
    return _dio.post(
      'http://localhost:8000/verify-otp',
      data: {
        'phone_number': username,
        'otp': password,
      },
    );
  }

  Future<void> saveOtp(String jwt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _username,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                //usernmame dan password sudah di validasi maka akan menajlankan method berkut
                //Login
                // login(_username.text, _password.text);
                var response = await login(
                  _username.text,
                  _password.text,
                );
                if (response.statusCode == 200) {
                  //akan disimpan di acces token / local storage
                  //akan diarahkan ke halaman selanjutnya
                  String jwt = response.toString();
                  await saveOtp(jwt);
                } else {
                  // maka akan keluar notifikasi
                }
                // print('response = $jwt');
              },
            ),
          ],
        ),
      ),
    );
  }
}

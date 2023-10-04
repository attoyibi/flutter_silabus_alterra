import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Isi dengan elemen-elemen Sign In seperti TextFormField, TextFormField, dll.
            Text('Halaman Sign In'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika Sign In di sini
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/sign_up');
              },
              child: Text('Belum punya akun? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

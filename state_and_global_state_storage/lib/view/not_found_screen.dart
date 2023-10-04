import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Halaman tidak ditemukan',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Kembali ke halaman sebelumnya atau halaman utama jika perlu
                Navigator.of(context).pop();
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

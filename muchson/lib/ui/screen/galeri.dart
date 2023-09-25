import 'package:flutter/material.dart';
import 'package:muchson/main.dart';

class Galeri extends StatelessWidget {
  const Galeri({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan warna primer dari tema
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri Screen'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Images dengan File'),
              Image(image: AssetImage('assets/kampus_merdeka.jpeg')),
              Image(image: AssetImage('assets/images/cabinets.png')),
              Text('Images dengan url'),
              Image.network(
                  'https://cdn.idntimes.com/content-images/post/20200414/cover-artikel-0ec0e8f5f3d38952e5f427c826b4f936_600x400.jpg',
                  width: 200,
                  height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

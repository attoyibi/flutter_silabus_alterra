import 'package:flutter/material.dart';

// Failed to launch Pixel_3a_API_33_x86_64: Error: Emulator didn't connect within 60 seconds
// flutter emulators --launch Pixel_3a_API_33_x86_64
void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatelessWidget {
  const HelloWord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark(), // Mengatur tema gelap
        // initialRoute: 'home',
        // routes: {
        //   'home': (_) => HomePage(),
        // },
        home: Scaffold(
      appBar: AppBar(
        title: Text('Muchson App'),
      ),
      body: Center(
        child: Text('material'),
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('ini merupakan menu home page')],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatelessWidget {
  const HelloWord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        title: const Text('Hai nama ku Muchson'),
      ),
    );
  }
}

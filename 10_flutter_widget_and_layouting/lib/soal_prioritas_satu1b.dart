import 'package:flutter/material.dart';

class SoalPrioritasSatu1b extends StatelessWidget {
  const SoalPrioritasSatu1b({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData.dark(),
        home: Scaffold(
      appBar: AppBar(title: const Text("MaterialApp")),
      body: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        children: [
          Icon(Icons.abc),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: RoundedTextWidget(
              text: 'L',
              radius: 50.0,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                'text',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('DrawerHeader',
                    style: TextStyle(color: Colors.white, fontSize: 24))),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => {
                print('Home ListTile tapped'), // Log message to the console
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            )
          ],
        ),
      ),
    ));
  }
}

class RoundedTextWidget extends StatelessWidget {
  final String text;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  RoundedTextWidget({
    required this.text,
    required this.radius,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

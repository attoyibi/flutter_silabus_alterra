import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'platform widget',
      theme: ThemeData(primaryColor: Colors.amber.shade50),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    //===kalau tanpa setState ada pada contoh di bawah.
    // _counter++;
    // print('User entered: $_counter');

    //set state harus di ikutkan kalau kalian ingin tampilan pad apps berubah
    //setState merupakan bagian dari statefull maka dari itu gak bisa di panggil dalam widget stateless
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //semua yang di tampilkan itu ada di dalam return, jadi kita dapat memasukkan logic diluar dari return. contoh pada default number dibawah
    int default_number = 70;
    //scafold sebenernya ada function pada umumnya dan appBar: merupakan parameternya.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter' + '$default_number',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

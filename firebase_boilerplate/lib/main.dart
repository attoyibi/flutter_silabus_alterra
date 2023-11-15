import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _checkFirebase() {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Auth di firebase dengan flutter'),
            ElevatedButton(
                onPressed: () {
                  try {
                    final result = FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: "muhammad@coba.con", password: "123456");
                    print('object');
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text("Daftar Auth")),
            ElevatedButton(
                onPressed: () {
                  try {
                    final result = FirebaseAuth.instance
                        .authStateChanges()
                        .listen((User? user) {
                      if (user != null) {
                        print(user.uid);
                      }
                    });
                    ;
                    print('object');
                  } on Exception catch (e) {
                    print(e);
                  }
                },
                child: Text("Check User Terdaftar")),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: "muhammad@coba.con", password: "123456");
                    print(result);
                  } on Exception catch (e) {
                    print(e);
                    print("Username atau Password Salah");
                  }
                },
                child: Text("Check email muhammad@coba.con")),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/flutter-boilerplate-39ee6.appspot.com/o/icon_play.png?alt=media&token=502218a9-a996-4fe6-878a-73804e3d861f&_gl=1*4vayuy*_ga*MTE3NjQ3MzA5Mi4xNjk0MjczMzEz*_ga_CW55HF8NVT*MTY5Nzg1NDUyMC4xNi4xLjE2OTc4NTU5MTQuMjkuMC4w',
            ),
          ],
        ),
      ),
    );
  }
}

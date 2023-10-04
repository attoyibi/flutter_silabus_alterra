import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInWidget(), // Routing ke widget SignIn
        '/home': (context) => MyHomePage(
            title: 'Flutter Demo Home Page'), // Routing ke widget MyHomePage
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  Future<void> _loadCounter() async {
    print('load Counter');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  //membuat method untuk melakukan pengecekan, apakah username dan passwordnya ada
  Future<void> _cekStatus() async {
    print('load _cekStatus');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('username') == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
    // if (arahkan ke data dummy apakah usernama yang di masukkan  == username dari user) {
    //   Navigator.pushReplacementNamed(context, '/');
    // }
    // if (arahkan ke data endpint back end  == username dari user) {
    //   Navigator.pushReplacementNamed(context, '/');
    // }
  }

  @override
  void initState() {
    print('init State');
    super.initState();
    _loadCounter();
    _cekStatus();
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () async {
                  // hapus semua username dan password pada local storage
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    prefs.remove('username');
                    prefs.remove('password');
                  });
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Text("Logut")),
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

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                // Handle login logic here
                final username = _usernameController.text;
                final password = _passwordController.text;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                // Perform authentication or other actions here
                // You can check the username and password and navigate accordingly
                setState(() {
                  prefs.setString('username', username);
                  prefs.setString('password', password);
                });
                // For now, we'll just print the values
                print('Username: $username');
                print('Password: $password');
                // Navigasi ke /home setelah login berhasil
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

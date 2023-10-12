import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const MyHomePage(title: 'Basic Dio'),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  List<Map<String, dynamic>> userData = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();

  void fetchData() async {
    final response =
        await dio.get('https://631d6133789612cd07a9ce1d.mockapi.io/users');
    setState(() {
      userData = List<Map<String, dynamic>>.from(response.data);
    });
  }

  Future<void> insertData() async {
    final name = nameController.text;
    final nomor = nomorController.text;
    final response = await dio.post(
      'https://631d6133789612cd07a9ce1d.mockapi.io/users',
      data: {'name': name, 'nomor': nomor},
    );
    fetchData(); // Memuat ulang data setelah penghapusan
    nameController.clear();
    nomorController.clear();
  }

  Future<void> chatBot() async {
    final name = nameController.text;
    final nomor = nomorController.text;
    final response = await dio.post(
      'openai',
      data: {'name': name, 'nomor': nomor},
    );
    fetchData(); // Memuat ulang data setelah penghapusan
  }

  Future<void> deleteData(String userId) async {
    final response = await dio
        .delete('https://631d6133789612cd07a9ce1d.mockapi.io/users/$userId');
    fetchData(); // Memuat ulang data setelah penghapusan
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: nomorController,
              decoration: InputDecoration(labelText: 'Nomor'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: insertData,
              child: Text("Insert Data"),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: userData.length,
                itemBuilder: (context, index) {
                  final user = userData[index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['nomor'].toString()),
                    trailing: ElevatedButton(
                      onPressed: () {
                        deleteData(user['id']);
                      },
                      child: Text("Delete"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";

  void _login() async {
    const name = "username1";
    const nomor = "password1";
    final Dio dio = Dio();
    try {
      // Tambahkan header x-hasura-admin-secret
      final options = Options(headers: {
        'x-hasura-admin-secret':
            'czDj5dPScZhMz4EgkUmNCAwTrAp5ah10B8U7uXJgeLsozTJjTP2UEvSg7YTTFPVV'
      });
      //login dengan post dio, dengan data yang dumasukkan pada controller name dan passowrd
      final response = await dio.get(
        'https://calm-dog-31.hasura.app/api/rest/login',
        queryParameters: {
          'username': name,
          'password': nomor,
          'id':
              '7a346d4c-7786-47e0-bf53-6f5a58229cf9', // Ganti dengan id yang sesuai
        },
        options: options, // Tambahkan opsi ke permintaan
      );
      if (response.statusCode == 200) {
        print('Login berhasil ${response.data['user']["access_token"]}');
        //cokie/locatstore storage
        // setStore disini. jadi nanti accestoken, akan disimpan pada local storage/cokie/session
      } else {
        print('Login gagal. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan saat login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                onChanged: (value) {
                  _username = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

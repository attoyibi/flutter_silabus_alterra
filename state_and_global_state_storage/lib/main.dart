import 'package:flutter/material.dart';
// import 'package:state_and_global_state/home.dart';
import 'package:provider/provider.dart';
import 'package:state_and_global_state/home.dart';
// import 'package:state_and_global_state/viewmodel/my_data.dart'; // Import Provider package

class MyData {
  String data;

  MyData({required this.data});
}

class MyDataProvider extends ChangeNotifier {
  MyData _myData = MyData(data: 'Data Awal1111');
  List listUser = [];
  MyData get myData => _myData;

  // method
  void updateData(String newData) {
    print("new Data dari provider = $newData");
    _myData = MyData(data: newData);
    notifyListeners();
  }

  // method data
  void insertData(String newData) {
    //logic untuk mengubah data awal yang ada, di dapatkan dari form yang telah dibuat.
    listUser.add(newData);
    notifyListeners();
  }
}

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyDataProvider(), child: MyApp()));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(title: 'homepage111'),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
        ),
        body: Column(
          children: [
            MyForm(), // Menampilkan form
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: MyHomePage(
                  title: 'homepage111'), // Menampilkan widget home page
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _textFieldController = TextEditingController();
  String _formData = ''; // State untuk menyimpan data dari form

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: 'Masukkan Data',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Menyimpan data dari form ke dalam provider MyDataProvider
            Provider.of<MyDataProvider>(context, listen: false)
                .updateData(_textFieldController.text);
            Provider.of<MyDataProvider>(context, listen: false)
                .insertData(_textFieldController.text);
            // print('${_textFieldController.text}');
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}

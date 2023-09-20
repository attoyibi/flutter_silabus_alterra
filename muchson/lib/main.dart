import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List data_kontak = [
  {
    "title": "Kepala SUku",
    "jenis_kelamin": "Laki-laki",
  },
  {
    "title": "Guru Bahasa Cinta",
    "jenis_kelamin": "perempuan",
  },
  {
    "title": "Bendahara Sekolah",
    "jenis_kelamin": "Laki-laki",
  },
  {"title": "Guru Matematika", "jenis_kelamin": "Perempuan"},
  {"title": "Guru Biologi", "jenis_kelamin": "Laki-laki"}
]; // data  akan  kita dapatkan dari API temen2 back end

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HelloWord();
  }
}

class HelloWord extends StatefulWidget {
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  var dropDownValue = 0;
  var checkValue = false;
  var inputControllers = TextEditingController();
  var radioValue = '';
  List<String> checkboxValue = [];
  var isCheckbox1 = false;
  String textFieldData = ''; // Tambahkan ini
  //dua variabel yang dibuat jika ingin menggunakan date
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed,
    //     MaterialState.hovered,
    //     MaterialState.focused,
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.green;
    //   }
    //   return Colors.grey;
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Muchson App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: []),
              SizedBox(
                height: 60,
              ),
              Text('List Kelas D'),
              TextField(
                controller: inputControllers,
                onChanged: (inputControllers) {
                  print('$inputControllers');
                },
              ),
              Row(
                children: [
                  Radio(
                      value: 'Laki-laki',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Laki - laki'),
                ],
              ),

              Row(
                children: [
                  Radio(
                      value: 'Perempuan',
                      groupValue: radioValue,
                      onChanged: (String? value) {
                        setState(() {
                          //logic dari radio button itu  dimasukkan
                          radioValue = value ?? '';
                          print('Nilai  dari radio value =  $radioValue');
                        });
                      }),
                  Text('Perempuan'),
                ],
              ),
              //checkbox simple
              Divider(),

              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    data_kontak.add({
                      "title": "${inputControllers.text}",
                      "jenis_kelamin": "$radioValue",
                      "skill": "$checkboxValue"
                    });
                  });

                  print('data_kontak : $data_kontak');
                },
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: data_kontak.length, //3
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: FlutterLogo(),
                          title: Text('${data_kontak[index]["title"]}'),
                          subtitle:
                              Text('${data_kontak[index]["jenis_kelamin"]}'),
                          trailing: Wrap(children: [
                            IconButton(
                                onPressed: () {
                                  //1. kita harus memasukkan datanya ke dalam onpress
                                  // print('delete $data_kontak');
                                  //2. setelah didapatkan datanya, maka kita olah sehingga data tersebut dihapus ketika tombol di tekah
                                  setState(() {
                                    data_kontak.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () => AlertEdit(context, index),
                                icon: Icon(Icons.edit))
                          ]),
                        );
                      })),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<String?> AlertEdit(BuildContext context, int index) {
    final contact = data_kontak[index]['title'];
    final radioJenisKelamin = data_kontak[index]['jenis_kelamin'];
    TextEditingController nameControllerEdit =
        TextEditingController(text: contact);

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: Column(children: [
                Text('nama'),
                TextField(
                  controller: nameControllerEdit,
                ),
                // buat radio button
                // dalem value di radio button, kamu masukin set up valuenya sama dengan radioJenisKelamin
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      //logika untuk menindih value berdsarkan index
                      print(data_kontak);
                      setState(() {
                        data_kontak[index]["title"] = nameControllerEdit.text;
                      });
                      Navigator.pop(context);
                      print(data_kontak);

                      print('submit edit');
                    },
                    child: Text('Submit Edit')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: Text('Cancel'))
              ],
            )
        // 1. kita panggil semua data
        // print('edit $data_kontak');
        // 2. munculin box baru (show dialog/alert dialog)
        // 3. di dalam box itu (show dialog/alert dialog) membuat form untuk memperharui data
        // 4. masukkan data sebelumnya ke alert dialog tersebut(tempat kita untuk mendapatkan data baru)
        // 5. ketika button di klik, maka data akan berganti
        );
  }
}

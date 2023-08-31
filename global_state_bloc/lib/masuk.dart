import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(name());
}

class name extends StatefulWidget {
  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  // const name({Key key}) : super(key: key);
  String _inputText = ''; // State untuk menyimpan input dari form
  String _inputText2 = ''; // State untuk menyimpan input dari form
  var namaEdit = '';
  var subtitleEdit = '';
  List listContacts = [
    {
      'title': "Contacts1",
      'subtitle': "subContacts1",
    },
    {
      'title': "Contacts2",
      'subtitle': "subContacts2",
    },
    {
      'title': "Contacts3",
      'subtitle': "subContacts3",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Task Form soal nomor 1',
      home: Scaffold(
        appBar: AppBar(title: const Text('Contacts')),
        body: ListView(
          padding: const EdgeInsets.only(top: 20, left: 70, right: 70),
          children: [
            const Icon(Icons.phone),
            const Text(
              'Create New Contacts  1',
              style: TextStyle(fontFamily: 'italic'),
            ),
            const Text(
              'A dialog is a type of modal windows that appears in front of app content to provide citical information or prompt for decision to be made',
              style: TextStyle(fontFamily: 'italic'),
            ),
            const Divider(),
            Container(
              color: const Color.fromARGB(255, 211, 193, 236),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _inputText =
                        value; // Update state ketika input berubah // Update state ketika input berubah
                  });
                  print(_inputText);
                },
                // controller: TextEditingController(text: 'hai'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                  // Change the background color here
                ),
              ),
            ),
            Container(
              child: const Padding(padding: EdgeInsets.only(top: 8)),
            ),
            Container(
              color: const Color.fromARGB(255, 211, 193, 236),
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _inputText2 = value; // Update state ketika input berubah
                    });
                    print(_inputText2);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nomor +62',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomRight,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(20)),
              //   color: Color(0xFF6200EE),
              // ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return const Color(0xFF6200EE);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                // onChanged: (value) {
                //     setState(() {
                //       _inputText2 = value; // Update state ketika input berubah
                //     });
                //     print(_inputText2);
                //   },
                onPressed: () {
                  setState(() {
                    listContacts.add(
                        {'title': '$_inputText', 'subtitle': '$_inputText2'});
                  });
                  print(listContacts);
                },
                child: Text('submit'),
              ),
            ),
            const Text(
              'List Contacts',
              style: TextStyle(fontSize: 24),
            ),
            ListView.builder(
              itemCount: listContacts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  // tileColor: Colors.amber,
                  // title: Text('$_inputText'),
                  title: Text(listContacts[index]['title']),
                  leading: Container(
                    child: const Center(
                      child: Text(
                        "L",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  subtitle: Text(listContacts[index]['subtitle']!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            // Set default values here
                            namaEdit = listContacts[index]['title'];
                            subtitleEdit = listContacts[index]['subtitle'];
                            return AlertDialog(
                              title: const Text('Edit Data'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: listContacts[index]['title']),
                                      onChanged: (value) {
                                        namaEdit = listContacts[index]
                                            ['title'] = value;
                                        print(value);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: TextEditingController(
                                          text: listContacts[index]
                                              ['subtitle']),
                                      onChanged: (value) {
                                        subtitleEdit = listContacts[index]
                                            ['subtitle'] = value;
                                        print(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      listContacts[index]['title'] = namaEdit;
                                      listContacts[index]['subtitle'] =
                                          subtitleEdit;
                                    });
                                    print('$namaEdit');
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        ),
                        splashRadius: 20,
                      ),
                      IconButton(
                          icon: const Icon(Icons.delete),
                          splashRadius: 20,
                          onPressed: () {
                            //logic to delete
                            setState(() {
                              listContacts.removeAt(index);
                              print(listContacts);
                            });
                          }),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Submit'),
    );
  }
}

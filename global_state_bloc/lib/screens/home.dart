import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/contact_bloc.dart';
import '../models/contact_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _nameState();
}

class _nameState extends State<Home> {
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
        body: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            //CONTOH SEDERHANA DENGAN MENGGUNAKAN STATE PADA BLOC
            // if (state is ContactInitial) {
            //   // You can access the contact list using state.users
            //   final contacts = state.users;
            //   print('$contacts');
            //   return ListView.builder(
            //     itemCount: contacts.length,
            //     itemBuilder: (context, index) {
            //       final contact = contacts[index];
            //       return ListTile(
            //         title: Text(contact.name),
            //         subtitle: Text(contact.number),
            //       );
            //     },
            //   );
            // }
            if (state is ContactDeleting) {
              return Center(child: CircularProgressIndicator());
            }
            //PADA BAGIAN INI ADALAH IMPLEMENTASI DELETE PADA CONTACT
            // if (state is ContactInitial) {
            //ContactInitial adalah keadaan ketika pertama kalid panggil atau bloc digunakan
            // You can access the contact list using state.users
            final contacts = state.users;
            print('$contacts');
            return Column(
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
                Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      final contact = contacts[index];
                      return ListTile(
                        title: Row(
                          children: [
                            Text(contact.name),
                            Spacer(), // To push buttons to the right
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Handle edit button press
                                // showDialog or navigate to edit screen
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                // Handle delete button press
                                // Remove contact from list or show confirmation dialog
                                final contactToDelete = contacts[index];
                                print(index);

                                BlocProvider.of<ContactBloc>(context)
                                    .add(DeleteUser(user: contactToDelete));
                              },
                            ),
                          ],
                        ),
                        subtitle: Text(contact.number),
                      );
                    },
                  ),
                ),
              ],
            );
            // }

            // return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

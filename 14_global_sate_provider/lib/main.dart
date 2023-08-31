// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'jawaban/contact.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ListContact()),
    ],
    child: Contact(),
  ));
}

class ListContact with ChangeNotifier, DiagnosticableTreeMixin {
  List listContacts = [
    {
      'title': "Contacts1 dari provider",
      'subtitle': "subContacts1 provider",
    },
    {
      'title': "Contacts2 dari provider",
      'subtitle': "subContacts2 provider",
    },
    {
      'title': "Contacts3 dari provider",
      'subtitle': "subContacts3 provider",
    },
  ];
  // List get listContacts => _listContacts;

  void addContact(title, subtitle) {
    listContacts.add(
      {
        'title': title,
        'subtitle': subtitle,
      },
    );
    notifyListeners();
  }

  void removeContact(int index) {
    listContacts.removeAt(index);
    notifyListeners(); // Memberitahu perubahan pada data
  }
}

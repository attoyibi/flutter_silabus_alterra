import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String number;

  const Contact({required this.name, required this.number});

  @override
  List<Object?> get props => [name, number];

  static List<Contact> contacts = [
    Contact(name: 'name1 bloc', number: 'number1 bloc'),
    Contact(name: 'name2 bloc', number: 'number2 bloc'),
  ];
}

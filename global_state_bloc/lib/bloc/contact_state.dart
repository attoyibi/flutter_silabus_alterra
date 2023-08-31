part of 'contact_bloc.dart';

// @immutable
abstract class ContactState {
  List<Contact> users;

  ContactState({required this.users});
}

class ContactInitial extends ContactState {
  ContactInitial({required List<Contact> users}) : super(users: users);
}

//akan di akses ketika kita melakukan  emit
class ContactUpdate extends ContactState {
  ContactUpdate({required List<Contact> users}) : super(users: users);
}

class ContactDeleting extends ContactState {
  ContactDeleting({required List<Contact> users}) : super(users: users);
}
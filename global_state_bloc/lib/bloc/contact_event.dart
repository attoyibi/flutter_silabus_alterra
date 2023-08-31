//event akan di  akses ketika user malakukan event handler kepada aplikasi.
part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class AddUser extends ContactEvent {
  final Contact user;

  AddUser({required this.user});
}

class DeleteUser extends ContactEvent {
  final Contact user;

  DeleteUser({required this.user});
}

class UpdateUser extends ContactEvent {
  final Contact user;

  UpdateUser({required this.user});
}

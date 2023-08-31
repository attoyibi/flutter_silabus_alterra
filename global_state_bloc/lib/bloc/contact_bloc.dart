import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial(users: Contact.contacts)) {
    on<ContactEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<ContactState> emit) {
    state.users.add(event.user);
    emit(ContactUpdate(users: state.users)); //mengarah ke contact_state.dart
  }

  void _deleteUser(DeleteUser event, Emitter<ContactState> emit) async {
    emit(ContactDeleting(users: state.users));
    // Simulate a delay to show CircularProgressIndicator
    await Future.delayed(Duration(seconds: 1));

    state.users.remove(event.user);
    emit(ContactUpdate(users: state.users)); //mengarah ke contact_state.dart
    print(event.user.name);
    print(emit);
  }

  void _updateUser(UpdateUser event, Emitter<ContactState> emit) {
    for (var i = 0; i < state.users.length; i++) {
      if (event.user.name == state.users[i].name) {
        state.users[i] = event.user;
      }
    }
    emit(ContactUpdate(users: state.users)); //mengarah ke contact_state.dart
  }
}

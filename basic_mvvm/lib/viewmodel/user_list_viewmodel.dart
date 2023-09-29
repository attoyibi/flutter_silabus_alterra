import 'package:basic_mvvm/models/user.dart';
import 'package:basic_mvvm/services/api_services.dart';
import 'package:flutter/foundation.dart';

class UserListViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _users = await _apiService.fetchUsers();
    notifyListeners();
  }
}

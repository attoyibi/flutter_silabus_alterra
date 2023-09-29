import 'package:basic_mvvm/models/user.dart';

class ApiService {
  Future<List<User>> fetchUsers() async {
    // Implementasi panggilan API untuk mengambil data pengguna
    // Contoh sederhana:
    await Future.delayed(Duration(seconds: 2));
    return [
      User(id: '1', name: 'John Doe', email: 'john@example.com'),
      User(id: '2', name: 'Jane Smith', email: 'jane@example.com'),
    ];
  }
}

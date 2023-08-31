// class KelasSaya {
//   int variabelPublik; // Anggota publik
//   String _variabelPrivat; // Anggota privat
//   double _variabelDilindungi; // Anggota dilindungi (konvensi)
// }

// class RekeningBank {
//   double _saldo;

//   double get saldo => _saldo; // Getter
//   set saldo(double saldoBaru) {
//     // Setter
//     if (saldoBaru >= 0) {
//       _saldo = saldoBaru;
//     }
//   }
// }

class Student {
  late String
      _name; // Private variable dengan menggunakan late sehingga nilai pada variabel tidak perlu di inisialisasi terlebih dahulu
  late int _age; // Private variable

  // Constructor
  Student(String name, int age) {
    _name = name;
    _age = age;
  }

  // Getter for name
  String get name => _name;

  // Setter for age with validation
  set age(int newAge) {
    if (newAge >= 0 && newAge <= 120) {
      _age = newAge;
    } else {
      print("Invalid age input");
    }
  }

  // Method to display student's information
  void displayInfo() {
    print("Name: $_name");
    print("Age: $_age");
  }
}

void main() {
  // Creating a Student object
  var student = Student("John", 20);

  // Accessing private variable using getter
  print("Student Name: ${student.name}");

  // Accessing private variable using setter
  student.age = 25;

  // Display student information
  student.displayInfo();
}

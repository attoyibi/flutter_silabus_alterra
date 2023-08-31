// // Antarmuka (interface) untuk alat musik
abstract class MusicalInstrument {
  void playSound();

  void tune();
}

// Kelas konkret yang mengimplementasikan antarmuka alat musik
class Piano implements MusicalInstrument {
  // @override
  void playSound() {
    print('Piano is playing beautiful music');
  }

  @override
  void tune() {
    print('Tuning the piano');
  }
}

class Violin implements MusicalInstrument {
  @override
  void playSound() {
    print('Violin is playing melodious notes');
  }

  @override
  void tune() {
    print('Tuning the violin');
  }
}

void main() {
  final piano = Piano();
  final violin = Violin();

  piano.playSound();
  piano.tune();

  // violin.playSound();
  // violin.tune();
}

//contoh penggunaan implement untuk membuat sebauh class mengggunakan 2 class sebagai dasar
// Antarmuka untuk hewan
// abstract class Animal {
//   void makeSound();
// }

// // Antarmuka untuk hewan kerja
// abstract class WorkingAnimal {
//   void doWork();
// }

// // Implementasi antarmuka untuk anjing
// class Dog implements Animal {
//   @override
//   void makeSound() {
//     print('Woof!');
//   }
// }

// // Implementasi antarmuka untuk kucing
// class Cat implements Animal {
//   @override
//   void makeSound() {
//     print('Meow!');
//   }
// }

// Implementasi antarmuka untuk anjing kerja
// class WorkingDog implements Animal, WorkingAnimal {
//   @override
//   void makeSound() {
//     print('Woof! Woof!');
//   }

//   @override
//   void doWork() {
//     print('Working...');
//   }
// }

// void main() {
//   final dog = Dog();
//   final cat = Cat();
//   final workingDog = WorkingDog();

//   dog.makeSound(); // Output: Woof!
//   cat.makeSound(); // Output: Meow!

//   workingDog.makeSound(); // Output: Woof! Woof!
//   workingDog.doWork(); // Output: Working...
// }

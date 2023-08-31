class TonyStark {
  var name;
  var age;
  var isGenius;

  // Constructor dengan parameter
  TonyStark(String name, int age, bool isGenius) {
    this.name = name;
    this.age = age;
    this.isGenius = isGenius;
  }

  // Method untuk memperkenalkan diri
  void introduce() {
    print('Hello, I am $name.');
    print('I am ${isGenius ? '' : 'not'} a genius.');
    print('I am $age years old.');
  }
}

class IronMan extends TonyStark {
  String suitMark;

  IronMan(String name, int age, bool isGenius, this.suitMark)
      : super(name, age, isGenius);

  // Method untuk memperkenalkan diri sebagai Iron Man
  @override
  void introduce() {
    super.introduce(); // Memanggil method introduce dari class TonyStark
    print('I am Iron Man, wearing the $suitMark suit.');
  }
}

void main() {
  // Membuat objek IronMan menggunakan constructor
  var ironMan = IronMan('Tony Stark', 45, true, 'Mark LXXXV');
  ironMan.introduce();
}

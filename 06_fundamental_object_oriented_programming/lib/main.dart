class nama_class_nya {}

class TonyStark {
  String name;
  int age;
  bool isGenius;

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

class TonyStarkJunior extends Mark1 {}

class Mark1 {
  bool isFly = true;
  int damag = 100;
}

class Mark2 {
  bool isFly = true;
  void damage() {
    print('100');
  }
}
//kita sebuah class batman
//kita method bisa cek suara si batman ('dalem')
//status kesehatan di batman
//kita coba untuk memanggil class tersebut, sehingga kita tahu bagaimana status kesehatan dari si batman

class Batman {
  void suara() {
    print('dalem');
  }

  void statusKesehatan() {
    print('sehat');
  }
}

void main() {
  // var cekSuara = TonyStark();
  // cekSuara.bersuara();
  // var batman = Batman();
  // batman.statusKesehatan();
  // canFly.tinggiBadan();
  var status = TonyStark();
  status.hitungTabungan(500, 3);
  // print();
}

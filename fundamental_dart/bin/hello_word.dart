import 'package:fundamental_dart/fundamental_dart.dart' as fundamental_dart;

int umur = 20;
String namaDepan = "Siti";
String namaBelakang = "Nurbaya";
const jenisKelamin = "perempuan";

final namaLengkap = namaDepan + " " + namaBelakang;
// kode di bawah akan eror karena menggunakan const, untuk membuat tidak error nama variabel harus dimulai dengan const juga
//const namaLengkapConst = namaDepan + namaBelakang;
//kode di bawah merupakan cara menggabungkan string yang direkomendasikan oleh dart
var informasiDiri = '$namaLengkap $jenisKelamin';
void main(List<String> arguments) {
  print('isi dari data berupa : $informasiDiri');
}

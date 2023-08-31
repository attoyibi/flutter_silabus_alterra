void main() {
  String input1 = 'mobil balap';
  String input2 = input1.split('').reversed.join();

  // cekPalindrom(input1);
  if (input2 == input1) {
    print('polindrom');
  } else {
    print('Bukan polindrom');
  }
}

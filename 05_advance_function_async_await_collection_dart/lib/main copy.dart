import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<void> fetchData() async {
//   try {
//     final response =
//         await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       print('Data: $data');
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// void main() {
//   print('Fetching data...');
//   // fetchData().then((_) {
//   //   print('Data fetched successfully.');
//   // });
//   print('Fetching data...');
//   fetchData();
//   print('Data fetched successfully.'); // Tidak menunggu data selesai diambil
// }

//tampa menggunakan async
import 'dart:convert';
import 'package:http/http.dart' as http;

void fetchDataWithoutAsync() {
  Future.delayed(Duration(seconds: 10), () {
    final response =
        http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'));

    response.then((response) {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Data: ${data['abilities']}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  });
}

void main() {
  print('Fetching data...');
  fetchDataWithoutAsync();
  print('Data fetched successfully.'); // Tidak menunggu data selesai diambil
  var data_pokemon = fetchDataWithoutAsync();
  // print('Data pokemon baru $data_pokemon'); // Tidak menunggu data selesai diambil
}

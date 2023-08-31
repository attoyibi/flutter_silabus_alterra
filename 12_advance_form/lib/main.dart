import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:advance_form/jawaban/soal_prioritas_satu.dart';
import 'package:advance_form/jawaban/soal_prioritas_dua.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: soalPrioritasSatu(),
    );
  }
}

// class soalPrioritasSatu extends StatefulWidget {
//   const soalPrioritasSatu({super.key});

//   @override
//   State<soalPrioritasSatu> createState() => _soalPrioritasSatuState();
// }

// class _soalPrioritasSatuState extends State<soalPrioritasSatu> {
//   DateTime _dueDate = DateTime.now();
//   final currentDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Interactive Widgets")),
//       body: Container(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             // buildDatePicker
//             buildDatePicker(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDatePicker(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text('Date'),
//             TextButton(
//                 onPressed: () {
//                   _showDatePicker();
//                   print('object');
//                 },
//                 child: const Text('Select'))
//           ],
//         ),
//         Text(
//           DateFormat('dd-MM-yyyy').format(_dueDate),
//         )
//       ],
//     );
//   }

//   void _showDatePicker() {
//     showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(1990),
//         lastDate: DateTime(currentDate.year + 5));
//   }
// }

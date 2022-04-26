import 'package:flutter/material.dart';

// ++++++++++++++MyStatelessWidget+++++++++++++++++++

void main() => runApp(const MyStatelessWidget());

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
         body: (const Text('Hellqqo Woaarlddd')),
        ),
      );
  }
}

// ++++++++++++++MyStateFullWidget+++++++++++++++++++

// void main() => runApp(MyStateFullWidget());

// class MyStateFullWidget extends StatefulWidget {
//   MyStateFullWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStateFullWidget> createState() => _nameState();
// }

// class _nameState extends State<MyStateFullWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter Demo Home Pwage'),
//         ),
//         body: Center(
//           child: TextField(
//             onChanged: (String value) {
//               print(value);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
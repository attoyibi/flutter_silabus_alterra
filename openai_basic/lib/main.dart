import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jawaban = "";
  TextEditingController pertanyaanController =
      TextEditingController(); // Controller untuk input pertanyaan

  void _askGPT() async {
    String apiKey =
        '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'; // Ganti dengan API Key OpenAI Anda
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1',
      headers: {
        'Authorization': 'Bearer $apiKey', // Mengatur kunci API
        'Content-Type': 'application/json',
      },
    ));

    String pertanyaan =
        pertanyaanController.text; // Ambil pertanyaan dari TextField

    // Membuat data yang akan dikirim
    Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "system",
          "content":
              "You are a helpful assistant. dengan data berikut Tentang Alterra Academy:Alterra Academy adalah sebuah perusahaan yang berfokus pada pelatihan teknologi dan pengembangan karir.Misi kami adalah memberikan pelatihan berkualitas tinggi kepada para profesional IT dan non-IT agar mereka dapat mengembangkan keterampilan teknis yang diperlukan di dunia industri. CEO dari alterra academy bernama MUCHSON, CTO David, CSO Juharman.kalau ada pertanyaan yang tidak ada pada data, tolong dijawab tidak tahu dan hubungi nomor juharman: 08123456"
          //hubungkan database
        },
        {
          "role": "user",
          "content": pertanyaan, // Menggunakan pertanyaan dari TextField
        }
      ]
    };

    try {
      Response response = await dio
          .post('https://api.openai.com/v1/chat/completions', data: data);
      setState(() {
        jawaban = response.data.toString();
      });
      print('respond : ${response.data.toString()}');
    } on Exception catch (e) {
      print(e);
    }
    print("submit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pertanyaan anda',
            ),
            TextField(
              controller:
                  pertanyaanController, // Menghubungkan controller ke TextField
              decoration: InputDecoration(labelText: 'Masukkan pertanyaan'),
            ),
            ElevatedButton(
                onPressed: () {
                  _askGPT();
                },
                child: Text("submit")),
            Divider(),
            Text("Jawaban"),
            Text(jawaban),
          ],
        ),
      ),
    );
  }
}

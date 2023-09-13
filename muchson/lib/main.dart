import 'package:flutter/material.dart';
import 'data/data_kontak.dart';

// Failed to launch Pixel_3a_API_33_x86_64: Error: Emulator didn't connect within 60 seconds
// flutter emulators --launch Pixel_3a_API_33_x86_64
void main() {
  runApp(const HelloWord());
}

class HelloWord extends StatefulWidget {
  //1 alwin  juharman
  const HelloWord({super.key});

  @override
  State<HelloWord> createState() => _HelloWordState();
}

class _HelloWordState extends State<HelloWord> {
  //2 ilham
  @override
  Widget build(BuildContext context) {
    //3 yunita  bima
    var inputControllers = TextEditingController();
    var radioValue = '';

    return MaterialApp(
        //4

        // theme: ThemeData.dark(), // Mengatur tema gelap
        // initialRoute: 'home',
        // routes: {
        //   'home': (_) => HomePage(),
        // },
        home: Scaffold(
      appBar: AppBar(
        title: Text('Muchson App'),
      ),
      body: Container(
        color: Colors.grey,
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Muchson'),
                Text('Muchson'),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text('List Anak Didik'),
            TextField(
              controller: inputControllers,
              onChanged: (inputControllers) {
                if (inputControllers == 'davidL') {
                  print('ngirim  gopay ke semua anak');
                } else {
                  print('mentee');
                }
                // print('$inputControllers');
              },
            ),
            Row(
              children: [
                Radio(
                    value: 'Laki-laki',
                    groupValue: radioValue,
                    onChanged: (String? value) {
                      setState(() {
                        //logic dari radio button itu  dimasukkan
                        radioValue = value ?? '';
                        print('Nilai  dari radio value =  $radioValue');
                      });
                    }),
                Text('Laki - laki'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 'Peremupan',
                    groupValue: radioValue,
                    onChanged: (String? value) {
                      setState(() {
                        //logic dari radio button itu  dimasukkan
                        radioValue = value ?? '';
                        print('Nilai  dari radio value =  $radioValue');
                      });
                    }),
                Text('Perempuan'),
              ],
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: data_kontak.length, //3
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: FlutterLogo(),
                        title: Text('${data_kontak[index]["title"]}'),
                        subtitle:
                            Text('${data_kontak[index]["nomor_telepon"]}'),
                      );
                    })
                // ListView(
                //   padding: const EdgeInsets.all(8),
                //   children: [
                //     Text('ADE ALI INDRA'),
                //   ],
                // ),
                ),
            SizedBox(
              height: 20,
            ),

            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     children: [
            //       Text('ADE ALI INDRA'),
            //       Text('ALWIN ZUHRIANDI MANALU'),
            //       Text('ANISA YUNIARTI'),
            //       Text('Bima Pangestu Nugraha'),
            //       Text('Dastin Pranata Yuda'),
            //       Text('David Christian Hui'),
            //       Text('David Liem'),
            //       Text('Delia Sepiana'),
            //       Text('FAJRUL KAMAL'),
            //       Text('GHAZI FARHANU DISASMORO'),
            //       Text('HIDAYAH DANIAWATI'),
            //       Text('JUHARMANSAH'),
            //       Text('KATARINA ANDREA LAURENTIA'),
            //       Text('MUHAMMAD AFRIZAL RASYID'),
            //       Text('MUHAMMAD ARARYA HAFIZH ATHALLA'),
            //       Text('MUHAMMAD ILHAM'),
            //       Text('MUHAMMAD NGURAH ARYA PRATAMA'),
            //       Text('MUSTIKA CHAIRANI'),
            //       Text('NURMALASARI'),
            //       Text('Phrimus Nufeto'),
            //       Text('PUTRI DIANA HAFSYAWATI'),
            //       Text('RACHAEL NATHASYA'),
            //       Text('RAFI TAUFIQURAHMAN'),
            //       Text('RAMADHAN PUTRA NUGRAHA'),
            //       Text('YUNITA ANGGERAINI'),
            //       Text('ADE ALI INDRA'),
            //       Text('ALWIN ZUHRIANDI MANALU'),
            //       Text('ANISA YUNIARTI'),
            //       Text('Bima Pangestu Nugraha'),
            //       Text('Dastin Pranata Yuda'),
            //       Text('David Christian Hui'),
            //       Text('David Liem'),
            //       Text('Delia Sepiana'),
            //       Text('FAJRUL KAMAL'),
            //       Text('GHAZI FARHANU DISASMORO'),
            //       Text('HIDAYAH DANIAWATI'),
            //       Text('JUHARMANSAH'),
            //       Text('KATARINA ANDREA LAURENTIA'),
            //       Text('MUHAMMAD AFRIZAL RASYID'),
            //       Text('MUHAMMAD ARARYA HAFIZH ATHALLA'),
            //       Text('MUHAMMAD ILHAM'),
            //       Text('MUHAMMAD NGURAH ARYA PRATAMA'),
            //       Text('MUSTIKA CHAIRANI'),
            //       Text('NURMALASARI'),
            //       Text('Phrimus Nufeto'),
            //       Text('PUTRI DIANA HAFSYAWATI'),
            //       Text('RACHAEL NATHASYA'),
            //       Text('RAFI TAUFIQURAHMAN'),
            //       Text('RAMADHAN PUTRA NUGRAHA'),
            //       Text('YUNITA ANGGERAINI'),
            //       Text('ADE ALI INDRA'),
            //       Text('ALWIN ZUHRIANDI MANALU'),
            //       Text('ANISA YUNIARTI'),
            //       Text('Bima Pangestu Nugraha'),
            //       Text('Dastin Pranata Yuda'),
            //       Text('David Christian Hui'),
            //       Text('David Liem'),
            //       Text('Delia Sepiana'),
            //       Text('FAJRUL KAMAL'),
            //       Text('GHAZI FARHANU DISASMORO'),
            //       Text('HIDAYAH DANIAWATI'),
            //       Text('JUHARMANSAH'),
            //       Text('KATARINA ANDREA LAURENTIA'),
            //       Text('MUHAMMAD AFRIZAL RASYID'),
            //       Text('MUHAMMAD ARARYA HAFIZH ATHALLA'),
            //       Text('MUHAMMAD ILHAM'),
            //       Text('MUHAMMAD NGURAH ARYA PRATAMA'),
            //       Text('MUSTIKA CHAIRANI'),
            //       Text('NURMALASARI'),
            //       Text('Phrimus Nufeto'),
            //       Text('PUTRI DIANA HAFSYAWATI'),
            //       Text('RACHAEL NATHASYA'),
            //       Text('RAFI TAUFIQURAHMAN'),
            //       Text('RAMADHAN PUTRA NUGRAHA'),
            //       Text('YUNITA ANGGERAINI'),
            //       Text('ADE ALI INDRA'),
            //       Text('ALWIN ZUHRIANDI MANALU'),
            //       Text('ANISA YUNIARTI'),
            //       Text('Bima Pangestu Nugraha'),
            //       Text('Dastin Pranata Yuda'),
            //       Text('David Christian Hui'),
            //       Text('David Liem'),
            //       Text('Delia Sepiana'),
            //       Text('FAJRUL KAMAL'),
            //       Text('GHAZI FARHANU DISASMORO'),
            //       Text('HIDAYAH DANIAWATI'),
            //       Text('JUHARMANSAH'),
            //       Text('KATARINA ANDREA LAURENTIA'),
            //       Text('MUHAMMAD AFRIZAL RASYID'),
            //       Text('MUHAMMAD ARARYA HAFIZH ATHALLA'),
            //       Text('MUHAMMAD ILHAM'),
            //       Text('MUHAMMAD NGURAH ARYA PRATAMA'),
            //       Text('MUSTIKA CHAIRANI'),
            //       Text('NURMALASARI'),
            //       Text('Phrimus Nufeto'),
            //       Text('PUTRI DIANA HAFSYAWATI'),
            //       Text('RACHAEL NATHASYA'),
            //       Text('RAFI TAUFIQURAHMAN'),
            //       Text('RAMADHAN PUTRA NUGRAHA'),
            //       Text('YUNITA ANGGERAINI'),
            //     ],
            //   ),
            // )
          ],
        )),
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('ini merupakan menu home page')],
      ),
    );
  }
}

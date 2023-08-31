import 'package:flutter/material.dart';
import 'detail_galeri.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        CardExample(),
        Image.network('https://picsum.photos/250?image=1'),
        Image.network('https://picsum.photos/250?image=2'),
        Image.network('https://picsum.photos/250?image=3'),
        Image.network('https://picsum.photos/250?image=4'),
      ],
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.

        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 400,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network('https://picsum.photos/250?image=1'),
                        Text('Gambar 1'),
                        Text('Apakah anda ingin melihat lebih detail ?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              child: const Text('Ya'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailGaleri()),
                                );
                                DetailGaleri();
                              },
                            ),
                            ElevatedButton(
                              child: const Text('Tidak'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            child: Image.network('https://picsum.photos/250?image=1'),
          ),
        ),
      ),
    );
  }
}

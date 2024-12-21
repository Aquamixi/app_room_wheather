import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'package:myroomwheather/Obj/album.dart';

class CurrWheather extends StatefulWidget {
  const CurrWheather({super.key});

  @override
  State<CurrWheather> createState() => _CurrWheatherState();
}

class _CurrWheatherState extends State<CurrWheather> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    int temperature = 0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200, // Light blue for the sky
            Colors.grey.shade300, // Light grey for clouds
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
            ),
            Text(
              "$temperature",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

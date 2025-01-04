import 'package:flutter/material.dart';
import 'fetch_data.dart';
import 'package:myroomwheather/Obj/request.dart';

class CurrWheather extends StatefulWidget {
  const CurrWheather({super.key});

  @override
  State<CurrWheather> createState() => _CurrWheatherState();
}

class _CurrWheatherState extends State<CurrWheather> {
  late Future<Request> futureRequest;

  @override
  void initState() {
    super.initState();
    futureRequest = fetchRequest();
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
            FutureBuilder<Request>(
              future: futureRequest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.message);
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

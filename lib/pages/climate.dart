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

  String temperature = '';

  @override
  void initState() {
    super.initState();
    futureRequest = fetchRequest();
  }

  void reloadTemp() {
    setState(() {
      temperature = fetchRequest() as String;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      child: FutureBuilder<Request>(
        future: futureRequest,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            temperature = snapshot.data!.temperature;
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                  ),
                  Text(
                    temperature,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

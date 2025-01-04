import 'package:http/http.dart' as http;
import 'package:myroomwheather/Obj/request.dart';
import 'dart:convert';

Future<Request> fetchRequest() async {
  final response = await http
      .get(Uri.parse('http://192.168.0.30'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Request.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to decode Json');
  }
}

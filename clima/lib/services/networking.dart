// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url = ""});
  final String url;

  Future getData() async {
    if (url.isEmpty) {
      print("URL is empty");
      return;
    }
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var weather = jsonDecode(data);
      // print(weather);
      return weather;
    } else {
      print(response.statusCode);
    }
  }
}

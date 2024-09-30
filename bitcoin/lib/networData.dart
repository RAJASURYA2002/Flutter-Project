// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = "7B94A522-8B4A-4DA0-A5C8-7C88583392AB";
const startLink = "https://rest.coinapi.io/v1/exchangerate";

class NetworkData {
  NetworkData({this.curency,this.type});
  String? curency;
  String? type;

  Future getData() async {
    String url = "$startLink/$type/$curency?apikey=$apiKey";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var curencyData = jsonDecode(data);
      return curencyData;
    } else {
      print(response.statusCode);
    }
  }
}

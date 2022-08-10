import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});
  String url;
  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var responsebody = response.body;
      return jsonDecode(responsebody);
    } else {
      print(response.statusCode);
    }
  }
}

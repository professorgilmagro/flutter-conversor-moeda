import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static const KEY = 'e621a4a6';
  static const BASE_URL = 'https://api.hgbrasil.com/finance/quotations';

  String getUrl() {
    return "$BASE_URL?key=$KEY";
  }

  Future<Map> getData() async {
    http.Response response = await http.get(getUrl());
    return json.decode(response.body);
  }
}
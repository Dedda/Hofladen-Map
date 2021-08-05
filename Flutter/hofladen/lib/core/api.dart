import 'dart:convert';

import 'package:hofladen/core/models/shop.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Shop> loadHofladen(String id) async {
    final url = Uri.parse("http://server.com/api/shop/" + id);
    final response = await http.get(url);
    return Shop.fromJson(jsonDecode(response.body));
  }

  
}

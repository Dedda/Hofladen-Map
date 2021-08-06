import 'dart:convert';

import 'package:hofladen/core/models/shop.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  Future<List<ShopHeader>> loadShopList();
  
  Future<Shop> loadShopDetails(final String shopId);
}

class OnlineApi implements Api {

  static const _baseUrl = 'http://192.168.178.28:4000/api';
  static String _urlFor(String path) => '$_baseUrl$path';

  Future<http.Response> _httpGet(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'Access-Control-Allow-Origin': '*',
    });
    return response;
  }

  @override
  Future<List<ShopHeader>> loadShopList() async {
    final response = await _httpGet(_urlFor('/shops'));
    final List<dynamic> json = jsonDecode(response.body);
    return json.map((s) => ShopHeader.fromJson(s)).toList(growable: false);
  }

  @override
  Future<Shop> loadShopDetails(final String shopId) async {
    final response = await _httpGet(_urlFor('/shops/$shopId'));
    print('===');
    print(response.body);
    print('===');
    final Map<String, dynamic> json = jsonDecode(response.body);
    return Shop.fromJson(json);
  }
}

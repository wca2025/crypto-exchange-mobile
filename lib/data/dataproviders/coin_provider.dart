import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import '../../data/models/coin.dart';

import '../services/helper_service.dart';

class CoinProvider {
  static Future<http.Response> getCoinsList() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
    final res = await http.get(url);

    return res;
  }
}

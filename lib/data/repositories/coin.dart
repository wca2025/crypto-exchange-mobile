import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/tier.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../dataproviders/coin_provider.dart';
import '../models/coin.dart';

class CoinRepository {
  static Future<List<Coin>?> getAllCoins() async {
    Response res = await CoinProvider.getCoinsList();

    print('Response code: ${res.statusCode}');

    try {
//  if (res.statusCode == 200) {
//       final List coins = json.decode(res.body);

//       return coins.map((json) => Coin.fromJson(json)).where((coin) {
//         final title = coin.symbol!.toLowerCase();
//         final name = coin.name!.toLowerCase();
//         final search = query.toLowerCase();

//         return title.contains(search) || name.contains(search);
//       }).toList();
//     } else {
//       throw Exception();
//     }
      // if (res.statusCode != 200) {
      //   throw Exception('error getting covid api response');
      // } else {
      //   Iterable Accounts = jsonDecode(res.body);

      //   List<Account> dataAccounts = [];
      //   for (var Account in Accounts) {
      //     Account dataAccounts = Account.fromJson(Account);
      //     // dataAssets.add(asset);
      //   }

      //   return dataAccounts;
      // }
    } catch (e) {
      print('eerror:${e}');
    }
  }
}

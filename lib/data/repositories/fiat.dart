import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../dataproviders/fiat_provider.dart';
import '../models/fiat.dart';

class FiatRepository {

  static Future<List<Fiat>?> getAllFiats() async {
    Response res = await FiatProvider.getFiatList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable fiats = jsonDecode(res.body);

        List<Fiat> dataFiats = [];
        for (var fiat in fiats) {
          Fiat dataFiats = Fiat.fromJson(fiat);
          // dataFiats.add(fiat);
        }

        return dataFiats;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }


}

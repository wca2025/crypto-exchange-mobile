import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/kyc.dart';
import '../../data/dataproviders/kyc_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class KycRepository {
  static Future<List<Kyc>?> getAllKycs() async {
    Response res = await KycProvider.getKycList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable Kycs = jsonDecode(res.body);

        List<Kyc> dataKycs = [];
        for (var Kyc in Kycs) {
          Kyc dataKycs = Kyc.fromJson(Kyc);
          // dataKycs.add(Kyc);
        }

        return dataKycs;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Kyc> getKyc(id) async {
    var result;
    Response response = await KycProvider.getKycById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Kyc.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/network.dart';
import '../../data/dataproviders/network_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class NetworkRepository {
  static Future<List<Network>?> getAllNetworks() async {
    Response res = await NetworkProvider.getNetworkList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable Networks = jsonDecode(res.body);

        List<Network> dataNetworks = [];
        for (var Network in Networks) {
          Network dataNetworks = Network.fromJson(Network);
          // dataNetworks.add(Network);
        }

        return dataNetworks;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Network> getNetwork(id) async {
    var result;
    Response response = await NetworkProvider.getNetworkById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Network.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

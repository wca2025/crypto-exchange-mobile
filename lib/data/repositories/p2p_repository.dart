import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/p2p.dart';
import '../../data/dataproviders/p2p_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class P2pRepository {
  static Future<List<P2P>?> getAllP2Ps() async {
    Response res = await P2pProvider.getP2PList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable P2Ps = jsonDecode(res.body);

        List<P2P> dataP2Ps = [];
        for (var P2P in P2Ps) {
          P2P dataP2Ps = P2P.fromJson(P2P);
          // dataAssets.add(asset);
        }

        return dataP2Ps;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<P2P> getP2P(id) async {
    var result;
    Response response = await P2pProvider.getP2PById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> startPostAd(String roleName, String roleDescription) async {
    var result;
    Response response =
        await P2pProvider.startPostAd(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> BuyCancelP2p(String id) async {
    var result;
    Response response = await P2pProvider.BuyCancelP2p(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> SellCancelP2p(String id) async {
    var result;
    Response response = await P2pProvider.SellCancelP2p(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  static Future<P2P> SellP2pComplete(
      String id, String roleName, String roleDescription) async {
    var result;
    Response response = await P2pProvider.SellP2pComplete(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  static Future<P2P> BuyP2pComplete(String id) async {
    var result;
    Response response = await P2pProvider.BuyP2pComplete(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> RemoveP2pAd(String id) async {
    var result;
    Response response = await P2pProvider.RemoveP2pAd(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
    ;
  }

  Future<P2P> SellP2pAppeal(
      int? id, String roleName, String roleDescription) async {
    var result;
    Response response =
        await P2pProvider.SellP2pAppeal(id, roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> startEditAd(
      int? id, String roleName, String roleDescription) async {
    var result;
    Response response =
        await P2pProvider.startEditAd(id, roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> BuyP2pAppeal(
      int? id, String roleName, String roleDescription) async {
    var result;
    Response response =
        await P2pProvider.BuyP2pAppeal(id, roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> BuyP2p(String id) async {
    var result;
    Response response = await P2pProvider.BuyP2p(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<P2P> BuySell(String id) async {
    var result;
    Response response = await P2pProvider.BuySell(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = P2P.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

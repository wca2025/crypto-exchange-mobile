import '../../data/models/p2p.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class P2pProvider {
  static Future<http.Response> getP2PList() async {
    // Read from DB or make network request etc...
    String getP2PUrl = '/transaction/p2p/list';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getP2PById(String id) async {
    // Read from DB or make network request etc...
    String getP2PUrl = '/transaction/p2p/$id';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> startPostAd(
      String roleName, String roleDescription) async {
    String getP2PUrl = '/transaction/p2p/ad/create';

    final res = await http.post(HelperService.buildUri(getP2PUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> BuyCancelP2p(String id) async {
    String getP2PUrl = '/transaction/p2p/buy/cancel/$id';

    final res = await http.delete(HelperService.buildUri((getP2PUrl)));
    return res;
  }

  static Future<http.Response> SellCancelP2p(String id) async {
    String getP2PUrl = '/transaction/p2p/sell/cancel/$id';

    final res = await http.delete(HelperService.buildUri((getP2PUrl)));
    return res;
  }

  static Future<http.Response> SellP2pComplete(String id) async {
    // Read from DB or make network request etc...
    String getP2PUrl = ' transaction/p2p/sell/complete/$id';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> BuyP2pComplete(String id) async {
    // Read from DB or make network request etc...
    String getP2PUrl = '/transaction/p2p/buy/complete/$id';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> RemoveP2pAd(String id) async {
    String getP2PUrl = '/transaction/p2p/ad/cancel/$id';

    final res = await http.delete(HelperService.buildUri((getP2PUrl)));
    return res;
  }

  static Future<http.Response> SellP2pAppeal(
      int? id, String roleName, String roleDescription) async {
    String getP2PUrl = '/transaction/p2p/sell/appeal/$id';

    final res = await http.post(HelperService.buildUri(getP2PUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> startEditAd(
      int? id, String roleName, String roleDescription) async {
    String getP2PUrl = '/transaction/p2p/ad/edit/$id';

    final res = await http.put(HelperService.buildUri(getP2PUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> BuyP2pAppeal(
      int? id, String roleName, String roleDescription) async {
    String getP2PUrl = '/transaction/p2p/buy/appeal/$id';

    final res = await http.put(HelperService.buildUri(getP2PUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> BuyP2p(String id) async {
    // Read from DB or make network request etc...
    String getP2PUrl = ' /transaction/p2p/buy';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> BuySell(String id) async {
    // Read from DB or make network request etc...
    String getP2PUrl = ' /transaction/p2p/sell';

    final res = await http.get(
      HelperService.buildUri(getP2PUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

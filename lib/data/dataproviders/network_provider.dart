import '../../data/models/network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class NetworkProvider {
  static Future<http.Response> getNetworkList() async {
    // Read from DB or make network request etc...
    String getNetworkUrl = '/networks';

    final res = await http.get(
      HelperService.buildUri(getNetworkUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getNetworkById(String id) async {
    // Read from DB or make network request etc...
    String getNetworkUrl = '/network/$id';

    final res = await http.get(
      HelperService.buildUri(getNetworkUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

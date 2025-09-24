import '../../data/models/kyc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class KycProvider {
  static Future<http.Response> getKycList() async {
    // Read from DB or make network request etc...
    String getKycUrl = '/kycs';

    final res = await http.get(
      HelperService.buildUri(getKycUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getKycById(String id) async {
    // Read from DB or make network request etc...
    String getKycUrl = '/kyc/$id';

    final res = await http.get(
      HelperService.buildUri(getKycUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

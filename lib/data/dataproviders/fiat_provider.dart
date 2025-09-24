import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/models/Fiat.dart';
import 'package:flutter/material.dart';

import '../services/helper_service.dart';

class FiatProvider {
  static Future<http.Response> getFiatList() async {
    // Read from DB or make network request etc...
    String getFiatUrl = '/fiat';

    final res = await http.get(
      HelperService.buildUri(getFiatUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

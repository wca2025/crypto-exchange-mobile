import '../../data/models/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class CategoryProvider {
  static Future<http.Response> getCategoryList() async {
    // Read from DB or make network request etc...
    String getcategoryUrl = '/categories';

    final res = await http.get(
      HelperService.buildUri(getcategoryUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getCategoryById(String id) async {
    // Read from DB or make network request etc...
    String getcategoryUrl = '/category/$id';

    final res = await http.get(
      HelperService.buildUri(getcategoryUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

import '../../data/models/collection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class CollectionProvider {
  static Future<http.Response> getCollectionList() async {
    // Read from DB or make network request etc...
    String getcollectionUrl = '/collections';

    final res = await http.get(
      HelperService.buildUri(getcollectionUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getCollectionById(String id) async {
    // Read from DB or make network request etc...
    String getcollectionUrl = '/collection/$id';

    final res = await http.get(
      HelperService.buildUri(getcollectionUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/collection.dart';
import '../../data/dataproviders/collection_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../dataproviders/collection_provider.dart';

class CollectionRepository {
  static Future<List<Collection>?> getAllCollections() async {
    Response res = await CollectionProvider.getCollectionList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable collections = jsonDecode(res.body);

        List<Collection> datacollections = [];
        for (var collection in collections) {
          Collection datacollections = Collection.fromJson(collection);
          // datacollections.add(collection);
        }

        return datacollections;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Collection> getcollection(id) async {
    var result;
    Response response = await CollectionProvider.getCollectionById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Collection.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

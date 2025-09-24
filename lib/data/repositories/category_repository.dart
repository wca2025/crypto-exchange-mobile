import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/category.dart';
import '../../data/dataproviders/category_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class CategoryRepository {
  static Future<List<Categoryx>?> getAllCategorys() async {
    Response res = await CategoryProvider.getCategoryList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable categorys = jsonDecode(res.body);

        List<Categoryx> datacategorys = [];
        for (var category in categorys) {
          Categoryx datacategorys = Categoryx.fromJson(category);
          // dataCategorys.add(Category);
        }

        return datacategorys;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Categoryx> getCategory(id) async {
    var result;
    Response response = await CategoryProvider.getCategoryById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Categoryx.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/role.dart';
import '../../data/dataproviders/role_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class RoleRepository {
  static Future<List<Role>?> getAllRoles() async {
    Response res = await RoleProvider.getRoleList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable Roles = jsonDecode(res.body);

        List<Role> dataRoles = [];
        for (var Role in Roles) {
          Role dataRoles = Role.fromJson(Role);
          // dataAssets.add(asset);
        }

        return dataRoles;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Role> getRole(id) async {
    var result;
    Response response = await RoleProvider.getRoleById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Role.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

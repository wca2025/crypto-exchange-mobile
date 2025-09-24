import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/permission.dart';
import '../../data/dataproviders/permission_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class PermissionRepository {
  static Future<List<Permission>?> getAllPermissions() async {
    Response res = await PermissionProvider.getPermissionList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable Permissions = jsonDecode(res.body);

        List<Permission> dataPermissions = [];
        for (var Permission in Permissions) {
          Permission dataPermissions = Permission.fromJson(Permission);
          // dataAssets.add(asset);
        }

        return dataPermissions;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Permission> getPermission(id) async {
    var result;
    Response response = await PermissionProvider.getPermissionById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Permission.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

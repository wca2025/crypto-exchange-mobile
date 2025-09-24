import '../../data/models/permission.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class PermissionProvider {
  static Future<http.Response> getPermissionList() async {
    // Read from DB or make network request etc...
    String getPermissionUrl = '/Permission';

    final res = await http.get(
      HelperService.buildUri(getPermissionUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getPermissionById(String id) async {
    // Read from DB or make network request etc...
    String getPermissionUrl = '/asset/$id';

    final res = await http.get(
      HelperService.buildUri(getPermissionUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  Future<http.Response> addPermission(
      String roleName, String roleDescription) async {
    String getPermissionUrl = '/p2p/list';
    final res = await http.post(HelperService.buildUri(getPermissionUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  Future<http.Response> updatePermission(
      int? id, String roleName, String roleDescription) async {
    String getPermissionUrl = '/p2p/list';
    final res = await http.put(HelperService.buildUri(getPermissionUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  Future<http.Response> deletePermission(String id) async {
    String getPermissionUrl = '/p2p/list';
    final res = await http.delete(HelperService.buildUri(getPermissionUrl));
    return res;
  }
}

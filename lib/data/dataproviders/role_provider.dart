import '../../data/models/role.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class RoleProvider {
  static Future<http.Response> getRoleList() async {
    // Read from DB or make network request etc...
    String getRoleUrl = '/Role';

    final res = await http.get(
      HelperService.buildUri(getRoleUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getRoleById(String id) async {
    // Read from DB or make network request etc...
    String getRoleUrl = '/asset/$id';

    final res = await http.get(
      HelperService.buildUri(getRoleUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  Future<http.Response> addRole(String roleName, String roleDescription) async {
    String getRoleUrl = '/p2p/list';
    final res = await http.post(HelperService.buildUri(getRoleUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  Future<http.Response> updateRole(
      int? id, String roleName, String roleDescription) async {
    String getRoleUrl = '/role/edit/$id';
    final res = await http.put(HelperService.buildUri(getRoleUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  Future<http.Response> deleteRole(String id) async {
    String getRoleUrl = '/role/delete/$id';
    final res = await http.delete(HelperService.buildUri(getRoleUrl));
    return res;
  }
}

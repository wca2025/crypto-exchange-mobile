// import '../../data/models/addresss.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../services/helper_service.dart';

// class AddresssProvider {
//   static Future<http.Response> getAddressList() async {
//     // Read from DB or make network request etc...
//     String getaddressUrl = '/addresses';

//     final res = await http.get(
//       HelperService.buildUri(getaddressUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getAddressById(String id) async {
//     // Read from DB or make network request etc...
//     String getaddressUrl = '/address/$id';

//     final res = await http.get(
//       HelperService.buildUri(getaddressUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> addAddress(
//       String roleName, String roleDescription) async {
//     String getaddressUrl = '/address/create';
//     final res = await http.post(HelperService.buildUri(getaddressUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> updateAddress(
//       int? id, String roleName, String roleDescription) async {
//     String getaddressUrl = '/address/edit/$id';
//     final res = await http.put(HelperService.buildUri(getaddressUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> deleteAddress(String id) async {
//     String getaddressUrl = '/address/delete/$id';
//     final res = await http.delete(HelperService.buildUri(getaddressUrl));
//     return res;
//   }
// }

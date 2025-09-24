// import 'dart:convert';
// import '../../presentation/pro/sign_up.dart';
// import 'package:http/http.dart' as http;

// import '../../data/models/order.dart';
// import 'package:flutter/material.dart';

// import '../services/helper_service.dart';

// class OrderProvider {
//   static Future<http.Response> getOrderList() async {
//     // Read from DB or make network request etc...
//     String getOrderUrl = '/orders';

//     final res = await http.get(
//       HelperService.buildUri(getOrderUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getOrderById(String id) async {
//     // Read from DB or make network request etc...
//     String getOrderUrl = '/order/$id';

//     final res = await http.get(
//       HelperService.buildUri(getOrderUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> updateOrder(
//       int? id, String roleName, String roleDescription) async {
//     String getOrderUrl = '/order/edit/$id';

//     final res = await http.put(HelperService.buildUri(getOrderUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> deleteOrder(String id) async {
//     String getOrderUrl = '/order/delete/$id';

//     final res = await http.delete(HelperService.buildUri(getOrderUrl));
//     return res;
//   }
// }

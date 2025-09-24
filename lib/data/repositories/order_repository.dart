// import 'package:flutter/material.dart';
// import 'package:cx/data/models/P2P.dart';
// import 'package:cx/data/dataproviders/P2P_provider.dart';
// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:http/src/response.dart';
// import 'package:http_interceptor/http/intercepted_client.dart';

// import '../dataproviders/order_provider.dart';
// import '../models/order.dart';

// class OrderRepository {
//   static Future<List<Order>?> getAllOrders() async {
//     Response res = await OrderProvider.getOrderList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Orders = jsonDecode(res.body);

//         List<Order> dataOrders = [];
//         for (var Order in Orders) {
//           Order dataOrders = Order.fromJson(Order);
//           // dataAssets.add(asset);
//         }

//         return dataOrders;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//   static Future<Order> getOrder(id) async {
//     var result;
//     Response response = await OrderProvider.getOrderById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Order.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Order> DeleteOrder(String id) async {
//     var result;
//     Response response = await OrderProvider.getOrderById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Order.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }
// }

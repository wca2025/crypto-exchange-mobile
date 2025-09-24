// import 'dart:convert';

// import 'package:flutter/material.dart';
// import '../../data/models/addresss.dart';
// import '../../data/dataproviders/addresss_provider.dart';
// import 'package:http/http.dart';

// class AddresssRepository {
//   static Future<List<Addresss>?> getAllAddressss() async {
//     Response res = await AddresssProvider.getAddressList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Addressss = jsonDecode(res.body);

//         List<Addresss> dataAddressss = [];
//         for (var Addresss in Addressss) {
//           Addresss dataAddressss = Addresss.fromJson(Addresss);
//           // dataAssets.add(asset);
//         }

//         return dataAddressss;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//   static Future<Addresss> getAddresss(id) async {
//     var result;
//     Response response = await AddresssProvider.getAddressById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Addresss.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }
// }

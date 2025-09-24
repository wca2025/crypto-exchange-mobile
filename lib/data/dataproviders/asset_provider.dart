// import 'dart:convert';
// import '../../data/services/apiinterceptor.dart';
// import '../../data/services/constants.dart';
// import '../../data/services/helper_service.dart';
// import 'package:http/http.dart';
// import 'package:http_interceptor/http/intercepted_client.dart';
// import 'package:meta/meta.dart';

// import '../../data/models/asset.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class AssetProvider {
//   static Future<http.Response> getAssetList() async {
//     // Read from DB or make network request etc...
//     String getassetsUrl = '/assets';

//     final res = await http.get(
//       HelperService.buildUri(getassetsUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getAssetById(String id) async {
//     // Read from DB or make network request etc...
//     String getassetUrl = '/asset/$id';

//     final res = await http.get(
//       HelperService.buildUri(getassetUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }
// }

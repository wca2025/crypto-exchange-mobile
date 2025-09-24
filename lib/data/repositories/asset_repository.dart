// import 'dart:convert';

// import 'package:flutter/material.dart';
// import '../../data/dataproviders/asset_provider.dart';
// import '../../data/services/apiinterceptor.dart';
// import 'package:http/http.dart';
// import 'package:http/src/response.dart';
// import 'package:http_interceptor/http/intercepted_client.dart';

// import '../models/asset.dart';

// class AssetRepository {
//   late final AssetProvider dataProviderA;
//   late final AssetProvider dataProviderB;

//   static Future<List<Asset>?> getAllAssets() async {
//     Response res = await AssetProvider.getAssetList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable assets = jsonDecode(res.body);

//         List<Asset> dataAssets = [];
//         for (var asset in assets) {
//           Asset dataAssets = Asset.fromJson(asset);
//           // dataAssets.add(asset);
//         }

//         return dataAssets;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//   static Future<Asset> getAsset(id) async {
//     var result;
//     Response response = await AssetProvider.getAssetById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Asset.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

// }

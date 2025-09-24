// import '../../data/models/user.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../services/helper_service.dart';

// class UserProvider {
//   static Future<http.Response> getUserList() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/users';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getUserById(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/$id';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> getMarketPairsfuturebtc() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/future/btc';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getMarketPairsfuturematic() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/future/matic';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getMarketPairsfutureusdt() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/future/usdt';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getMarketPairsspotbtc() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/spot/btc';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getMarketPairsspotmatic() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/spot/matic';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getMarketPairsspotusdt() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarketspairs/spot/usdt';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getconverter(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/converter';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getNewMarkets() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingnewmarkets';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getGainerLosserMarkets() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendinggainerslossers';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> gettrendingMarkets() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/trendingmarkets';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> updateantiphrase(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/antiphrase/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   // ,
//   static Future<http.Response> updateuser(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   // ,
//   static Future<http.Response> getcryptos(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/admin/cryptos';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> getfiats(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/admin/fiats';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //  ,
//   static Future<http.Response> EmailNotificationConfirmation(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/notification/confirmation/phone';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> PhoneNotificationConfirmation(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/notification/confirmation/email';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> createApi(
//       String roleName, String roleDescription) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/api/create';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   // ,
//   static Future<http.Response> listApi() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/apis';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //  ,
//   static Future<http.Response> readApi(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/api/$id';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }
//   //   ,

//   static Future<http.Response> deleteApi(int? id) async {
//     String getuserUrl = '/user/api/delete/$id';
//     final res = await http.delete(HelperService.buildUri(getuserUrl));
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateApi(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/api/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> getSecret(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/account/settings/intent/secret';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> verifyID(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/identification/verify';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateKYC(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/kyc/verify';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateWithdrawalPhrase(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/withdrawalphrase/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateEmailPhrase(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/emailphrase/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> deleteSubAccount(int? id) async {
//     String getuserUrl = '/user/subaccount/delete/$id';
//     final res = await http.delete(HelperService.buildUri(getuserUrl));
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateLoginPhrase(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/loginphrase/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,c
//   static Future<http.Response> freezeSubAccount(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/subaccount/freeze/$id';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> createSubAccount(
//       String roleName, String roleDescription) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/subaccount/create';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> securityverifycheck(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/securityverifycheck';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> listSubAccount() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/subaccounts';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> readSubAccount(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/subaccount/$id';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateSubAccount(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/subaccount/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateTwofa(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/binding2fa/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateEmail(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/bindingemail/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updatePhone(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/bindingphone/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> read(int? id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/users';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> updateLoginPassword(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/user/loginpwd/edit/$id';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> publicProfile(id) async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/:username/$id';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> update(
//       int? id, String roleName, String roleDescription) async {
//     String getuserUrl = '/p2p/list';

//     final res = await http.put(HelperService.buildUri(getuserUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   //   ,
//   static Future<http.Response> list() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/users';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> featuredcollectors() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/featuredcollectors';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //   ,
//   static Future<http.Response> featuredcreators() async {
//     // Read from DB or make network request etc...
//     String getuserUrl = '/user/featuredcreators';

//     final res = await http.get(
//       HelperService.buildUri(getuserUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //
//   // static Future<http.Response> updateTradingPassword(String roleName) async {
//   //    String id;
//   //   String getuserUrl = '/user/tradingpwd/edit/$id';

//   //   final res = await http.put(HelperService.buildUri(getuserUrl),
//   //       body: {"role_name": roleName, "role_description": roleDescription});
//   //   return res;
//   // }
// }

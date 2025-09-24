// import '../../data/models/account.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../services/helper_service.dart';

// class AccountProvider {
//   static Future<http.Response> getAccountList() async {
//     // Read from DB or make network request etc...
//     String getaccountUrl = '/account';

//     final res = await http.get(
//       HelperService.buildUri(getaccountUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getAccountById(String id) async {
//     // Read from DB or make network request etc...
//     String getaccountUrl = '/account/$id';

//     final res = await http.get(
//       HelperService.buildUri(getaccountUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> mainAccountGenerate() async {
//     String getaccountUrl = '/transaction/mainaccount/generate';
//     final res = await http.post(HelperService.buildUri(getaccountUrl));
//     return res;
//   }

//   static Future<http.Response> spotAccountGenerate() async {
//     String getaccountUrl = '/transaction/spotaccount/generate';
//     final res = await http.post(HelperService.buildUri(getaccountUrl));
//     return res;
//   }

//   static Future<http.Response> marginAccountGenerate() async {
//     String getaccountUrl = '/transaction/marginaccount/generate';
//     final res = await http.post(HelperService.buildUri(getaccountUrl));
//     return res;
//   }

//   static Future<http.Response> futureAccountGenerate() async {
//     String getaccountUrl = '/transaction/futureaccount/generate';
//     final res = await http.post(HelperService.buildUri(getaccountUrl));
//     return res;
//   }

//   static Future<http.Response> earnAccountGenerate() async {
//     String getaccountUrl = '/transaction/earnaccount/generate';
//     final res = await http.post(HelperService.buildUri(getaccountUrl));
//     return res;
//   }

//   static Future<http.Response> mainAccountDepositfiat(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/deposit/fiat';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> mainAccountWithdrawfiat(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/withdraw/fiat';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> mainAccountDeposit(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/deposit';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> marginAccountDeposit(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> earnAccountDeposit(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> futureAccountDeposit(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> spotAccountDeposit(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> mainAccountWithdraw(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/withdraw';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> marginAccountWithdraw(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> earnAccountWithdraw(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> futureAccountWithdraw(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> spotAccountWithdraw(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> mainAccountTransfer(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/transfer';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> marginAccountTransfer(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> earnAccountTransfer(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> futureAccountTransfer(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> mainAccountConvert(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/transaction/mainaccount/convert';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> marginAccountConvert(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> earnAccountConvert(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> futureAccountConvert(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> spotAccountConvert(
//       String roleName, String roleDescription) async {
//     String getaccountUrl = '/account';
//     final res = await http.post(HelperService.buildUri(getaccountUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import '../../data/models/account.dart';
// import '../../data/dataproviders/account_provider.dart';
// import 'package:http/http.dart';

// class AccountRepository {
//   static Future<List<Account>?> getAllAccounts() async {
//     Response res = await AccountProvider.getAccountList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Accounts = jsonDecode(res.body);

//         List<Account> dataAccounts = [];
//         for (var Account in Accounts) {
//           Account dataAccounts = Account.fromJson(Account);
//           // dataAssets.add(asset);
//         }

//         return dataAccounts;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//   static Future<Account> getAccount(id) async {
//     var result;
//     Response response = await AccountProvider.getAccountById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountGenerateRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.mainAccountGenerate();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> spotAccountGenerateRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.spotAccountGenerate();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> MarginsAccountGenerateRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.mainAccountGenerate();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> FutureAccountGenerateRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.futureAccountGenerate();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> earnAccountGenerateRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.earnAccountGenerate();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountDepositfiatRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.mainAccountDepositfiat(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountWithdrawfiatRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response = await AccountProvider.mainAccountWithdrawfiat(
//         roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountDepositRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.mainAccountDeposit(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> marginAccountDepositRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.marginAccountDeposit(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> earnAccountDepositRepo(
//       int id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.earnAccountDeposit(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> futureAccountDepositRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.futureAccountDeposit(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> spotAccountDepositRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.spotAccountDeposit(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountWithdrawRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.mainAccountWithdraw(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> marginAccountWithdrawRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.marginAccountWithdraw(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> earnAccountWithdrawRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.earnAccountWithdraw(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> futureAccountWithdrawRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.futureAccountWithdraw(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> spotAccountWithdrawRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.spotAccountWithdraw(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountTransferRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.mainAccountTransfer(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> marginAccountTransferRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.marginAccountTransfer(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> earnAccountTransferRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.earnAccountTransfer(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> futureAccountTransferRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.futureAccountTransfer(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> mainAccountConvertRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.mainAccountConvert(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> marginAccountConvertRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.marginAccountConvert(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> earnAccountConvertRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.earnAccountConvert(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> futureAccountConvertRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.futureAccountConvert(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<Account> spotAccountConvertRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await AccountProvider.spotAccountConvert(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Account.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }
// }

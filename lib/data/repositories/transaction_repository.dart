// import 'dart:async';
// import 'dart:convert';
// import 'dart:core';


// import 'package:cx/presentation/pro/withdraw.dart';
// import 'package:flutter/material.dart';
// import 'package:cx/data/models/transaction.dart';
// import 'package:http/http.dart';
// import 'package:http/src/response.dart';
// import 'package:http_interceptor/http/intercepted_client.dart';
// import 'package:cx/data/dataproviders/transaction_provider.dart';

// import '../dataproviders/transaction_provider.dart';
// import '../models/transaction.dart';

// class TransactionRepository {
  
//   static Future<List<Transaction>?> getAllTransactions() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//  getTransaction(id) async { 
//     var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

  

//      getTransactionList(id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//    getTransactionById(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   addTransaction(int? id,String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   updateTransaction(int? id)async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   deleteTransaction(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//     Convert(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       mintToken(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       SetupSales(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       SetupAuction(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//        AcceptBid(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//        AcceptOffe(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       DeclineOffer(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       DeclineBid(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   CancelTransfer(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   CoinTransfer(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   CryptoPayment(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   startCardPayment(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   startCryptoOffer(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//       startCardOffer(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   NftTransfer(  int? id,String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   startCryptoBid(int? id,String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }
 
//   onmeta(int? id,String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   onmetacreateOnrampOrder(int? id, String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//      onmetaRefreshAccessToken(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//      onmetagetTokens(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//      onmetagetCurrencies(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//     static onmetagetOrderHistory(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   static   onmetacreateOfframprampOrder(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//  static  onmetagetQuatationByFiatAmt(int? id) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//  static startCardBid(int? id,String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }

//   static    onmetaacceptOnrampOrder(int? id, String roleName, String roleDescription) async {    var result;
//     Response response = await TransactionProvider.getTransactionById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = Transaction.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     } }


// static Future<List<Transaction>>FetchLiveNfts() async {
//      Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
   
// }

//  static  Future<List<Transaction>>FetchLiveUpcomimgAuctions() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
   
//   }
//  static Future<List<Transaction>>FetchLiveUpcomingDrops() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

   
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
 
//   }
//   static Future<List<Transaction>> FetchTopCollectors() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
  
//   }
//   static Future<List<Transaction>> FetchFeaturedCreations() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

 
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
  
//   }
//  static Future<List<Transaction>> FetchFeaturedCreators() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');


//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }

//   }
//  static Future<List<Transaction>>FetchRecentSales() async { 
//     Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

 
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
   
//   }
//    static Future<List<Transaction>>FetchRecentCreations() async { 
//  Response res = await TransactionProvider.getTransactionList();

//     print('Response code: ${res.statusCode}');

 
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Transactions = jsonDecode(res.body);

//         List<Transaction> dataTransactions = [];
//         for (var Transaction in Transactions) {
//           Transaction dataTransactions = Transaction.fromJson(Transaction);
//           // dataAssets.add(asset);
//         }

//         return dataTransactions;
//       }
    
//   }

// }

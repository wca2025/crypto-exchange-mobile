// import '../../data/models/transaction.dart';
// import '../../presentation/pro/convert.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../services/helper_service.dart';

// class TransactionProvider {

//   static Future<http.Response> getTransactionList() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> getTransactionById(int? id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/$id';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> addTransaction(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> updateTransaction(
//       int? id, String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/edit/:slug';

//     final res = await http.put(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> deleteTransaction(String id) async {
//     String gettransactionUrl = '/transaction/delete/:slug';

//     final res = await http.delete(HelperService.buildUri(gettransactionUrl));
//     return res;
//   }

//   Future<http.Response> Convert(String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/trade/convert';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> mintToken(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/create';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> SetupSales(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/sales/:slug';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> SetupAuction(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/auction/:slug';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> AcceptBid(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/nft/bid/accept/$id';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> AcceptOffe(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/nft/offer/accept/$id';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> DeclineOffer(String id) async {
//     String gettransactionUrl = '/transaction/nft/offer/decline/$id';

//     final res = await http.delete(HelperService.buildUri(gettransactionUrl));
//     return res;
//   }

//   Future<http.Response> DeclineBid(String id) async {
//     String gettransactionUrl = '/p2p/list';

//     final res = await http.delete(HelperService.buildUri(gettransactionUrl));
//     return res;
//   }

//   Future<http.Response> CancelTransfer(String id) async {
//     String gettransactionUrl = '/transaction/nft/transfer/cancel/$id';

//     final res = await http.delete(HelperService.buildUri(gettransactionUrl));
//     return res;
//   }

//   Future<http.Response> CoinTransfer(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/coin/transfer';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> CryptoPayment(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/crypto/payment';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> startCardPayment(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/card/payment';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> startCryptoOffer(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/crypto/offer';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> startCardOffer(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/nft/card/offer';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> NftTransfer(
//       String id, String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/transfer/$id';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> startCryptoBid(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/nft/crypto/bid';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> onmeta(String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/onmeta';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> onmetacreateOnrampOrder(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/onmeta/onramporder/create';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   static Future<http.Response> onmetaRefreshAccessToken(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/refreshacesstoken';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> onmetagetTokens(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/tokens';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> onmetagetCurrencies(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/currencies';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> onmetagetOrderHistory(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/orderhistory/$id';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> onmetacreateOfframprampOrder(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/offramp/createorder';

//     final res = await http.post(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   static Future<http.Response> onmetagetQuatationByFiatAmt(String id) async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction/onmeta/fiatquatation';

//     final res = await http.post(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response> startCardBid(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/p2p/list';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }

//   Future<http.Response> onmetaacceptOnrampOrder(
//       String roleName, String roleDescription) async {
//     String gettransactionUrl = '/transaction/onmeta/acceptOnrampOrder';

//     final res = await http.post(HelperService.buildUri(gettransactionUrl),
//         body: {"role_name": roleName, "role_description": roleDescription});
//     return res;
//   }


//   Future<http.Response>  FetchLiveUpcomimgAuctions() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchLiveUpcomingDrops() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchTopCollectors() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchFeaturedCreations() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchFeaturedCreators() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchRecentSales() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   Future<http.Response>  FetchRecentCreations() async {
//     // Read from DB or make network request etc...
//     String gettransactionUrl = '/transaction';

//     final res = await http.get(
//       HelperService.buildUri(gettransactionUrl),
//       headers: HelperService.buildHeaders(),
//     );
//     return res;
//   }

//   //
// }


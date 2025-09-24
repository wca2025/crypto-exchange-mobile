// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:cx/data/models/user.dart';
// import 'package:cx/data/dataproviders/user_provider.dart';
// import 'package:http/http.dart';
// import 'package:http/src/response.dart';
// import 'package:http_interceptor/http/intercepted_client.dart';

// import '../dataproviders/user_provider.dart';
// import '../models/user.dart';

// class UserRepository {
//   Future<List<User>?> getAllUsersRepo() async {
//     Response res = await UserProvider.getUserList();

//     print('Response code: ${res.statusCode}');

//     try {
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
//     } catch (e) {
//       print('eerror:${e}');
//     }
//   }

//   Future<User> getUserRepo(int? id) async {
//     var result;
//     Response response = await UserProvider.getUserById(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<List<User>> getMarketPairsfuturebtcByIdRepo() async {
//     Response res = await UserProvider.getMarketPairsfuturebtc();

//     print('Response code: ${res.statusCode}');


//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
  
   
   
//   }

//   Future<List<User>> getMarketPairsfuturematicRepo() async {
//     Response res = await UserProvider.getMarketPairsfuturematic();

//     print('Response code: ${res.statusCode}');

    
//        if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
   
  
//   }

//   Future<List<User>> getMarketPairsfutureusdtRepo() async {
//     Response res = await UserProvider.getMarketPairsfutureusdt();

//     print('Response code: ${res.statusCode}');

 
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
   
    
//   }

//   Future<List<User>> getMarketPairsspotbtcRepo() async {
//     Response res = await UserProvider.getMarketPairsspotbtc();

//     print('Response code: ${res.statusCode}');

  
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
    
    
//   }

//   Future<List<User>> getMarketPairsspotmaticRepo() async {
//     Response res = await UserProvider.getMarketPairsspotmatic();

//     print('Response code: ${res.statusCode}');

   
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
  
//   }

//   Future<List<User>> getMarketPairsspotusdtRepo() async {
//     Response res = await UserProvider.getMarketPairsspotusdt();

//     print('Response code: ${res.statusCode}');

   
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }

//   }

//   Future<User> getconverterRepo(int? id) async {
//     var result;
//     Response response = await UserProvider.getconverter(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<List<User>> getNewMarketsRepo() async {
//     Response res = await UserProvider.getNewMarkets();

//     print('Response code: ${res.statusCode}');


//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
  
//   }

//   Future<List<User>> getGainerLosserMarketsRepo() async {
//     Response res = await UserProvider.getGainerLosserMarkets();

//     print('Response code: ${res.statusCode}');

   
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
  
//   }

//   Future<List<User>> gettrendingMarketsRepo() async {
//     Response res = await UserProvider.gettrendingMarkets();

//     print('Response code: ${res.statusCode}');

    
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];

//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
   
//   }

//   Future<User> updateantiphraseRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateuser(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> updateuserRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateuser(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<List<User>> getcryptosRepo(int? id) async {
//     Response res = await UserProvider.getcryptos(id);

//     print('Response code: ${res.statusCode}');

  
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
    
//   }

//   Future<List<User>> getfiatsRepo(int? id) async {
//     Response res = await UserProvider.getfiats(id);

//     print('Response code: ${res.statusCode}');

   
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
    
//   }
//   }
//   Future<User> EmailNotificationConfirmationRepo(
//     int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.EmailNotificationConfirmation(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> PhoneNotificationConfirmationRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.PhoneNotificationConfirmation(
//         id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> createApiRepo(String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.createApi(
//       roleName,roleDescription
//     );

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<List<User>> listApiRepo() async {
//     Response res = await UserProvider.listApi();

//     print('Response code: ${res.statusCode}');

    
//       if (res.statusCode != 200) {
//         throw Exception('error getting covid api response');
//       } else {
//         Iterable Users = jsonDecode(res.body);

//         List<User> dataUsers = [];
//         for (var User in Users) {
//           User dataUsers = User.fromJson(User);
//           // dataAssets.add(asset);
//         }

//         return dataUsers;
//       }
   
//   }

//   Future<User> readApiRepo(id) async {
//     var result;
//     Response response = await UserProvider.readApi(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> deleteApiRepo(id) async {
//     var result;
//     Response response = await UserProvider.deleteApi(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> updateApiRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateApi(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> getSecretRepo(int? id) async {
//     var result;
//     Response response = await UserProvider.getSecret(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> verifyIDRepo(id) async {
//     var result;
//     Response response = await UserProvider.verifyID(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> updateKYCRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateKYC(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> updateWithdrawalPhraseRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.updateWithdrawalPhrase(
//         id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateEmailPhraseRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateEmailPhrase(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> deleteSubAccountRepoid(id) async {
//     var result;
//     Response response = await UserProvider.deleteSubAccount(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateLoginPhraseRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.updateLoginPhrase(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> freezeSubAccountRepo(id) async {
//     var result;
//     Response response = await UserProvider.freezeSubAccount(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> createSubAccountRepo(
//       String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.createSubAccount(roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> securityverifycheckRepo(id) async {
//     var result;
//     Response response = await UserProvider.securityverifycheck(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> listSubAccountRepo() async {
//     var result;
//     Response response = await UserProvider.listSubAccount();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> readSubAccountRepo(id) async {
//     var result;
//     Response response = await UserProvider.readSubAccount(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateSubAccountRepo(int? id ,String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.updateSubAccount( id , roleName,  roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateTwofaRepo(int? id ,String roleName, String roleDescription) async {
//     var result;
//     Response response = await UserProvider.updateTwofa(id,roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateEmailRepo(int? id,String  roleName, String roleDescription  ) async {
//     var result;
//     Response response = await UserProvider.updateEmail(id,roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updatePhoneRepo(int? id,String roleName,String  roleDescription) async {
//     var result;
//     Response response = await UserProvider.updatePhone(id,roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> readRepo(int? id) async {
//     var result;
//     Response response = await UserProvider.read(id);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> updateLoginPasswordRepo(int? id, String roleName,String  roleDescription) async {
//     var result;
//     Response response = await UserProvider.updateLoginPassword(id,roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   static Future<User> publicProfileRepo(int? id) async {
//     var result;
//     Response response = await UserProvider.publicProfile(id);

//     print('Response code: ${response.statusCode}');
  
//       if (response.statusCode == 200) {
//         return result = User.fromJson(json.decode(response.body));
//       } else {
//         throw Exception("Failed to load joke");
//       }
  
  

//   }

//   static Future<User> updateRepo(
//       int? id, String roleName, String roleDescription) async {
//     var result;
//     Response response =
//         await UserProvider.update(id, roleName, roleDescription);

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> featuredcollectorsRepo() async {
//     var result;
//     Response response = await UserProvider.featuredcollectors();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

//   Future<User> featuredcreatorsRepo() async {
//     var result;
//     Response response = await UserProvider.featuredcreators();

//     print('Response code: ${response.statusCode}');

//     if (response.statusCode == 200) {
//       return result = User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Failed to load joke");
//     }
//   }

// // static  Future<User> updateTradingPasswordRepo(
// //  {required user}) async {
// //     var result;
// //     Response response =
// //         await UserProvider.updateTradingPassword(roleName);

// //     print('Response code: ${response.statusCode}');

// //     if (response.statusCode == 200) {
// //       return result = User.fromJson(json.decode(response.body));
// //     } else {
// //       throw Exception("Failed to load joke");
// //     }
// //   }
// }

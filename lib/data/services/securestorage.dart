// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class SecureStorage {
//   // Create an instance and enable secure encryption:
//   static const storage = FlutterSecureStorage(
//       aOptions: AndroidOptions(encryptedSharedPreferences: true));

//   static Future<void> saveData(String key, String value) async {
//     await storage.write(key: key, value: value);
//   }

//   static Future<String?> readData(String key) async {
//     return await storage.read(key: key);
//   }

//   static Future<Map<String, String>> readAllData(String key) async {
//     return await storage.readAll();
//   }

//   static Future<bool> containsData(String key) async {
//     return await storage.containsKey(key: key);
//   }

//   static Future<void> deleteData(String key) async {
//     await storage.delete(key: key);
//   }

//   static Future<void> deleteAllData() async {
//     await storage.deleteAll();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _keyEmail = '';
  final String _keyPassWord = '';
  final String _keyPhonenumber = '';
  final String _keyCountrycode = '';
  final String _keyReferalcode = '';
  Future setEmail(String email) async {
    await storage.write(key: _keyEmail, value: email);
  }

  Future<String?> getEmail() async {
    return await storage.read(key: _keyEmail);
  }

  Future setPassWord(String password) async {
    await storage.write(key: _keyPassWord, value: password);
  }

  Future<String?> getPassWord() async {
    return await storage.read(key: _keyPassWord);
  }

  Future setPhonenumber(String phonenumber) async {
    await storage.write(key: _keyPhonenumber, value: phonenumber);
  }

  Future<String?> getPhonenumber() async {
    return await storage.read(key: _keyPhonenumber);
  }

  Future setCountrycode(String countrycode) async {
    await storage.write(key: _keyCountrycode, value: countrycode);
  }

  Future<String?> getCountrycode() async {
    return await storage.read(key: _keyCountrycode);
  }

  Future<String?> getReferalcode() async {
    return await storage.read(key: _keyReferalcode);
  }

  Future setReferalcode(String referalcode) async {
    await storage.write(key: _keyReferalcode, value: referalcode);
  }
}

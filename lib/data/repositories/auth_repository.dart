import 'dart:async';
import 'dart:convert';
import 'dart:core';

import '../../presentation/pro/countrycode.dart';
import 'package:flutter/material.dart';
import '../../data/dataproviders/auth_provider.dart';
import '../../data/models/user.dart';
import '../../data/dataproviders/account_provider.dart';
import '../../data/services/apiinterceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import '../../data/services/secure_storage_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  late final AuthProvider authProvider;

  static Future<User> loadUser() async {
    final json = await SecureStorageService.storage.read(
      key: SecureStorageService.userKey,
    );
    if (json != null) {
      return User.fromJson(jsonDecode(json));
    } else {
      throw Exception('error User.');
    }
  }

  Future<void> refreshTokenRepo(User user) async {
    final Response res = await authProvider.refreshToken();
    print('User code: ${res.statusCode}');
    var result;
    return result;
  }

  Future<User> loginRepo(
      String email, String password, String, phonenumber, countrycode) async {
    final Response res =
        await authProvider.login(email, password, phonenumber, countrycode);
    print('User code: ${res.statusCode}');

    var result;
    return result;
  }

  Future<User> signupRepo(String email, String phonenumber, String password,
      String countrycode, String referalcode) async {
    final Response res = await AuthProvider.signup(
        email, phonenumber, password, countrycode, referalcode);
    print('User code: ${res.statusCode}');

    final statusType = (res.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(res.body);
        final user = User.fromJson(json);

        // saveUser(user);

        return user;
      case 400:
      case 300:
      case 500:
      default:
        throw ('Error contacting the server!');
    }
  }

  Future<User> verificationemailverifyRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.verificationemailverify(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> verificationphoneverifyRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.verificationphoneverify(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> verificationemailRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.verificationemail(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> verificationphoneRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.verificationphone(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> tokenRepo(String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.token(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> checkuserRepo(String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.checkuser(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> signoutRepo() async {
    var result;
    Response response = await authProvider.signout();

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> totpsecretgenerateRepo(String id) async {
    var result;
    Response response = await authProvider.totpsecretgenerate(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> totpsecretverifyRepo(String id) async {
    var result;
    Response response = await authProvider.totpsecretverify(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetpasswordverificationemailRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetpasswordverificationemail(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetpasswordverificationphoneRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetpasswordverificationphone(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetpasswordverificationphoneverifyRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetpasswordverificationphoneverify(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetpasswordverificationemailverifyRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetpasswordverificationemailverify(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetpasswordphoneRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.resetpasswordphone(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> generateRepo(String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.generate(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> refreshtokengenerateRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.refreshtokengenerate(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> twiliotesRepot(String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.twiliotest(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> phoneverificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.phoneverification(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordEmailRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.resetPasswordEmail(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordPhoneRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.resetPasswordPhone(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> regenerateRepo(String id) async {
    var result;
    Response response = await authProvider.regenerate(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> handleRefreshTokenRepo(String id) async {
    var result;
    Response response = await authProvider.handleRefreshToken(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> totpGenerateSecretRepo(String id) async {
    var result;
    Response response = await authProvider.totpGenerateSecret(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> totpVerifySecretRepo(String id) async {
    var result;
    Response response = await authProvider.totpVerifySecret(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> EmailVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.EmailVerification(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> PhoneVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.PhoneVerification(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordPhoneVerificationChecksRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetPasswordPhoneVerificationChecks(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordEmailVerificationChecksRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetPasswordEmailVerificationChecks(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordEmailVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetPasswordEmailVerification(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> resetPasswordPhoneVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.resetPasswordPhoneVerification(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> signupEmailVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.signupEmailVerification(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> signupPhoneVerificationRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.signupPhoneVerification(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> signupPhoneVerificationChecksRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.signupPhoneVerificationChecks(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> signupEmailVerificationChecksRepo(
      String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.signupEmailVerificationChecks(
        roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> twilioTestRepo(String roleName, String roleDescription) async {
    var result;
    Response response =
        await authProvider.twilioTest(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> verifyJwtRepo(String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.verifyJwt(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  Future<User> checkUserRepo(String roleName, String roleDescription) async {
    var result;
    Response response = await authProvider.checkUser(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  //
  Future<User> requireSigninRepo(String id) async {
    var result;
    Response response = await authProvider.requireSignin(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

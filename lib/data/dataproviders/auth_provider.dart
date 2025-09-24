import 'dart:async';
import 'dart:core';

import '../../data/models/user.dart';
import 'package:flutter/material.dart';
import '../../data/services/apiinterceptor.dart';
import '../../data/services/constants.dart';
import '../../data/services/helper_service.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthProvider {
//path varibales here

  Future<http.Response> login(String email, String password, String countrycode,
      String phonenumber) async {
    // Read from DB or make network request etc...

    const String userUrl = '/login';
    final res = await http.post(HelperService.buildUri(userUrl),
        headers: HelperService.buildHeaders(),
        body: {
          "email": email,
          "password": password,
          "countrycode": countrycode,
          "phonenumber": phonenumber
        });
    return res;
  }

  static Future<http.Response> signup(String email, String password,
      String phonenumber, String countrycode, String referalcode) async {
    // Read from DB or make network request etc...

    const String signupUrl = '/signup';

    final res = await http.post(HelperService.buildUri(signupUrl),
        headers: HelperService.buildHeaders(),
        body: {
          "email": email,
          "password": password,
          "phonenumber": phonenumber,
          "countrycode": countrycode,
          "referalcode": referalcode,
        });
    return res;
  }

//
  Future<Response> verificationemailverify(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/emailverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> verificationphoneverify(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/phoneverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// '
  Future<Response> verificationemail(
      String roleName, String roleDescription) async {
    const String userUrl = '/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> verificationphone(
      String roleName, String roleDescription) async {
    const String userUrl = '/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> token(String roleName, String roleDescription) async {
    const String userUrl = '/token';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }
// /login

//
  Future<Response> checkuser(String roleName, String roleDescription) async {
    const String userUrl = '/checkuser';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> signout() async {
    const String userUrl = '/signout';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

  Future<Response> refreshToken() async {
    const String userUrl = '/signout';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

//
  Future<Response> totpsecretgenerate(String id) async {
    const String userUrl = '/generate/totpsecret';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

// /
  Future<Response> totpsecretverify(String id) async {
    const String userUrl = '/verify/totpsecret';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

//
  Future<Response> resetpasswordverificationemail(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> resetpasswordverificationphone(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> resetpasswordverificationphoneverify(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/phoneverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> resetpasswordverificationemailverify(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/emailverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> resetpasswordemail(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> resetpasswordphone(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> generate(String roleName, String roleDescription) async {
    const String userUrl = '/generate';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// '
  Future<Response> refreshtokengenerate(
      String roleName, String roleDescription) async {
    const String userUrl = '/generate/refreshtoken';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> twiliotest(String roleName, String roleDescription) async {
    const String userUrl = '/twiliotest';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

// /
  Future<Response> emailverification(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

//
  Future<Response> phoneverification(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  // ,
  Future<Response> resetPasswordEmail(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  // ,
  Future<Response> resetPasswordPhone(
      String roleName, String roleDescription) async {
    const String userUrl = '/login';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  // ,
  Future<Response> regenerate(String id) async {
    const String userUrl = '/generate';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

  //  ,
  Future<Response> handleRefreshToken(String id) async {
    const String userUrl = '/generate/refreshtoken';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

  //   ,
  Future<Response> totpGenerateSecret(String id) async {
    const String userUrl = '/generate/totpsecret';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

  //    ,
  Future<Response> totpVerifySecret(String id) async {
    const String userUrl = '/verify/totpsecret';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }

  //    ,
  Future<Response> EmailVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //     ,
  Future<Response> PhoneVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //      ,
  Future<Response> resetPasswordPhoneVerificationChecks(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/phoneverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //       ,
  Future<Response> resetPasswordEmailVerificationChecks(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/emailverify';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //       ,
  Future<Response> resetPasswordEmailVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //        ,
  Future<Response> resetPasswordPhoneVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/reset-password/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //         ,
  Future<Response> signupEmailVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //          ,
  Future<Response> signupPhoneVerification(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //           ,
  Future<Response> signupPhoneVerificationChecks(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/phone';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //            ,
  Future<Response> signupEmailVerificationChecks(
      String roleName, String roleDescription) async {
    const String userUrl = '/signup/verification/email';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //             ,
  Future<Response> twilioTest(String roleName, String roleDescription) async {
    const String userUrl = '/twiliotest';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }
  //             ,

  //               ,
  Future<Response> verifyJwt(String roleName, String roleDescription) async {
    const String userUrl = '/login';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  //               ,
  Future<Response> checkUser(String roleName, String roleDescription) async {
    const String userUrl = '/checkuser';
    final res = await http.post(HelperService.buildUri(userUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }
  //               ,

  //
  Future<Response> requireSignin(String id) async {
    const String userUrl = '/login';
    final res = await http.get(HelperService.buildUri(userUrl));
    return res;
  }
}

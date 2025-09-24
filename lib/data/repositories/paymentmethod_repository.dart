import 'dart:convert';

import 'package:flutter/material.dart';
import '../../data/models/paymentmethod.dart';
import '../../data/dataproviders/paymentmethod_provider.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../models/transaction.dart';

class PaymentmethodRepository {
  static Future<List<Paymentmethod>?> GetAllPaymentMethods() async {
    Response res = await PaymentMethodProvider.getPaymentmethodList();

    print('Response code: ${res.statusCode}');

    try {
      if (res.statusCode != 200) {
        throw Exception('error getting covid api response');
      } else {
        Iterable PaymentMethods = jsonDecode(res.body);

        List<Paymentmethod> dataPaymentMethods = [];
        for (var PaymentMethod in PaymentMethods) {
          Paymentmethod dataPaymentMethods =
              PaymentMethod.fromJson(PaymentMethod);
          // dataAssets.add(asset);
        }

        return dataPaymentMethods;
      }
    } catch (e) {
      print('eerror:${e}');
    }
  }

  static Future<Paymentmethod> GetPaymentMethod(id) async {
    var result;
    Response response = await PaymentMethodProvider.getPaymentmethodById(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Paymentmethod.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  static Future<Paymentmethod> DeletePaymentMethod(String id) async {
    var result;
    Response response = await PaymentMethodProvider.deletePaymentmethod(id);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Paymentmethod.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  static Future<Paymentmethod> AddPaymentMethod(
      String roleName, String roleDescription) async {
    var result;
    Response response =
        await PaymentMethodProvider.addPaymentmethod(roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Paymentmethod.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }

  static Future<Paymentmethod> UpdatePaymentMethod(
      int? id, String roleName, String roleDescription) async {
    var result;
    Response response = await PaymentMethodProvider.updatePaymentmethod(
        id, roleName, roleDescription);

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return result = Paymentmethod.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

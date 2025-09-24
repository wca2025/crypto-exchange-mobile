import '../../data/models/p2p.dart';
import 'package:flutter/material.dart';
import '../../presentation/pro/add_payment_method.dart';
import 'package:http/http.dart' as http;

import '../services/helper_service.dart';

class PaymentMethodProvider {
  static Future<http.Response> getPaymentmethodList() async {
    // Read from DB or make network request etc...
    String getPaymentmethodUrl = '/payment/list';

    final res = await http.get(
      HelperService.buildUri(getPaymentmethodUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> getPaymentmethodById(String id) async {
    // Read from DB or make network request etc...
    String getPaymentmethodUrl = '/payment/$id';

    final res = await http.get(
      HelperService.buildUri(getPaymentmethodUrl),
      headers: HelperService.buildHeaders(),
    );
    return res;
  }

  static Future<http.Response> addPaymentmethod(
      String roleName, String roleDescription) async {
    String getPaymentmethodUrl = '/paymentmethod/create';

    final res = await http.post(HelperService.buildUri(getPaymentmethodUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> updatePaymentmethod(
      int? id, String roleName, String roleDescription) async {
    String getPaymentmethodUrl = '/paymentmethod/edit/$id';

    final res = await http.put(HelperService.buildUri(getPaymentmethodUrl),
        body: {"role_name": roleName, "role_description": roleDescription});
    return res;
  }

  static Future<http.Response> deletePaymentmethod(String id) async {
    String getPaymentmethodUrl = '/paymentmethod/delete/$id';

    final res = await http.delete(HelperService.buildUri(getPaymentmethodUrl));
    return res;
    // }
  }
}

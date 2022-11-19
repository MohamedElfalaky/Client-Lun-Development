import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../app/constants.dart';
import '../../app/keys.dart';

class LastOrderRepo {
  Future<LastOrderModel?> getLastOrders(String token) async {
    try {
      var response = await http.get(
        Uri.parse('$baseURL/api/orders?api_token=${token}'),
        headers: headers,
      );

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        final data = LastOrderModel.fromJson(responsemap);

        return data;
      } else {
        MyApplication.showToast(
            text: responsemap["message"], color: ToastColors.error);
      }
    } on TimeoutException catch (e) {
      if (kDebugMode) {
        print('TimeoutException: ${e.toString()}');
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print('SocketException: ${e.toString()}');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception: ${e.toString()}");
      }
    }
    return null;
  }
}

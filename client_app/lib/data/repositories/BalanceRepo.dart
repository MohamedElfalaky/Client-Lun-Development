import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';
import 'package:client_app/data/Models/balance_model/balance_model.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/data/Models/populer_model/populer_model.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../app/constants.dart';
import '../../app/keys.dart';

class BalanceRepo {
  Future<BalanceModel?> getBalance(String token) async {
    try {
      var response = await http.get(
        Uri.parse('$baseURL/api/myBalance?api_token=$token'),
        headers: headers,
      );

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        final data = BalanceModel.fromJson(responsemap);
        // MyApplication.showToast(
        //     text: data.message!, color: ToastColors.success);
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

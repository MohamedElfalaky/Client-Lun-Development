import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/CheckPhone/check_phone.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CheckPhoneRepo {
  Future<CheckPhone?> checkPhone(String phone) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/api/checkPhone'),
        body: {'phone': phone},
        // headers: headers,
      );
      Map<String, dynamic> responsemap = json.decode(response.body);
      if (kDebugMode) {
        print(responsemap);
      }
      if (response.statusCode == 200 && responsemap["success"] == true) {
        if (kDebugMode) {
          print(responsemap);
        }
        final data = CheckPhone.fromJson(responsemap);
        MyApplication.showToast(
            text: responsemap["message"], color: ToastColors.success);
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
        print('Exception: ${e.toString()}');
      }
    }
    return null;

    // return null;
    // return null;
  }
}

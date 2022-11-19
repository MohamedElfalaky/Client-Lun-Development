import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/create_account/create_account.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CreateAccountRepo {
  Future<CreateAccount?> createAccountRepo(
      String name, String phone, String password) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/api/register'),
        body: {'name': name, 'phone': phone, 'password': password},
        headers: headers,
      );
      Map<String, dynamic> responsemap = json.decode(response.body);
      if (kDebugMode) {
        print(responsemap);
      }
      if (response.statusCode == 200 && responsemap["success"] == true) {
        if (kDebugMode) {
          print(responsemap);
        }
        final data = CreateAccount.fromJson(responsemap);
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
    }
    return null;
  }
}

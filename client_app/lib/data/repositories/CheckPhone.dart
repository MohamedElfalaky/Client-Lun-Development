import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/CheckPhone/check.phone.dart';
import 'package:client_app/data/endpoints.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CheckPhoneRepo {
  Future<Check?> checkPhone(String phone) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/api/checkPhone'),
        body: {'phone': phone},
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
        final data = Check.fromJson(response.body);
        return data;
      } else {
        MyApplication().showToastMessage(responsemap["message"]);
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

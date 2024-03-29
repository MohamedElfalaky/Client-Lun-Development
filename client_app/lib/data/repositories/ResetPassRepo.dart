import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/login_model/login_model.dart';
import 'package:client_app/data/Models/reset_password_model/reset_password_model.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ResetPassRepo {
  Future<ResetPasswordModel?> reset({required phone}) async {
    try {
      var response = await http.post(
        Uri.parse('$baseURL/api/forget_password'),
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
        final data = ResetPasswordModel.fromJson(responsemap);
        MyApplication.showToast(
            text: data.message!, color: ToastColors.success);
        return data;
      } else if (response.statusCode == 200 &&
          responsemap["success"] == false) {
        final data = ResetPasswordModel.fromJson(responsemap);
        MyApplication.showToast(text: data.message!, color: ToastColors.error);
        return data;
      } else {
        if (kDebugMode) {
          print(responsemap);
        }
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

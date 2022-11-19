import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/order_details/order_details.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OrderDetailsRepo {
  Future<OrderDetails?> getOrderDetails({required int id}) async {
    try {
      var response = await http.get(
        Uri.parse(
            '$baseURL/api/orders/$id?api_token=9koaZSQjlVKVtgePpOsTCAIYWYIM2ZhHUcnys0zwyrmQUKM0J07tlYDD81YV'),
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
        final data = OrderDetails.fromJson(responsemap);
        // MyApplication.showToast(
        //     text: responsemap["message"], color: ToastColors.success);
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

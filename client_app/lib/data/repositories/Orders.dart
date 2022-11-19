import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/data/Models/orders/orders.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OrdersRepo {
  Future<Orders?> getOrders(
      {isCanceled = false, isDelivered = false, isInProgress = false}) async {
    isCanceled = isCanceled;
    isDelivered = isDelivered;
    isInProgress = isInProgress;

    try {
      var response = await http.get(
        isDelivered
            ? Uri.parse(
                '$baseURL/api/orders?statuses[0]=5&api_token=9koaZSQjlVKVtgePpOsTCAIYWYIM2ZhHUcnys0zwyrmQUKM0J07tlYDD81YV')
            : isInProgress
                ? Uri.parse(
                    '$baseURL/api/orders?statuses[0]=1&statuses[1]=2&statuses[2]=3&statuses[3]=4&api_token=9koaZSQjlVKVtgePpOsTCAIYWYIM2ZhHUcnys0zwyrmQUKM0J07tlYDD81YV')
                : isCanceled
                    ? Uri.parse(
                        '$baseURL/api/orders?statuses[0]=6&api_token=9koaZSQjlVKVtgePpOsTCAIYWYIM2ZhHUcnys0zwyrmQUKM0J07tlYDD81YV')
                    : Uri.parse(
                        '$baseURL/api/orders?statuses[0]=0&api_token=9koaZSQjlVKVtgePpOsTCAIYWYIM2ZhHUcnys0zwyrmQUKM0J07tlYDD81YV'),
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
        final data = Orders.fromJson(responsemap);
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

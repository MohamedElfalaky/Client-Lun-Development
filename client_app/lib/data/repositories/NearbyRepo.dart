import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../app/constants.dart';
import '../../app/keys.dart';

class NearbyRepo {
  Future<NearbyModel?> getNearby(String lat, String long, int receiveMethod,
      {bool rateOrderBy = false,
      bool normalOrderBy = false,
      String ordeRbyType = "asc"}) async {
    try {
      var response = await http.get(
        Uri.parse(
            '$baseURL/api/markets?myLat=$lat&myLon=$long&areaLat=$lat&areaLon=$long&receive_method=$receiveMethod&rate_order_by=$rateOrderBy&normal_order_by=$normalOrderBy&order_by_type=$ordeRbyType'),
        headers: headers,
      );

      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        final data = NearbyModel.fromJson(responsemap);
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

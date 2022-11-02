import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:talabatcom/Data/Models/AboutUs/AboutUsModel.dart';
import 'package:talabatcom/app/keys.dart';
import 'package:talabatcom/helpers/utils/myApplication.dart';

import '../../../app/global.dart';

class AboutUsRepo {
  Future<AboutUsModel?> getAboutUs() async {
    try {
      var response = await http.get(
        Uri.parse('$apikey/page?id=1'),
        headers: headers,
      );
      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        final data = AboutUsModel.fromJson(jsonDecode(response.body));
        return data;
      } else {
        MyApplication().showToastView(message: responsemap["message"]);
        MyApplication().handleUnAuthenticatedUser(
            responsemap["message"], navigatorKey.currentState!.context);
      }
    } on TimeoutException catch (e) {
    } on SocketException catch (e) {
    } on Error catch (e) {}
  }
}

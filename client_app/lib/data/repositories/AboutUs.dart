import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../app/keys.dart';
import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';
import 'package:http/http.dart' as http;
import '../../app/constants.dart';
import '../../helpers/myApplication.dart';

import '../../../app/global.dart';

class AboutUsRepo {
  Future<AboutUsModel?> getAboutUs() async {
    try {
      var response = await http.get(
        Uri.parse('$apikey/page?id=1'),
        headers: headers,
      );
      var response2 = await http.post(
        Uri.parse('$apikey/page?id=1'),
        body: {'', ''},
        headers: headers,
      );
      Map<String, dynamic> responsemap = json.decode(response.body);
      if (response.statusCode == 200 && responsemap["success"] == true) {
        //   final data = AboutUsModel.fromJson(jsonDecode(response.body));
        //   return data;
      } else {
        MyApplication().showToastMessage(responsemap["message"]);
      }
    } on TimeoutException catch (e) {
    } on SocketException catch (e) {
    } on Error catch (e) {}
  }
}

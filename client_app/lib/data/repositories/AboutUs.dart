import 'dart:async';

import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';

class AboutUsRepo {
  Future<AboutUsModel?> getAboutUs() async {
    return null;

    // try {
    //   var response = await http.get(
    //     Uri.parse('$baseURL/page?id=1'),
    //     headers: headers,
    //   );
    //   // var response2 = await http.post(
    //   //   Uri.parse('$apikey/page?id=1'),
    //   //   body: {'', ''},
    //   //   headers: headers,
    //   // );
    //   Map<String, dynamic> responsemap = json.decode(response.body);
    //   if (response.statusCode == 200 && responsemap["success"] == true) {
    //   final data = AboutUsModel.fromJson(jsonDecode(response.body));
    //   return data;
    // } else {
    // MyApplication().showToastMessage(responsemap["message"]);
  }
}
    // return null;
  // }
// }

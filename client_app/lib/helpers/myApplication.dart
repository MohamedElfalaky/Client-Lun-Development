import 'package:flutter/material.dart';

class MyApplication {
  bool checkInternet() {
    return true;
  }

  navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  navigateToReplace(Widget page, BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  showToastMessage(String message) {
    //
  }
}

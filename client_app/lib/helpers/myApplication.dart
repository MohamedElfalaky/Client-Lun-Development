import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApplication {
  bool checkInternet() {
    return true;
  }

  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToReplace(Widget page, BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(Widget page, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: ((context) => page)),
      ModalRoute.withName('/'),
    );
  }

  static showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 18, 228, 43),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static double hightClc(BuildContext context, int myHeight) {
    return MediaQuery.of(context).size.height * myHeight / 812;
  }

  static double widthClc(BuildContext context, int myWidth) {
    return MediaQuery.of(context).size.width * myWidth / 375;
  }
}

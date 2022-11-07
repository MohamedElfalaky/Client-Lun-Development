import 'package:client_app/style/colors.dart';
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

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  static double hightClc(BuildContext context, int myHeight) {
    return MediaQuery.of(context).size.height * myHeight / 926;
  }

  static double widthClc(BuildContext context, int myWidth) {
    return MediaQuery.of(context).size.width * myWidth / 428;
  }

  static showToast({
    required String text,
    required ToastColors color,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: setToastColor(color),
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}

enum ToastColors {
  success,
  error,
  warning,
}

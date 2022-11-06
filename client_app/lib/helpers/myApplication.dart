import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.error:
      c = Colors.red;
      break;
    case ToastColors.success:
      c = Colors.green;
      break;
    case ToastColors.warning:
      c = Colors.amber;
      break;
  }

  return c;
}

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
    return MediaQuery.of(context).size.height * myHeight / 812;
  }

  static double widthClc(BuildContext context, int myWidth) {
    return MediaQuery.of(context).size.width * myWidth / 375;
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

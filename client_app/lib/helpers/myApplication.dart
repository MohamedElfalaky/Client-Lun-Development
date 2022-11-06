import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndFinish(BuildContext context, Widget widget, {data}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(
          arguments: data,
        ),
      ),
      (Route<dynamic> route) => false,
    );

void navigateTo(BuildContext context, Widget widget, {data}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(
          arguments: data,
        ),
      ),
    );

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

void showToast({
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

  showToastMessage(String message) {}
}

enum ToastColors {
  success,
  error,
  warning,
}

import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/material.dart';

Color onboardingColor = Colors.black38;

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

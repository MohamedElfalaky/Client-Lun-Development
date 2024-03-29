import 'dart:ui';

import 'package:flutter/material.dart';

class OnBoardingController {
  ///vars
  //
//
  ///methods

  Widget buildBlur(
          {required Widget child, double sigmaX = 10, double sigmaY = 9}) =>
      ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          child: child,
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
        ),
      );
}

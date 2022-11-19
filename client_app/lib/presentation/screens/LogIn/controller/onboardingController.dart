import 'dart:ui';

import 'package:flutter/material.dart';

class LogInController {
  ///vars

  ///methods

  Widget buildBlur(
          {required Widget child, double sigmaX = 11, double sigmaY = 9}) =>
      ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          child: child,
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
        ),
      );
}

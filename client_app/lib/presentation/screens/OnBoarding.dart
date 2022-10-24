import 'dart:ui';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 1,
                color: Color(0XFFF5504C),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color(0XFFEDEDF4)),
            ],
          ),
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.8,
            child: PageView(
              children: [
                buildBlur(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    // color: Color(0XFFFFFFFF),
                    child: Center(
                      child: Text("Page 1"),
                    ),
                  ),
                ),
                buildBlur(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text("Page 2"),
                    ),
                  ),
                ),
                buildBlur(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text("Page 3"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildBlur(
          {required Widget child, double sigmaX = 10, double sigmaY = 10}) =>
      ClipRRect(
        borderRadius: BorderRadius.zero,
        child: BackdropFilter(
          child: child,
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
        ),
      );
}

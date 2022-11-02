import 'dart:ui';

import 'package:client_app/presentation/screens/OnboardingScreen/controller/onboardingController.dart';
import 'package:client_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  OnBoardingController onBoardingController = OnBoardingController();
  final controller = PageController();
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
                  padding: EdgeInsets.only(top: 50, left: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color(0XFFF5504C),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0XFFFFFFFF).withOpacity(0.2),
                          ),
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "❮",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
                              elevation: 0,
                              backgroundColor: Color(0XFFF5504C).withOpacity(1),
                            ),
                            onPressed: () {},
                            child: Center(
                                child: Text(
                              "skip",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                          )),
                    ],
                  )),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color(0XFFEDEDF4)),
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.9,
                child: PageView(
                  controller: controller,
                  children: [
                    onBoardingController.buildBlur(
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
                    onBoardingController.buildBlur(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text("Page 2"),
                        ),
                      ),
                    ),
                    onBoardingController.buildBlur(
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
              Container(
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

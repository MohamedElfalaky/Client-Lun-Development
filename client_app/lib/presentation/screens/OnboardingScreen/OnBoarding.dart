import 'dart:async';
import 'dart:ui';

import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/components/OnePageView.dart';
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
  final controller = PageController(initialPage: 0);
  int pageChanged = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (pageChanged < 2) {
        pageChanged++;
      } else {
        CacheHelper.saveBoolToShared("showHome", true);
        Navigator.pushReplacementNamed(context, "/registration");
      }

      controller.animateToPage(
        pageChanged,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

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
                          onPressed: () {
                            controller.animateToPage(--pageChanged,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
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
                            onPressed: () {
                              CacheHelper.saveBoolToShared("showHome", true);
                              Navigator.pushReplacementNamed(
                                  context, "/registration");
                              print(CacheHelper.getBoolFromShared("showHome"));
                            },
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
        Align(
          alignment: Alignment(0, 0.9),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) => setState(() {
                      // gives the index of current page
                      pageChanged = value;
                    }),
                    children: [
                      OnePageView(
                          "https://images.unsplash.com/photo-1530878955558-a6c31b9c97db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmljZXxlbnwwfHwwfHw%3D&w=1000&q=80",
                          "Orders prepare to depend on safety standards to keep you well"),
                      OnePageView(
                          "https://media.istockphoto.com/id/1145618475/photo/villefranche-on-sea-in-evening.jpg?s=612x612&w=0&k=20&c=vQGj6uK7UUVt0vQhZc9yhRO_oYBEf8IeeDxGyJKbLKI=",
                          "easy and convenient to make orders from anywhere to save time"),
                      OnePageView(
                          "https://cdn.pixabay.com/photo/2017/10/02/12/10/women-2808629__340.jpg",
                          "All restaurants around you in one app to save time & effort"),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF).withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFF707070),
                        expansionFactor: 4,
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color(0XFFFFFFFF).withOpacity(0.2),
                              border: Border.all(
                                  width: 2, color: Color(0XFFF5504C)),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              elevation: 0,
                              backgroundColor: Color(0XFFF5504C),
                            ),
                            onPressed: () {
                              if (pageChanged == 2) {
                                CacheHelper.saveBoolToShared("showHome", true);
                                Navigator.pushReplacementNamed(
                                    context, "/registration");
                              } else {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: const Center(
                              child: Align(
                                alignment: Alignment(0, -.15),
                                child: Text(
                                  "»",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

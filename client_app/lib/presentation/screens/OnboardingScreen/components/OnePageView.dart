import 'package:client_app/presentation/screens/OnboardingScreen/controller/onboardingController.dart';
import 'package:flutter/material.dart';

class OnePageView extends StatelessWidget {
  final String img;
  final String txt;
  OnePageView(this.img, this.txt);

  OnBoardingController onBoardingController = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    return onBoardingController.buildBlur(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0XFFFFFFFF).withOpacity(0.6),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        // color: Color(0XFFFFFFFF),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(img),
                )),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 27),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

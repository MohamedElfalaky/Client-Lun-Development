import 'dart:async';

import 'package:client_app/main.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    // Future initialization2(BuildContext? context) async {
    //   await Future.delayed(Duration(seconds: 2));
    //   Navigator.push(
    //       context!,
    //       MaterialPageRoute<void>(
    //           builder: (BuildContext context) => const MyHomePage(
    //                 title: "Home Page",
    //               )));
    // }

    final Widget svg = SvgPicture.asset('TalabatLogo'.tr(context),
        color: Color(0xffEDEDF4), semanticsLabel: 'Acme Logo');
    return Scaffold(
        backgroundColor: Color(0xFFF5504C),
        body: Center(child: Center(child: svg)));
  }
}

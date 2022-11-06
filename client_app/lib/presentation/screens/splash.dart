import 'dart:async';

import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/main.dart';
import 'package:client_app/presentation/screens/OnboardingScreen/OnBoarding.dart';
import 'package:client_app/presentation/screens/Registration/Registeration.dart';
import 'package:flutter/material.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final showLogin = CacheHelper.getBoolFromShared("showHome");
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => showLogin == true
                ? const Registration()
                : const OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    final Widget svg = SvgPicture.asset('TalabatLogo'.tr(context),
        color: Color(0xffEDEDF4), semanticsLabel: 'Acme Logo');
    return Scaffold(
        backgroundColor: Color(0xFFF5504C),
        body: Center(child: Center(child: svg)));
  }
}

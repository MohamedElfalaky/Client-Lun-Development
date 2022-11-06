import 'dart:async';

import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/SendOTP/SendOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
        color: const Color(0xffEDEDF4), semanticsLabel: 'Acme Logo');
    return Scaffold(
        backgroundColor: const Color(0xFFF5504C),
        body: Center(child: Center(child: svg)));
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SendOTP())));
  }
}

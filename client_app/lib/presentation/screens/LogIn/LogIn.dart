import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // for background
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginBackground), fit: BoxFit.cover)),
      child: GestureDetector(
        //  hide keyboard on tap anywhere
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MyApplication.widthClc(context, 24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MyApplication.hightClc(context, 63),
                      ),
                      SvgPicture.asset(
                        logInLogo,
                        height: MyApplication.hightClc(context, 153),
                        width: MyApplication.widthClc(context, 110),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 24),
                      ),
                      Text(
                        "Hello Again !",
                        style: TextStyle(color: Color(0xFFEDEDF4)),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

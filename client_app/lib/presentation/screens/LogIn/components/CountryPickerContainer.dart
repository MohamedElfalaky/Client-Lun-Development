import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/material.dart';

class CountryPickerContainer extends StatelessWidget {
  final Widget? child;
  CountryPickerContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 10),
      height: MyApplication.hightClc(context, 46),
      width: MyApplication.widthClc(context, 68),
      decoration: BoxDecoration(
          color: Color(0xFFEDEDF4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: child,
    );
  }
}

import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/main.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final onPressedHandler;
  final String? txt;
  final Color? myColor;
  const MyButton({this.onPressedHandler, this.txt, this.myColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MyApplication.hightClc(context, 56),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            textStyle: TextStyle(fontWeight: FontWeight.normal),
            elevation: 0,
            backgroundColor: myColor,
          ),
          onPressed: onPressedHandler,
          child: Center(
            child: Text(
              '$txt',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class MyFormTextField extends StatelessWidget {
  final Widget? myPrefix;
  final Widget? mySuffix;
  final String? myHint;
  final TextInputType? keyBrdType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final obscrdTxt;
  const MyFormTextField(
      {this.myPrefix,
      this.mySuffix,
      this.myHint,
      this.keyBrdType,
      required this.controller,
      this.validator,
      this.obscrdTxt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscrdTxt,
        validator: validator,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: 14),
        keyboardType: keyBrdType,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            prefixIcon: myPrefix,
            suffixIcon: mySuffix,
            hintText: myHint));
  }
}

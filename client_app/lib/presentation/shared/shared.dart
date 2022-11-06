import 'package:flutter/material.dart';

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  String? label,
  String? hint,
  Widget? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  bool isReadOnly = false,
  bool isBorder = true,
  double radius = 10,
  double width = double.infinity,
  double height = 50,
  double textSize = 20,
  Color? color,
  Color textColor = Colors.black,
  Color borderColor = Colors.grey,
  Color suffixColor = Colors.black,
  Color prefixColor = Colors.black,
  Color labelColor = Colors.grey,
  Color cursorColor = Colors.black,
  double prefixSize = 20,
  double suffixSize = 20,
  Function? validate,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          radius,
        ),
        border: isBorder
            ? Border.all(
                color: borderColor,
              )
            : null,
      ),
      child: TextFormField(
        cursorColor: cursorColor,
        controller: controller,
        validator: (value) {
          if (validate != null) {
            return validate(value) as String?;
          }
          return null;
        },
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: (value) {
          onSubmit == null ? (value) {} : onSubmit(value);
        },
        onChanged: (value) {
          onChange == null ? (value) {} : onChange(value);
        },
        onTap: () {
          onTap == null ? (value) {} : onTap();
        },
        readOnly: isReadOnly,
        enabled: isClickable,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
            color: labelColor,
            fontSize: textSize,
          ),
          prefixIcon: prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: prefix,
                )
              : null,
          suffixIcon: suffix != null
              ? Padding(
                  padding: const EdgeInsets.only(),
                  child: IconButton(
                    onPressed: () {
                      suffixPressed!();
                    },
                    icon: Icon(suffix, color: suffixColor, size: suffixSize),
                  ),
                )
              : null,
          border: const UnderlineInputBorder(),
        ),
      ),
    );

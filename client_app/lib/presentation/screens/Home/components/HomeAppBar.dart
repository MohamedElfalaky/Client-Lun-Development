import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../app/global.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MyApplication.widthClc(context, 12),
          right: MyApplication.widthClc(context, 12),
          top: MyApplication.hightClc(context, 24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MyApplication.hightClc(context, 52),
            width: MyApplication.widthClc(context, 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: Colors.white.withOpacity(.5),
            ),
            child: Icon(
              Icons.menu,
              size: 30.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: MyApplication.widthClc(context, 160),
            child: Row(
              children: [
                SizedBox(
                    height: MyApplication.hightClc(context, 28),
                    width: MyApplication.widthClc(context, 28),
                    child: SvgPicture.asset(locationIcon)),
                SizedBox(
                  width: MyApplication.widthClc(context, 4),
                ),
                Column(
                  children: [
                    const AutoSizeText(
                      "Current Location",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Tajawal",
                        color: Color(0xFF363537),
                      ),
                    ),
                    SizedBox(
                      width: MyApplication.widthClc(context, 100),
                      child: AutoSizeText(
                        wholeLocation ?? "Loading..",
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Tajawal",
                          color: Color(0xFF363537),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MyApplication.hightClc(context, 10),
                  width: MyApplication.widthClc(context, 10),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF363537),
                  ),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                color: Colors.white.withOpacity(.5),
              ),
              height: MyApplication.hightClc(context, 52),
              width: MyApplication.widthClc(context, 48),
              padding: EdgeInsets.all(6.sp),
              child: SvgPicture.asset(searchIcon)),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class FeatureOne extends StatelessWidget {
  // final String name;
  // final String svg;
  // FeatureOne(this.name, this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(14.sp),
      margin: EdgeInsets.only(right: MyApplication.widthClc(context, 16)),
      height: MyApplication.hightClc(context, 250),
      width: MyApplication.widthClc(context, 305),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20.sp)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(1),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        ),
        onPressed: () {},
        child: Builder(builder: (context) {
          return Column(
            children: [
              Container(
                  height: MyApplication.hightClc(context, 125),
                  width: MyApplication.widthClc(context, 305),
                  child: FittedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.sp),
                          topRight: Radius.circular(20.sp)),
                      child: Image.network(
                        "https://c4.wallpaperflare.com/wallpaper/197/854/431/fire-burger-5k-steak-wallpaper-preview.jpg",
                      ),
                    ),
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: MyApplication.hightClc(context, 10),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.sp),
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              height: MyApplication.hightClc(context, 64),
                              width: MyApplication.widthClc(context, 48),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.sp),
                                child: Image.network(
                                  ("https://www.dawri.news/wp-content/uploads/2020/12/IMG_20201204_030414-1200x979.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyApplication.widthClc(context, 8),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Buffalo Burger",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEDEDF4),
                                          borderRadius:
                                              BorderRadius.circular(5.sp)),
                                      height:
                                          MyApplication.hightClc(context, 21),
                                      width:
                                          MyApplication.widthClc(context, 61),
                                      child: Center(
                                        child: Text(
                                          "Burger",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MyApplication.widthClc(context, 8)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEDEDF4),
                                          borderRadius:
                                              BorderRadius.circular(5.sp)),
                                      height:
                                          MyApplication.hightClc(context, 21),
                                      width:
                                          MyApplication.widthClc(context, 61),
                                      child: Center(
                                        child: Text("Tasty",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 8),
                      ),
                      Flexible(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 24.sp,
                            width: 24.sp,
                            child: SvgPicture.asset(startss),
                          ),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          SizedBox(
                            child: Text(
                              "4.8 Rating",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: MyApplication.widthClc(context, 20),
                          ),
                          SizedBox(
                              height: 24.sp,
                              width: 24.sp,
                              child: SvgPicture.asset(tablee)),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          SizedBox(
                            child: Text(
                              "30 Table",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: MyApplication.widthClc(context, 20),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              height: 20.sp,
                              // width: 24.sp,
                              child: Image.asset(clockk)),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          SizedBox(
                            child: Text(
                              "40 min",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

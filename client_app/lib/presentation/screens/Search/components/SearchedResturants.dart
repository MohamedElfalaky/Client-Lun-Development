import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SearchedResturants extends StatelessWidget {
  final String? name;
  final String? pic;
  SearchedResturants({this.name, this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(bottom: MyApplication.hightClc(context, 16)),
      height: MyApplication.hightClc(context, 89),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(1),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        (pic!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyApplication.widthClc(context, 8),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(color: Colors.black),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFEDEDF4),
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: Center(
                              child: Text(
                                "Burger",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: MyApplication.widthClc(context, 8)),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFEDEDF4),
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: Center(
                              child: Text("Tasty",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

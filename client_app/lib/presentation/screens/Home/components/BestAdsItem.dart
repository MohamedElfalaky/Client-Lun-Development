import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestAdsItem extends StatelessWidget {
  const BestAdsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MyApplication.hightClc(context, 8),
          bottom: MyApplication.hightClc(context, 16)),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: MyApplication.hightClc(context, 314),
      width: MyApplication.widthClc(context, 327),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: MyApplication.hightClc(context, 176),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MyApplication.hightClc(context, 8),
                    left: MyApplication.widthClc(context, 8)),
                height: MyApplication.widthClc(context, 32),
                width: MyApplication.widthClc(context, 32),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: MyApplication.widthClc(context, 12),
                  vertical: MyApplication.hightClc(context, 8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MyApplication.hightClc(context, 12)),
                    child: AutoSizeText(
                      "Villa five stars",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: MyApplication.widthClc(context, 6),
                                  bottom: MyApplication.hightClc(context, 8)),
                              height: MyApplication.hightClc(context, 14),
                              width: MyApplication.widthClc(context, 14),
                              child:
                                  SvgPicture.asset("assets/AdsPics/area.svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: MyApplication.widthClc(context, 125),
                                  bottom: MyApplication.hightClc(context, 8)),
                              child: AutoSizeText(
                                "200 m",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: MyApplication.widthClc(context, 6),
                                  bottom: MyApplication.hightClc(context, 8)),
                              height: MyApplication.hightClc(context, 14),
                              width: MyApplication.widthClc(context, 14),
                              child: SvgPicture.asset(
                                  "assets/AdsPics/floor no..svg"),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MyApplication.hightClc(context, 8)),
                              child: AutoSizeText(
                                "3 floors",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Row(children: [
                            Container(
                                margin: EdgeInsets.only(
                                    right: MyApplication.widthClc(context, 6),
                                    bottom: MyApplication.hightClc(context, 8)),
                                height: MyApplication.hightClc(context, 14),
                                width: MyApplication.widthClc(context, 14),
                                child: SvgPicture.asset(
                                    "assets/AdsPics/location.svg")),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MyApplication.hightClc(context, 12)),
                              child: AutoSizeText(
                                "Sudan, Alkhartom ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ])),
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  bottom: MyApplication.hightClc(context, 12),
                                  right: MyApplication.widthClc(context, 6),
                                ),
                                height: MyApplication.hightClc(context, 14),
                                width: MyApplication.widthClc(context, 14),
                                child: SvgPicture.asset(
                                    "assets/AdsPics/post date.svg")),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MyApplication.hightClc(context, 12)),
                              child: AutoSizeText(
                                "19 OCT",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: AutoSizeText(
                          "150 SD / month",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Tajawal",
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

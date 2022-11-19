import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeatureOne extends StatelessWidget {
  final String? name;
  final String? pic;
  final String? cvr;
  const FeatureOne({this.name, this.pic, this.cvr});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(right: MyApplication.widthClc(context, 16)),
      height: MyApplication.hightClc(context, 250),
      width: MyApplication.widthClc(context, 305),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(1),
          elevation: 0,
          backgroundColor:
              const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        ),
        onPressed: () {},
        child: Builder(builder: (context) {
          return Column(
            children: [
              SizedBox(
                  height: MyApplication.hightClc(context, 125),
                  width: MyApplication.widthClc(context, 305),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        cvr!,
                      ),
                    ),
                  )),
              SizedBox(
                height: MyApplication.hightClc(context, 10),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            SizedBox(
                              height: MyApplication.hightClc(context, 64),
                              width: MyApplication.widthClc(context, 48),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFEDEDF4),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height:
                                          MyApplication.hightClc(context, 21),
                                      width:
                                          MyApplication.widthClc(context, 61),
                                      child: const Center(
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
                                          color: const Color(0xFFEDEDF4),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height:
                                          MyApplication.hightClc(context, 21),
                                      width:
                                          MyApplication.widthClc(context, 61),
                                      child: const Center(
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
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(startss),
                          ),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          const SizedBox(
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
                              height: 24,
                              width: 24,
                              child: SvgPicture.asset(tablee)),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          const SizedBox(
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
                              margin: const EdgeInsets.only(top: 10),
                              height: 20,
                              // width: 24,
                              child: Image.asset(clockk)),
                          SizedBox(
                            width: MyApplication.widthClc(context, 3),
                          ),
                          const SizedBox(
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

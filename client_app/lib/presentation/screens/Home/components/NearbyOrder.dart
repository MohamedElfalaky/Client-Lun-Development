import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NearbyOrder extends StatelessWidget {
  final String? name;
  final String? pic;
  const NearbyOrder({this.name, this.pic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: EdgeInsets.only(bottom: MyApplication.hightClc(context, 16)),
      height: MyApplication.hightClc(context, 143),
      width: double.infinity,
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
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: const Center(
                              child: Text(
                                "Burger",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: MyApplication.widthClc(context, 8)),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFEDEDF4),
                                borderRadius: BorderRadius.circular(5)),
                            height: MyApplication.hightClc(context, 21),
                            width: MyApplication.widthClc(context, 61),
                            child: const Center(
                              child: Text("Tasty",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFEDEDF4),
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Container(),
                    ),
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
                  width: MyApplication.widthClc(context, 5),
                ),
                const SizedBox(
                  child: Text(
                    "4.8 Rating",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: MyApplication.widthClc(context, 24),
                ),
                SizedBox(
                    height: 24, width: 24, child: SvgPicture.asset(tablee)),
                SizedBox(
                  width: MyApplication.widthClc(context, 5),
                ),
                const SizedBox(
                  child: Text(
                    "30 Table",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: MyApplication.widthClc(context, 24),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 20,
                    // width: 24,
                    child: Image.asset(clockk)),
                SizedBox(
                  width: MyApplication.widthClc(context, 5),
                ),
                const SizedBox(
                  child: Text(
                    "40 min",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFFEDEDF4),
                      borderRadius: BorderRadius.circular(10)),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Container(),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

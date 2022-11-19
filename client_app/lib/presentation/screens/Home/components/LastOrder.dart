import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class LastOrder extends StatelessWidget {
  final resturantName;
  final orderPrice;
  final resturantImage;
  final orderStateId;
  String? orderState;
  Color? orderStateColor;

  LastOrder(
      {super.key,
      this.resturantName,
      this.orderPrice,
      this.resturantImage,
      this.orderStateId});

  var orderContainer = Container(
    height: 24,
    width: 86,
    decoration: BoxDecoration(
        color: Color(0xFFEDEDF4), borderRadius: BorderRadius.circular(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 12,
          width: 14,
          child: SvgPicture.asset(reOrder),
        ),
        AutoSizeText(
          "Re-order",
          style: TextStyle(fontSize: 12, color: Colors.black),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (orderStateId == 1 ||
        orderStateId == 2 ||
        orderStateId == 3 ||
        orderStateId == 4) {
      orderState = "received";
      orderStateColor = Color.fromARGB(255, 234, 49, 234);
      orderContainer = Container();
    } else if (orderStateId == 5) {
      orderState = "delivered";
      orderStateColor = Color(0xFF31EA5C);
    } else if (orderStateId == 6) {
      orderState = "canceled";
      orderStateColor = Color.fromARGB(255, 208, 32, 32);
      // orderContainer = Container();
    } else if (orderStateId == 7) {
      orderState = "refunded";
      orderStateColor = Color.fromARGB(255, 17, 65, 221);
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(1),
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () {},
        child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
                horizontal: MyApplication.widthClc(context, 4)),
            height: MyApplication.hightClc(context, 135),
            width: MyApplication.widthClc(context, 281),
            decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          (resturantImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        width: MyApplication.widthClc(context, 60),
                        height: MyApplication.hightClc(context, 18),
                        decoration: BoxDecoration(
                            color: orderStateColor?.withOpacity(0.33),
                            border: Border.all(color: orderStateColor!),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            orderState.toString(),
                            style: TextStyle(
                                fontSize: 8,
                                // fontFamily: "Tajawal",
                                color: orderStateColor),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: AutoSizeText(
                          resturantName,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      AutoSizeText(
                        '${orderPrice.toString()} SAR',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MyApplication.hightClc(context, 8),
                      ),
                      AutoSizeText(
                        "1 X Half grilled chicken, +2 more",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MyApplication.hightClc(context, 18)),
                        // width:
                        height: MyApplication.hightClc(context, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            orderContainer,
                            SizedBox(
                              width: MyApplication.widthClc(context, 10),
                            ),
                            Container(
                              height: MyApplication.hightClc(context, 24),
                              width: MyApplication.widthClc(context, 86),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEDEDF4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 12,
                                    width: 14,
                                    child: SvgPicture.asset(rateOrder),
                                  ),
                                  AutoSizeText(
                                    "Rate order",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}

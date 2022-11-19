import 'package:client_app/app/global.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/Home/controller/HomeController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeliveryPickupAlert extends StatefulWidget {
  @override
  State<DeliveryPickupAlert> createState() => _DeliveryPickupAlertState();
}

class _DeliveryPickupAlertState extends State<DeliveryPickupAlert> {
  HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      scrollable: true,
      // title: Text('Filter'),
      content: Padding(
          padding: EdgeInsets.all(1),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              child: Center(
                child: Text(
                  "Receive method",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SvgPicture.asset(pickUpIcon),
                SizedBox(
                  width: 10,
                ),
                Text("Receive on restaurant"),
                Spacer(),
                Radio(
                    value: 0,
                    groupValue: CacheHelper.getFromShared("selectedValue"),
                    onChanged: (value) {
                      setState(() {
                        CacheHelper.saveIntToShared(
                            "selectedValue", int.parse(value.toString()));
                      });

                      _homeController.homeAPIs(
                          context, lat, long, _homeController.groupValue);
                      ;
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  deliveryIcon,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Receive at home"),
                Spacer(),
                Radio(
                    value: 1,
                    groupValue: CacheHelper.getFromShared("selectedValue"),
                    onChanged: (value) {
                      setState(() {
                        CacheHelper.saveIntToShared(
                            "selectedValue", int.parse(value.toString()));
                      });

                      _homeController.homeAPIs(
                          context, lat, long, _homeController.groupValue);
                      Navigator.pop(context);
                    })
              ],
            )
          ])),
    );
  }
}

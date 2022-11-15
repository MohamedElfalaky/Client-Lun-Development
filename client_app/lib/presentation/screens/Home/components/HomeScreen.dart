import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/app/global.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/BestAdsItem.dart';
import 'package:client_app/presentation/screens/Home/components/FeatureOne.dart';
import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
import 'package:client_app/presentation/screens/Home/components/LastOrder.dart';
import 'package:client_app/presentation/screens/Home/components/NearbyOrder.dart';
import 'package:client_app/presentation/screens/Home/components/Wallet.dart';
import 'package:client_app/presentation/screens/Home/controller/HomeController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            margin: EdgeInsets.only(
              left: MyApplication.widthClc(context, 16),
              right: MyApplication.widthClc(context, 24),
              top: MyApplication.widthClc(context, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wallet(),
                SizedBox(
                  height: MyApplication.hightClc(context, 36),
                ),

                AutoSizeText(
                  "Receive Method",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Tajawal"),
                ),

                SizedBox(
                  height: MyApplication.hightClc(context, 20),
                ),

                BlocBuilder<LastOrdersCubit, LastOrderState>(
                  builder: (context, state) {
                    return Container(
                        height: MyApplication.hightClc(context, 48),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            {"lable": "PickUp", "pic": pickUpIcon, "value": 0},
                            {
                              "lable": "Delivery",
                              "pic": deliveryIcon,
                              "value": 1
                            }
                          ].map((listItem) {
                            return Container(
                              padding: EdgeInsets.all(12.sp),
                              height: double.infinity,
                              width: MyApplication.widthClc(context, 182),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height:
                                            MyApplication.hightClc(context, 20),
                                        width:
                                            MyApplication.widthClc(context, 20),
                                        child: SvgPicture.asset(
                                          listItem["pic"].toString(),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MyApplication.widthClc(context, 5),
                                      ),
                                      SizedBox(
                                          child: Text(
                                              listItem["lable"].toString())),
                                    ],
                                  ),
                                  SizedBox(
                                    width: MyApplication.widthClc(context, 20),
                                    child: Radio(
                                      value: int.parse(
                                          listItem["value"].toString()),
                                      groupValue: CacheHelper.getFromShared(
                                          "selectedValue"),
                                      onChanged: (value) => setState(() {
                                        CacheHelper.saveIntToShared(
                                            "selectedValue",
                                            int.parse(value.toString()));
                                        _homeController.homeAPIs(context, lat,
                                            long, _homeController.groupValue);
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ));
                  },
                ),

                /////////////////////////////
                ///

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MyApplication.hightClc(context, 26),
                    ),
                    AutoSizeText(
                      "Last Orders",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Tajawal"),
                    ),
                    SizedBox(
                      height: MyApplication.hightClc(context, 20),
                    ),
                    BlocBuilder<LastOrdersCubit, LastOrderState>(
                      builder: (context, state) {
                        return Container(
                            color: Theme.of(context).colorScheme.secondary,
                            height: MyApplication.hightClc(context, 135),
                            width: double.infinity,
                            child: state is LastOrderSuccess
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.myLastOrderModel.data?.length,
                                    itemBuilder: (context, index) {
                                      return LastOrder(
                                        resturantName: state.myLastOrderModel
                                            .data?[index].market?.name,
                                        orderPrice: state.myLastOrderModel
                                            .data?[index].payment?.price,
                                        orderStateId: state.myLastOrderModel
                                            .data?[index].orderStatusId,
                                        resturantImage: state
                                                    .myLastOrderModel
                                                    .data?[index]
                                                    .market
                                                    ?.hasMedia ==
                                                true
                                            ? state
                                                .myLastOrderModel
                                                .data![index]
                                                .market
                                                ?.media![1]
                                                .thumb
                                            : "no media",
                                      );
                                    })
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.amber,
                                    ),
                                  ));
                      },
                    ),
                  ],
                ),

                /////////////////////////////
                ///

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MyApplication.hightClc(context, 26),
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          "Nearby",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Tajawal"),
                        ),
                        Spacer(),
                        AutoSizeText(
                          "View all",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: "Tajawal"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MyApplication.hightClc(context, 20),
                    ),
                    BlocBuilder<NearbyCubit, NearbyState>(
                      builder: (context, state) {
                        return Container(
                            // width: 400,
                            height: MyApplication.hightClc(context, 143),
                            // height: MyApplication.hightClc(context, 460),
                            child: state is NearbySuccess
                                ? ListView.builder(
                                    itemCount: state.myNearbyModel.data!.length,
                                    itemBuilder: (context, index) =>
                                        NearbyOrder(
                                            name: state.myNearbyModel
                                                .data?[index].name,
                                            pic: ""),
                                  )
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ));
                      },
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MyApplication.hightClc(context, 26),
                    ),
                    AutoSizeText(
                      "Features",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Tajawal"),
                    ),
                    SizedBox(
                      height: MyApplication.hightClc(context, 20),
                    ),
                    Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            FeatureOne(),
                            FeatureOne(),
                            FeatureOne(),
                            FeatureOne(),
                          ]),
                        )),
                    SizedBox(
                      height: MyApplication.hightClc(context, 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/app/global.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/data/cubits/PopularCubit/PopularCubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/FeatureOne.dart';
import 'package:client_app/presentation/screens/Home/components/LastOrder.dart';
import 'package:client_app/presentation/screens/Home/components/NearbyOrder.dart';
import 'package:client_app/presentation/screens/Home/components/Wallet.dart';
import 'package:client_app/presentation/screens/Home/controller/HomeController.dart';
import 'package:client_app/style/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = HomeController();

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
                const Wallet(),
                SizedBox(
                  height: MyApplication.hightClc(context, 36),
                ),

                const AutoSizeText(
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
                    return SizedBox(
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
                              padding: const EdgeInsets.all(12),
                              height: double.infinity,
                              width: MyApplication.widthClc(context, 182),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
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
                    const AutoSizeText(
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
                                            : noReturant,
                                      );
                                    })
                                : const Center(
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
                        const AutoSizeText(
                          "Nearby",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Tajawal"),
                        ),
                        const Spacer(),
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
                            // height: MyApplication.hightClc(context, 143),
                            child: state is NearbySuccess
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.myNearbyModel.data!.length,
                                    itemBuilder: (context, index) =>
                                        NearbyOrder(
                                            name: state.myNearbyModel
                                                .data?[index].name,
                                            pic: state
                                                        .myNearbyModel
                                                        .data![index]
                                                        .hasMedia ==
                                                    true
                                                ? state.myNearbyModel
                                                    .data![index].media!
                                                    .where((element) =>
                                                        element
                                                            .collectionName ==
                                                        'avatar')
                                                    .first
                                                    .thumb
                                                : noReturant))
                                : const Center(
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
                    const AutoSizeText(
                      "Features",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Tajawal"),
                    ),
                    SizedBox(
                      height: MyApplication.hightClc(context, 20),
                    ),
                    BlocBuilder<PopularCubit, PopularState>(
                      builder: (context, state) {
                        return SizedBox(
                            height: MyApplication.hightClc(context, 250),
                            width: double.infinity,
                            child: state is PopularSuccess
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        state.myPopularModel.data!.length,
                                    itemBuilder: (context, index) => FeatureOne(
                                          name: state
                                              .myPopularModel.data![index].name,
                                          pic: state.myPopularModel.data?[index]
                                                      .hasMedia ==
                                                  true
                                              ? state.myPopularModel
                                                  .data![index].media!
                                                  .where((element) =>
                                                      element.collectionName ==
                                                      'avatar')
                                                  .first
                                                  .thumb
                                              : noReturant,
                                          cvr: state.myPopularModel.data?[index]
                                                      .hasMedia ==
                                                  true
                                              ? state.myPopularModel
                                                  .data![index].media!
                                                  .where((element) =>
                                                      element.collectionName ==
                                                      'cover')
                                                  .first
                                                  .thumb
                                              : noReturantCover,
                                        ))
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                      },
                    ),
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

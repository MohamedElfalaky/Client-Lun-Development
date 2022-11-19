import 'package:badges/badges.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/helpers/LocationService.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/Home/components/HomeScreen.dart';
import 'package:client_app/presentation/screens/Home/components/MyFloating.dart';
import 'package:client_app/presentation/screens/Home/components/HomeAppBar.dart';
import 'package:client_app/presentation/screens/Home/components/DeliveryPickupAlert.dart';
import 'package:client_app/presentation/screens/Home/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:location/location.dart';

import '../../../app/global.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController _homeController = HomeController();

  @override
  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 5000));
    //  اظهر الديالوج بعد ٥ ثواني بعد ما الكونتكست في الinitstate يكون اتبني

    // showDialog(
    //   context: context,
    //   builder: (BuildContext myContext) {
    //     return DeliveryPickupAlert();
    //   },
    // );
  }

// حتة اسنك اويت عنب
  void initState() {
    super.initState();
    asyncronaceInsideInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere

      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            toolbarHeight: MyApplication.hightClc(context, 90),
            elevation: 0,
            title: myAppBar(),
          ),
          body: HomeScreen(),
          floatingActionButton: Badge(
            borderSide: BorderSide(color: Colors.white),
            position: BadgePosition.topEnd(top: -7, end: -1),
            badgeContent: Text(
              "3",
              style: TextStyle(color: Colors.white),
            ),
            child: MyFloating(),
          )),
    );
  }

  Future<LocationData> myGetLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);
      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsFixed(2);
        country = placeMark?.country;
        area = placeMark?.administrativeArea;
        street = placeMark?.street;
        wholeLocation = "${country},${area},${street}";
      });
    }
    return locationData!;
  }

  void asyncronaceInsideInit() async {
    // myGetLocation();
    LocationData longLat = await myGetLocation();
    // Future.delayed(Duration(milliseconds: 100)).then((value) => null);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      CacheHelper.removeFromShared(
          "isDailogFirstAppearance"); // بمسح ظهور الدايالوج من الكاش

      //////

      //SchedulerBinding بتاكد ان الكونتكست اتبنى //
      // you have access to context in initState as others said. The only problem here in initState build function is not executed yet. So this context is kind of empty.To solve this, you can use SchedulerBinding://
      if (_homeController.isDailogFirstAppearance == null) {
        // عشان تظهر اول مره بس
        showDialog(
          barrierDismissible: false, //prevent alert to pop up on click outside
          context: context,
          builder: (BuildContext myContext) {
            return WillPopScope(
                child: DeliveryPickupAlert(),
                onWillPop: () => Future.value(
                    false)); //prevent alert to pop up on back button click
          },
        );
        CacheHelper.saveBoolToShared("isDailogFirstAppearance", true);
      } else {
        _homeController.homeAPIs(context, longLat.latitude!.toStringAsFixed(2),
            longLat.longitude!.toStringAsFixed(2), _homeController.groupValue);
      }
    });

    // _showDialog(); //   اظهر الديالوج بعد ٥ ثواني بعد ما الكونتكست في الinitstate يكون اتبني
  }
}

import 'dart:ui';

import 'package:client_app/app/global.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/helpers/LocationService.dart';
import 'package:client_app/presentation/screens/Home/components/LastOrder.dart';
import 'package:flutter/material.dart';

class HomeController {
  ///vars

  int? groupValue = CacheHelper.getFromShared("selectedValue");
  bool? isDailogFirstAppearance =
      CacheHelper.getBoolFromShared("isDailogFirstAppearance");

  ///methods

  void myGetLocation(setState) async {
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
  }

  void homeAPIs(BuildContext context, lat, long, receiveMethod) {
    LastOrdersCubit.get(context).getLastOrder();
    NearbyCubit.get(context).getNearby(lat, long, receiveMethod);
  }
}

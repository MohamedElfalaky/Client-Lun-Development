import 'package:client_app/data/cubits/BalanceCubit/BalanceCubit.dart';
import 'package:client_app/data/cubits/LastOrders/LastOrders_cubit.dart';
import 'package:client_app/data/cubits/NearbyCubit/NearbyCubit.dart';
import 'package:client_app/data/cubits/PopularCubit/PopularCubit.dart';
import 'package:client_app/data/cubits/SearchCubit/SearchCubit.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:client_app/presentation/screens/Search/components/SearchScreen.dart';
import 'package:flutter/material.dart';

class SearchController {
  ///vars
  final TextEditingController controller = TextEditingController();

  ///methods

  void SearchAPIs(context) {
    SearchCubit.get(context).getSearch(controller.text);
  }
}

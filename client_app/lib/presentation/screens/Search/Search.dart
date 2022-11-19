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
import 'package:client_app/presentation/screens/Search/components/SearchScreen.dart';
import 'package:client_app/presentation/screens/Search/controller/SearchController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../app/global.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();
    _searchController.SearchAPIs(context);
  }

  @override
  void dispose() {
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
          body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView(
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: MyApplication.hightClc(context, 900),
              margin: EdgeInsets.only(
                left: MyApplication.widthClc(context, 16),
                right: MyApplication.widthClc(context, 24),
                top: MyApplication.widthClc(context, 24),
              ),
              child: SearchScreen(),
            )
          ],
        ),
      )),
    );
  }
}

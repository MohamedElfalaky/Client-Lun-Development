import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/MyOrders/All.dart';
import 'package:client_app/presentation/screens/MyOrders/Cancel.dart';
import 'package:client_app/presentation/screens/MyOrders/Delivered.dart';
import 'package:client_app/presentation/screens/MyOrders/InProgress.dart';
import 'package:client_app/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = '/myOrdersScreen';
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // toolbarHeight: 100,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        leadingWidth: 65,
        toolbarHeight: 48,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Orders'.tr(context),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.background),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: const MenuWidget(),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              // height: 50,
              height: 100,
              // margin: const EdgeInsets.only(bottom: 20),

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  TabBar(
                    padding: const EdgeInsets.all(8),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                    labelColor: Theme.of(context).colorScheme.background,
                    indicatorColor: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                    indicatorWeight: 2,
                    indicator: const BoxDecoration(

                        // color: Colors.white,
                        // borderRadius: BorderRadius.circular(5),
                        ),
                    controller: _tabController,
                    tabs: [
                      Tab(
                        height: 70,
                        text: 'All'.tr(context),
                      ),
                      Tab(
                        text: 'Delivered'.tr(context),
                      ),
                      Tab(
                        text: 'In Progress'.tr(context),
                      ),
                      Tab(
                        text: 'Canceled'.tr(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  All(),
                  DeliveredOrders(),
                  // const InProgress(),
                  InProgress(),
                  // const SizedBox(),
                  Cancel(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
}

import 'package:client_app/presentation/screens/LogIn/LogIn.dart';
import 'package:client_app/presentation/screens/MyOrders/MyOrders.dart';
import 'package:client_app/presentation/screens/MyWallet/MyWalletScreen.dart';
import 'package:client_app/presentation/screens/Registration/Registeration.dart';
import 'package:client_app/presentation/screens/SettingsScreen/SettingsScreen.dart';
import 'package:client_app/presentation/widgets/Drawer/MenuItem.dart';
import 'package:client_app/presentation/widgets/Drawer/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final _controller = ZoomDrawerController();
  DrawerMenuItem currentItem = MenuItems.home;
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        controller: _controller,
        style: DrawerStyle.defaultStyle,
        menuScreenWidth: double.infinity,
        // controller: _controller,
        menuScreen: MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
              // ZoomDrawer.of(context)!.toggle();
              _controller.toggle!();
            });

            // ZoomDrawer.of(OneContext.instance.context!)!.close();
          },
        ),
        mainScreen: getScreen(),
        borderRadius: 30.0,
        // showShadow: true,
        // angle: -20.0,
        angle: 0.0,
        // slideWidth: 250.0,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      );

  Widget getScreen() {
    if (currentItem == MenuItems.about) {
      return const LogIn();
    } else if (currentItem == MenuItems.home) {
      return const Registration();
    } else if (currentItem == MenuItems.settings) {
      return const SettingsScreen();
    } else if (currentItem == MenuItems.orders) {
      return const MyOrdersScreen();
    } else if (currentItem == MenuItems.wallet) {
      return const MyWallet();
    } else {
      return const Registration();
    }
  }
}

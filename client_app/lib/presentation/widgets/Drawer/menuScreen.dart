import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/widgets/Drawer/MenuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:one_context/one_context.dart';

class MenuItems {
  static DrawerMenuItem home = DrawerMenuItem(
    title: 'Home'.tr(OneContext.instance.context!),
    icon: Icons.home_filled,
  );
  static DrawerMenuItem orders = DrawerMenuItem(
    title: 'My Orders'.tr(OneContext.instance.context!),
    icon: Icons.shopping_cart,
  );
  static DrawerMenuItem wallet = DrawerMenuItem(
    title: 'My Wallet'.tr(OneContext.instance.context!),
    icon: Icons.account_balance_wallet,
  );
  static DrawerMenuItem offers = DrawerMenuItem(
    title: 'Offers'.tr(OneContext.instance.context!),
    icon: Icons.local_offer,
  );
  static DrawerMenuItem notifications = DrawerMenuItem(
    title: 'Notifications'.tr(OneContext.instance.context!),
    icon: Icons.notifications,
  );
  static DrawerMenuItem about = DrawerMenuItem(
    title: 'About'.tr(OneContext.instance.context!),
    icon: Icons.info,
  );
  static DrawerMenuItem privacy = DrawerMenuItem(
    title: 'Privacy Policy'.tr(OneContext.instance.context!),
    icon: Icons.privacy_tip,
  );
  static DrawerMenuItem terms = DrawerMenuItem(
    title: 'Contact Us'.tr(OneContext.instance.context!),
    icon: Icons.contact_support,
  );
  static DrawerMenuItem faq = DrawerMenuItem(
    title: 'FAQ'.tr(OneContext.instance.context!),
    icon: Icons.question_answer,
  );
  static DrawerMenuItem settings = DrawerMenuItem(
    title: 'Settings'.tr(OneContext.instance.context!),
    icon: Icons.settings,
  );

  static final all = <DrawerMenuItem>[
    MenuItems.home,
    MenuItems.orders,
    MenuItems.wallet,
    MenuItems.offers,
    MenuItems.notifications,
    MenuItems.about,
    MenuItems.privacy,
    MenuItems.terms,
    MenuItems.faq,
    MenuItems.settings,
  ];
}

class MenuScreen extends StatelessWidget {
  final DrawerMenuItem currentItem;
  final ValueChanged<DrawerMenuItem> onSelectedItem;
  const MenuScreen(
      {super.key, required this.currentItem, required this.onSelectedItem});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 20),
                CircleAvatar(
                  backgroundColor: const Color.fromRGBO(233, 128, 138, 1),
                  radius: 24,
                  child: Image.network(
                    'https://www.woolha.com/media/2020/03/eevee.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Name',
                  style: TextStyle(
                    color: HexColor("#EDEDF4"),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/Images/svg/Logo.svg',
                height: 50.46,
                width: 36.31,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(DrawerMenuItem menuItem) => ListTileTheme(
        selectedColor: Colors.white70,
        child: ListTile(
          selectedTileColor: Colors.red,
          selected: currentItem == menuItem,
          minLeadingWidth: 20,
          title: Text(
            menuItem.title,
            style: TextStyle(color: HexColor("#EDEDF4"), fontSize: 20),
          ),
          leading: Icon(
            menuItem.icon,
            color: HexColor("#EDEDF4"),
            size: 24,
          ),
          onTap: () {
            onSelectedItem(menuItem);
          },
        ),
      );
}

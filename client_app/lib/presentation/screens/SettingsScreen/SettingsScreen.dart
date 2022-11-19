import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/SettingsScreen/components/SettingsItem.dart';
import 'package:client_app/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:one_context/one_context.dart';

class SettingsMenuItems {
  static SettingsMenuItem receiveMethod = SettingsMenuItem(
    title: 'Receive method'.tr(OneContext.instance.context!),
    svg: SvgPicture.asset('assets/Images/svg/hand.svg', width: 24),
    trailingSvg: SvgPicture.asset('assets/Images/svg/right-arrow.svg',
        width: 24, color: HexColor("#363537")),
  );
  static SettingsMenuItem language = SettingsMenuItem(
    title: 'Language'.tr(OneContext.instance.context!),
    svg: SvgPicture.asset(
      'assets/Images/svg/language-com.svg',
      width: 24,
    ),
    trailingSvg: SvgPicture.asset(
      'assets/Images/svg/right-arrow.svg',
      color: HexColor("#363537"),
      width: 24,
    ),
  );
  static SettingsMenuItem paymentMethod = SettingsMenuItem(
    title: 'Payment Method'.tr(OneContext.instance.context!),
    svg: SvgPicture.asset(
      'assets/Images/svg/paper.svg',
      width: 24,
    ),
    trailingSvg: SvgPicture.asset('assets/Images/svg/right-arrow.svg',
        width: 24, color: HexColor("#363537")),
  );

  static SettingsMenuItem notifications = SettingsMenuItem(
    title: 'Notifications'.tr(OneContext.instance.context!),
    svg: SvgPicture.asset(
      'assets/Images/svg/paper.svg',
      width: 24,
    ),
  );

  static SettingsMenuItem deleteAccount = SettingsMenuItem(
    title: 'Delete Account'.tr(OneContext.instance.context!),
    svg: SvgPicture.asset(
      'assets/Images/svg/minus.svg',
      width: 24,
    ),
    hasTrailingSvg: false,
  );

  static final all = <SettingsMenuItem>[
    SettingsMenuItems.receiveMethod,
    SettingsMenuItems.language,
    SettingsMenuItems.paymentMethod,
    SettingsMenuItems.notifications,
    SettingsMenuItems.deleteAccount,
  ];
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          // toolbarHeight: 100,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).primaryColor,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Theme.of(context).primaryColor),
          leadingWidth: 65,
          toolbarHeight: 60,
          elevation: 0,
          centerTitle: true,
          title: Container(
            margin: const EdgeInsets.only(top: 16),
            child: Text(
              'Settings'.tr(context),
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.background),
            ),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 16, top: 16),
            child: const BackMenuWidget(),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#F5504C1A").withOpacity(0.1),

                      blurRadius: 0,
                      offset: const Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ...SettingsMenuItems.all.map(buildMenuItem).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(SettingsMenuItem menuItem) => ListTileTheme(
        selectedColor: Colors.white70,
        child: ListTile(
          // selectedTileColor: Colors.red,
          // selected: currentItem == menuItem,
          minLeadingWidth: 20,
          title: Text(
            menuItem.title,
            style: TextStyle(color: HexColor("#363537"), fontSize: 20),
          ),
          leading: menuItem.svg,
          trailing: menuItem.trailingSvg ??
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: HexColor("#F5504C").withOpacity(0.1),
                activeColor: HexColor("#F5504C"),
              ),
          onTap: () {
            setState(() {
              isSwitched = !isSwitched;
              // print(isSwitched);
            });
            print(isSwitched);
            // onSelectedItem(menuItem);
          },
        ),
      );
}

import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/MyWallet/components/TransactionCard.dart';
import 'package:client_app/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
            child: const BackMenuWidget(),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/myWallet');
                  },
                  child: SvgPicture.asset(
                    "assets/Images/svg/wallet.svg",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                height: 50,
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
              Stack(
                children: [
                  SizedBox(
                    width: 380,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 348,
                          height: 81,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(.2),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 86,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .backgroundColor
                                          .withOpacity(.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 48,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SvgPicture.asset(
                                    "assets/Images/svg/wallet.svg",
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Available Credit in Wallet".tr(context),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "457.00",
                                    style: TextStyle(
                                        fontSize: 28,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "SAR",
                                    style: TextStyle(
                                        height: 2,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recent Transactions".tr(context),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline5!.color),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TransactionCard(),
            ],
          ),
        ),
      ),
    );
  }
}

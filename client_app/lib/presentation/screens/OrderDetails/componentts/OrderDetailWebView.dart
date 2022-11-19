import 'dart:io';

import 'package:client_app/app/constants.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderDetailWebView extends StatefulWidget {
  final String orderId;

  const OrderDetailWebView({super.key, required this.orderId});
  @override
  State<OrderDetailWebView> createState() => _OrderDetailWebViewState();
}

class _OrderDetailWebViewState extends State<OrderDetailWebView> {
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
          child: const BackMenuWidget(),
        ),
      ),
      body: WebView(
        initialUrl: '$baseURL/orders/qrcode/${widget.orderId}',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  @override
  void initState() {
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }
}

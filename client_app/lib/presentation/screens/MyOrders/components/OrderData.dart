import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderButtons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatelessWidget {
  bool isDelivered;
  bool isInProgress;
  bool isCanceled;
  bool isRefunded;
  bool isOrderDetail;
  dynamic? order;
  OrderDetails(
      {Key? key,
      this.isDelivered = false,
      this.isInProgress = false,
      this.isCanceled = false,
      this.isRefunded = false,
      this.isOrderDetail = false,
      this.order})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat.yMMMMd()
              .add_jm()
              .format(DateTime.parse(order!.market!.createdAt!)),
          style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .headline5!
                  .color!
                  .withOpacity(0.5),
              fontSize: 14,
              height: 1.7),
        ),
        Text(
          "${"Order ID".tr(context)} ${order!.id}",
          style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .headline5!
                  .color!
                  .withOpacity(0.5),
              fontSize: 14,
              height: 1.7),
        ),
        Text(
            "${"items".tr(context)} ${isOrderDetail ? order!.productOrders!.length : order!.itemCount}",
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline5!
                    .color!
                    .withOpacity(0.5),
                fontSize: 14,
                height: 1.7)),
        const SizedBox(
          height: 10,
        ),
        isOrderDetail
            ? const SizedBox.shrink()
            : OrderButtons(
                isCanceled: isCanceled,
                isDelivered: isDelivered,
                isInProgress: isInProgress,
                isRefunded: isRefunded,
              )
      ],
    );
  }
}

class OrderState extends StatelessWidget {
  bool isDelivered;
  bool isInProgress;
  bool isCanceled;
  bool isRefunded;
  OrderState({
    Key? key,
    this.isDelivered = false,
    this.isInProgress = false,
    this.isCanceled = false,
    this.isRefunded = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isInProgress ? 102 : 82,
      height: 27,
      decoration: BoxDecoration(
        color: isDelivered
            ? const Color.fromARGB(1, 49, 234, 92).withOpacity(0.2)
            : isInProgress
                ? const Color.fromARGB(1, 255, 204, 0).withOpacity(0.2)
                : const Color.fromARGB(1, 255, 0, 0).withOpacity(0.2),
        border: Border.all(
            color: isDelivered
                ? HexColor("#31EA5C")
                : isInProgress
                    ? HexColor("#CACA14")
                    : Theme.of(context).colorScheme.primary,
            width: 1,
            strokeAlign: StrokeAlign.outside),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          isDelivered
              ? "Delivered".tr(context)
              : isInProgress
                  ? "In Progress".tr(context)
                  : isCanceled
                      ? "Canceled".tr(context)
                      : "Refunded".tr(context),
          style: TextStyle(
            color: isDelivered
                ? HexColor("#31EA5C")
                : isInProgress
                    ? HexColor("#CACA14")
                    : Theme.of(context).colorScheme.primary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class OrderTitle extends StatelessWidget {
  dynamic? order;
  OrderTitle({Key? key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          order!.market!.name!,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline5!.color,
            fontSize: 20,
            height: 2.2,
          ),
        ),
        Text(
          order!.payment!.price!.toString(),
          style: TextStyle(
            color: Theme.of(context).textTheme.headline5!.color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

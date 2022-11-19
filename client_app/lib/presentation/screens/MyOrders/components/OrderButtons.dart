import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderButtons extends StatelessWidget {
  bool isDelivered;
  bool isInProgress;
  bool isCanceled;
  bool isRefunded;

  OrderButtons({
    Key? key,
    this.isDelivered = false,
    this.isInProgress = false,
    this.isCanceled = false,
    this.isRefunded = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isDelivered
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(132, 40),
                  elevation: 0,
                  foregroundColor: Theme.of(context).textTheme.headline5!.color,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/Images/svg/return.svg",
                      matchTextDirection: true,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Re-Order".tr(context),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(132, 40),
                  elevation: 0,
                  foregroundColor: Colors.black,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/Images/svg/rating (1).svg",
                      matchTextDirection: true,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Rate-Order".tr(context),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          )
        : isInProgress
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(145, 40),
                  maximumSize: const Size(145, 40),
                  elevation: 0,
                  foregroundColor: Theme.of(context).colorScheme.background,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/Images/svg/track-order.svg",
                      matchTextDirection: true,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Track Order".tr(context),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            : isRefunded
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(145, 40),
                      maximumSize: const Size(145, 40),
                      elevation: 0,
                      foregroundColor:
                          Theme.of(context).textTheme.headline5!.color,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/Images/svg/return.svg",
                          matchTextDirection: true,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Re-Order".tr(context),
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline5!.color,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
  }
}

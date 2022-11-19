import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class BackMenuWidget extends StatelessWidget {
  const BackMenuWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
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
            ZoomDrawer.of(context)!.toggle();
          },
          child: const Text(
            "❮",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      );
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 48,
        width: 48,
        child: IconButton(
          icon: SvgPicture.asset(
            "assets/Images/svg/charts.svg",
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
      );
}
